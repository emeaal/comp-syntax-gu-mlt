resource MicroResSwedish = open Prelude in {

param
  Number = Sing | Plur ;
  Gender = Utr | Neut ;
  Case = Nom | Geni ;
  Species = Def | Indef ;
  Degree = Positive | Comparative | Superlative ;
  Voice = Active | Passive ;


oper
  Noun : Type = { s : Number => Species => Case => Str ;  
                  g : Gender ;
  } ;

  mkNoun1 : Str -> Gender -> Noun
    = \sg_indef,gender -> case gender of {
    Neut => case sg_indef of {
      v + "in" => mkNounGen sg_indef (v + "ner") sg_indef (v + "ner") gender ;
      x + "en" => mkNounGen sg_indef (x + "net") sg_indef (x + "nen") gender ;
      a + "le" => mkNounGen sg_indef (sg_indef + "t") sg_indef (sg_indef + "nen") gender ;
      _        => mkNounGen sg_indef (sg_indef + "et") sg_indef (sg_indef + "en") gender 
    } ;
    Utr => case sg_indef of {
      bebi + "is" => mkNoun2 sg_indef (bebi + "isar") gender ;
      cyk + "el" => mkNoun2 sg_indef (cyk + "lar") gender ;
      ka + "tt" => mkNoun2 sg_indef (ka + "tter") gender ;
      pojk + "e" => mkNoun2 sg_indef (pojk + "ar") gender ;
      _ + "o" => mkNoun2 sg_indef (sg_indef + "r") gender ;
      x + "a" => mkNoun2 sg_indef (x + "or") gender ;
      _         => mkNoun2 sg_indef (sg_indef + "ar") gender 
    }
  } ;

  mkNoun2 : Str -> Str -> Gender -> Noun 
    = \ sg_indef, pl_indef, gender -> case gender of {
      Neut => case sg_indef of {
        x + "le" => mkNounGen sg_indef (sg_indef + "t") pl_indef (sg_indef + "na") gender ;
        _ => mkNounGen sg_indef (sg_indef + "et") pl_indef (pl_indef + "na") gender
      } ;
      Utr => case sg_indef of {
        x + ("r"|"a") => mkNounGen sg_indef (x + "an") pl_indef (x + "orna") gender ;
        pojk + "e" => mkNounGen sg_indef(pojk + "en") pl_indef (pl_indef + "na") gender ;
        _ + "o" => mkNounGen sg_indef (sg_indef + "n") pl_indef (pl_indef + "na") gender ;
        cyk + "el" => mkNounGen sg_indef (cyk + "eln") pl_indef (pl_indef + "na") gender ;
        k + "or" => mkNounGen sg_indef (k + "on") pl_indef (pl_indef + "na") gender ;
        _ => mkNounGen sg_indef (sg_indef + "en") pl_indef (pl_indef + "na" ) gender 
      }
    } ;

    mkNounGen : Str -> Str -> Str -> Str -> Gender -> Noun
    = \ sg_indef, sg_def, pl_indef, pl_def, gender -> {
      s = table {
        Sing => table {
          Indef => table {
            Geni => sg_indef + "s" ;
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




  ---adjectives---

}