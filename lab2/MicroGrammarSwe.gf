-----lexicon part--------

lin already_Adv = mkAdv "redan" ;
lin animal_N = mkN "djur" ;
lin apple_N = mkN "äpple" ;
lin baby_N = mkN "bebis" ;
lin bad_A = mkA "dålig" ;
lin beer_N = mkN "öl" ;
lin big_A = mkA "stor" ;
lin bike_N = mkN "cykel" ;
lin bird_N = mkN "fågel" ;
lin black_A = mkA "svart" ;
lin blood_N = mkN "blod" ;
lin blue_A = mkA "blå" ;
lin boat_N = mkN "båt" ;
lin book_N = mkN "bok" ;
lin boy_N = mkN "pojke" ;


oper
  mkN = overload {
    mkN : Str -> Noun   -- predictable noun, e.g. car-cars, boy-boys, fly-flies, bush-bushes
      = \n -> lin N (smartNoun n) ;