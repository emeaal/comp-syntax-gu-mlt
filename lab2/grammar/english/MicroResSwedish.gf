resource MicroResSwedish = open Prelude in {

param
  Number = Sing | Plur ;
  Gender = Utr | Neut ;
  Case = Nom | Geni | Obj ;
  Species = Def | Indef ;
  Degree = Positive ; --| Comparative | Superlative ;
  Voice = Active | Passive ;

  VForm = Inf | Pres | Pret | Sup;

  Art = Article | NoArticle ;

  Agreement = Agr Number ; -- Species Gender ;


oper
  Noun : Type = { s : Number => Species => Case => Str ;  
                  g : Gender ;
  } ;

  mkNoun1 : Str -> Gender -> Noun --takes one string+gender from lexicon
    = \sg_indef,gender -> case gender of {
    Neut => case sg_indef of {
      vatt + "en" => mkNounGen sg_indef (vatt + "net") sg_indef (vatt + "nen") gender ;
      x + "n"     => mkNounGen sg_indef (x + "net") sg_indef (x + "nen") gender ;
      v + "in"    => mkNounGen sg_indef (v + "net") sg_indef (v + "ner") gender ;
      a + "le"    => mkNounGen sg_indef (sg_indef + "t") sg_indef (sg_indef + "nen") gender ;
      _           => mkNounGen sg_indef (sg_indef + "et") sg_indef (sg_indef + "en") gender 
    } ;
    Utr => case sg_indef of {
      bebi + "is" => mkNoun2 sg_indef (bebi + "isar") gender ;
      cyk + "el"  => mkNoun2 sg_indef (cyk + "lar") gender ;
      ka + "tt"   => mkNoun2 sg_indef (ka + "tter") gender ;
      pojk + "e"  => mkNoun2 sg_indef (pojk + "ar") gender ;
      _ + "o"     => mkNoun2 sg_indef (sg_indef + "r") gender ;
      x + "a"     => mkNoun2 sg_indef (x + "or") gender ;
      x + "ik"  => mkNoun2 sg_indef (sg_indef) gender ;
      _           => mkNoun2 sg_indef (sg_indef + "ar") gender 
    }
  } ;

  mkNoun2 : Str -> Str -> Gender -> Noun --takes two strings+gender either from lexicon or from mknoun1 above
    = \ sg_indef, pl_indef, gender -> case gender of {
      Neut => case sg_indef of {
        x + "le"  => mkNounGen sg_indef (sg_indef + "t") pl_indef (sg_indef + "na") gender ;
        _         => mkNounGen sg_indef (sg_indef + "et") pl_indef (pl_indef + "na") gender
      } ;
      Utr => case sg_indef of {
        x + "or"      => mkNounGen sg_indef (sg_indef + "n") pl_indef (pl_indef + "na") gender ;
        x + ("r"|"a") => mkNounGen sg_indef (x + "an") pl_indef (x + "orna") gender ;
        pojk + "e"    => mkNounGen sg_indef(pojk + "en") pl_indef (pl_indef + "na") gender ;
        _ + "o"       => mkNounGen sg_indef (sg_indef + "n") pl_indef (pl_indef + "na") gender ;
        cyk + "el"    => mkNounGen sg_indef (cyk + "eln") pl_indef (pl_indef + "na") gender ;
        k + "or"      => mkNounGen sg_indef (k + "on") pl_indef (pl_indef + "na") gender ;
        x + ("ik"|"lk")      => mkNounGen sg_indef (sg_indef + "en") pl_indef (pl_indef) gender ;
        _             => mkNounGen sg_indef (sg_indef + "en") pl_indef (pl_indef + "na" ) gender 
      }
    } ;

    mkNounGen : Str -> Str -> Str -> Str -> Gender -> Noun --4 strings, make genitive form from tables
    = \ sg_indef, sg_def, pl_indef, pl_def, gender -> {
      s = table {
        Sing => table {
          Indef => table {
            Geni => case sg_indef of {
              _ + "s" => sg_indef ; --add similar for all forms, ending with S
              _ => sg_indef + "s" 
            } ;
            _ => sg_indef
          } ;
          Def => table {
            Geni => sg_def + "s" ;
            _ => sg_def
          }
        } ;
        Plur => table {
          Indef => table {
            Geni => pl_indef + "s" ;
            _ => pl_indef
          } ;
          Def => table {
            Geni => pl_def + "s" ;
            _ => pl_def
          }
        }
      } ;
      g = gender ;
    } ;


---verbs----

Verb : Type = {s : VForm => Str} ;

Verb2 : Type = Verb ** {c : Str} ; --transitive verbs

be_Verb : Verb = mkVerb "vara" "är" "varit" "var" ;


  mkVerb : (inf,pres,pret,Sup : Str) -> Verb
    = \inf,pres,pret,Sup -> {
    s = table {
      Inf => inf ;
      Pres => pres ;
      Pret => pret ;
      Sup => Sup 
      }
    } ;

  regVerb : (inf : Str) -> Verb = \inf ->
    mkVerb inf (inf + "r") (inf + "de") (inf + "t") ;


  -- regular verbs with predictable variations
  smartVerb : Str -> Verb = \inf -> case inf of {
    x + "a" => case x of {
      _ + ("s"|"öp"|"ek")         => mkVerb inf (x + "er") (x + "te") (x + "t") ;
      _ + "sk"                    => mkVerb inf (x + "ar") (x + "ade") (x + "at") ;
      _ + "imm"                   => mkVerb inf (x + "ar") (x + "ade") (x + "at") ;
      _ + ("k"|"yt"|"mm")         => mkVerb inf (x + "er") (x + "ade") (x + "at") ; 
      _ + "ät"                    => mkVerb inf (x + "er") (inf + "de") (inf + "t") ;
      _ + ("m"|"t"|"pp"|"d"|"ek") => mkVerb inf (inf + "r") (inf + "de") (inf + "t") ;
      _ + ("v"|"g")               => mkVerb inf (x + "er") (x + "de") (x + "t") ;
      _ + "r"                     => mkVerb inf (x) (x + "de") (x + "t") ;
      _                           => mkVerb inf (x + "t") (x + "er") (x + "s")
    } ;            
    le + "va"                     => mkVerb inf (le + "ver") (le + "vde") (le + "vt") ;
     _ => regVerb inf
     } ;


  -- normal irregular verbs e.g. drink,drank,drunk
  irregVerb : (inf,pret,Sup : Str) -> Verb =
    \inf,pret,Sup ->
      let verb = smartVerb inf
      in mkVerb inf (verb.s ! Pres) pret Sup ;   


  ---adjectives---

  Adjective : Type = {
      s : Degree => Number => Gender => Species => Str ; 
  } ;

  mkAdjective1 : Str -> Adjective --maybe fix irregular adjectives more nicely
    = \pos_utr -> case pos_utr of {
      x + "mal" => mkAdjective4 pos_utr (x + "malt") (x + "la") (x + "la") ;
      x + ("rt"|"r"|"n"|"l"|"g") => mkAdjective4 pos_utr (pos_utr) (pos_utr + "a") (pos_utr + "a") ;
      x + "t" => mkAdjective4 pos_utr (pos_utr) (pos_utr) (pos_utr + "a") ;
      x + "a" => mkAdjective4 pos_utr (pos_utr) (pos_utr) (pos_utr) ;
      x + "y" => mkAdjective4 pos_utr (pos_utr) (pos_utr + "tt") (pos_utr + "a") ;
      x + "d" => mkAdjective4 pos_utr (x + "tt") (pos_utr + "a") (pos_utr + "a") ;
      bl + "å" => mkAdjective4 pos_utr (pos_utr + "tt") (pos_utr + "a") (pos_utr + "a") ;
      x + "o" => mkAdjective4 pos_utr (pos_utr) (pos_utr) (pos_utr) ;
      x =>  mkAdjective4 pos_utr (pos_utr) (x + "t") (x + "a") 
    } ;

  mkAdjective2 : Str -> Str -> Adjective --maybe fix irregular adjectives more nicely
    = \pos_utr,pos_neutr -> case pos_utr of {
      li + "ten"       => mkAdjective4 pos_utr (pos_neutr) ("små") ("lilla") ;
      x + ("y"|"n"|"d"|"å"|"l"|"g")    => mkAdjective4 pos_utr (pos_neutr) (pos_utr + "a") (pos_utr + "a") ;
      x =>  mkAdjective4 pos_utr (x + "t") (pos_utr + "a") (pos_utr + "a") 
    } ;
  

  mkAdjective4 : Str -> Str -> Str -> Str -> Adjective
    = \pos_utr,pos_neutr,pos_plu,def_plu -> {
      s = table {
        Positive => table {
          Sing => table {
            Utr  => table {
              Def => def_plu ;
              Indef => pos_utr
            } ;
            Neut => table {
              Def => def_plu ;
              Indef => pos_neutr
            }
          } ;
          Plur => table {
            _ => table {
              Def => def_plu ;
              Indef => pos_plu
            }
          }
        }
      }
    } ;

}