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

  mkNounPlur : Str -> Gender -> Noun
    = \sg_indef,gender -> case gender of {
    Neut => case sg_indef of {
      appl + "le" => mkNounGen1 sg_indef (appl + "n") gender ;
      v + "in" => mkNounGen1 sg_indef (v + "ner") gender ;
      _        => mkNounGen1 sg_indef (sg_indef) gender 
    } ;
    Utr => case sg_indef of {
      bebi + "is" => mkNounGen1 sg_indef (bebi + "sar") gender ;
      cyk + "el" => mkNounGen1 sg_indef (cyk + "lar") gender ;
      ka + "tt" => mkNounGen1 sg_indef (ka + "er") gender ;
      _         => mkNounGen1 sg_indef (sg_indef + "ar") gender 
    }
  } ;

    mkNounGen : Str -> Str -> Gender -> Noun
    = \ sg_indef, pl_indef, gender -> {
      s = table {
        Sing => table {
          Indef => table {
            Geni => sg_indef + "s" ;
            _ => sg_indef
          } ;
          Def => table {
            Geni => sg_indef + "s" ;
            _ => sg_indef
          }
        } ;
        Plur => table {
          Indef => table {
            Geni => pl_indef + "s" ;
            _ => pl_indef
          } ;
          Def => table {
            Geni => pl_indef + "s" ;
            _ => pl_indef
          }
        }
      } ;
      g = gender ;
    } ;




  ---adjectives---

}