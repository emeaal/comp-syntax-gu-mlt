--# -path=.:../abstract
concrete MicroLanguageSwedish of MicroLang = open MicroResSwedish, Prelude in {

---------------- Grammar part -----------------------

lincat
  Utt = {s : Str} ;
  S = {s : Str} ;
  NP = {s : Case => Str ; n : Number ; g : Gender} ;
  VP = {verb : Verb ; compl : Str} ;
  AP = Adjective ;

  N = Noun ;

  V = Verb ;
  V2 = Verb2 ;

  A = Adjective ;


lin
-- Phrase
  UttS s = s ;
  UttNP np = {s = np.s ! Nom } ; -- ! Acc


-- Verb 

  UseV v = {
      verb = v ;
      compl = [] ;
      } ;




---------------- Lexicon part -----------------------
-----------------------------------------------------
---Nouns---
lin animal_N = mkN "djur" Neut ;
lin apple_N = mkN "äpple" "äpplen" Neut ;
lin baby_N = mkN "bebis" Utr ;
lin beer_N = mkN "öl" Neut ; -- is it one glass of beer or a brand? 
lin bike_N = mkN "cykel" Utr ;
lin bird_N = mkN "fågel" Utr ;
lin blood_N = mkN "blod" Neut ; -- uncountable, "blodeT" but not "ett blod"
lin boat_N = mkN "båt" Utr ; 
lin book_N = mkN "bok" "böcker" Utr ;
lin boy_N = mkN "pojke" Utr ;
lin bread_N = mkN "bröd" Neut ;
lin car_N = mkN "bil" Utr ;
lin cat_N = mkN "katt" Utr ; -- check
lin child_N = mkN "barn" Neut ;
lin city_N = mkN "stad" "städer" Utr ;
lin cloud_N = mkN "moln" Neut ;
lin computer_N = mkN "dator" "datorer" Utr ; --find a rule?
lin cow_N = mkN "ko" Utr; 
lin dog_N = mkN "hund" Utr ;
lin fire_N = mkN "eld" Utr ;
lin fish_N = mkN "fisk" Utr ;
lin flower_N = mkN "blomma" Utr ;
lin friend_N = mkN "vän" "vännen" "vänner" "vännerna" Utr ; --check
lin girl_N = mkN "flicka" Utr ;
lin grammar_N = mkN "grammatik" "grammatiker" Utr ; ---uncountable, check for mass noun
lin horse_N = mkN "häst" Utr ;
lin house_N = mkN "hus" Neut ; --uncountable, check S ending
lin language_N = mkN "språk" Neut ;
lin man_N = mkN "man" "mannen" "män" "männen" Utr ;
lin milk_N = mkN "mjölk" "mjölk" Utr; -- uncountable
lin music_N = mkN "musik" Utr ; -- uncountable
lin river_N = mkN "flod" Utr ;
lin sea_N = mkN "hav" Neut ;
lin ship_N = mkN "skepp" Neut ; -- uncountable
lin star_N = mkN "stjärna" Utr ;
lin train_N = mkN "tåg" Neut ; -- uncountable
lin tree_N = mkN "träd" Neut ; --uncountable
lin water_N = mkN "vatten" Neut ;
lin wine_N = mkN "vin" Neut ;
lin woman_N = mkN "kvinna" Utr ;

---Adjectives---
lin bad_A = mkA "dålig" ; -- sämre sämst xx
lin big_A = mkA "stor" ; -- större störst xx
lin black_A = mkA "svart" ; -- svartare svartast
lin clean_A = mkA "ren" ; -- renare renast
lin clever_A = mkA "smart" ; --smartare smarast
lin cold_A = mkA "kall" ; --kallare kallast
lin dirty_A = mkA "smutsig" ; --smutsigare smutsigast 
lin good_A = mkA "bra" ; --bättre bäst xx
lin green_A = mkA "grön" ; --grönare grönast
lin heavy_A = mkA "tung" ; -- tyngre tyngst xx
lin hot_A = mkA "het" ; --hetare hetast
lin new_A = mkA "ny" ; --nyare nyast
lin old_A = mkA "gammal" ; -- äldre äldst xx
lin ready_A = mkA "redo" ; --redo ??
lin red_A = mkA "röd" ; --rödare rödast
lin small_A = mkA "liten" ; --mindre minst xx
lin warm_A = mkA "varm" ; --varmare varmast
lin white_A = mkA "vit" ; --vitare vitast
lin yellow_A = mkA "gul" ; --gulare gulast
lin young_A = mkA "ung" ; --yngre yngst xx
lin blue_A = mkA "blå" ; --blåare blåast


---Verbs---
lin come_V = mkV "komma" "kom" "kommit" ;
lin break_V2 = mkV2 (mkV "bryta" "bröt" "brutit") ;
lin buy_V2 = mkV2 (mkV "köpa") ;
lin drink_V2 = mkV2 (mkV "dricka" "drack" "druckit") ;
lin eat_V2 = mkV2 (mkV "äta" "åt" "ätit") ;
lin find_V2 = mkV2 (mkV "hitta" "hittade" "hittat") ;
lin go_V = mkV "gå" "gick" "gått" ;
lin jump_V = mkV "hoppa" ;
lin kill_V2 = mkV2 (mkV "döda") ;
lin live_V = mkV "leva" ;
lin love_V2 = mkV2 (mkV "älska") ;
lin play_V = mkV "leka" ;
lin read_V2 = mkV2 (mkV "läsa" "läste" "läst") ;
lin run_V = mkV "springa" "sprang" "sprungit" ;
lin see_V2 = mkV2 (mkV "se" "såg" "sett") ;
lin sleep_V = mkV "sova" "sov" "sovit" ;
lin swim_V = mkV "simma" "simmade" "simmat" ; --check
lin teach_V2 = mkV2 (mkV "lära" "lärde" "lärt") ;
lin travel_V = mkV "resa" ;
lin understand_V2 = mkV2 (mkV "förstå" "förstod" "förstått") ;
--lin wait_V2 = mkV2 (mkV "vänta" "på") ;
lin walk_V = mkV "gå" "gick" "gått";

---------------- Paradigms part ---------------------
-----------------------------------------------------
oper
  mkN = overload {
    mkN : Str -> Gender -> Noun
      = \sg_indef,gender 
        -> lin N (mkNoun1 sg_indef gender) ;
    mkN : Str -> Str -> Gender -> Noun
      = \sg_indef, pl_indef, gender 
        -> lin N (mkNoun2 sg_indef pl_indef gender) ;
    mkN : Str -> Str -> Str -> Str -> Gender -> Noun
      = \sg_indef, sg_def, pl_indef, pl_def, gender 
        -> lin N (mkNounGen sg_indef sg_def pl_indef pl_def gender) ;
  } ;

  mkV = overload {
    mkV : (inf : Str) -> V  -- predictable verb, e.g. play-plays, cry-cries, wash-washes
      = \s -> lin V (smartVerb s) ;
    mkV : (inf,pres,part : Str) -> V  -- irregular verb, e.g. drink-drank-drunk
      = \inf,pres,part -> lin V (irregVerb inf pres part) ;
    } ;

  mkV2 = overload {
    mkV2 : Verb -> Verb2 
      = \verb -> lin V2 (verb ** {c = []}) ;
    --mKv2 : Verb -> Str -> Verb2 
      --= \verb,comp -> lin V2 (verb ** {c = comp}) 
  } ;

  mkA = overload {
    mkA : Str -> Adjective
      = \pos_utr
        -> lin A (mkAdjective1 pos_utr) ;
  } ;
  
  
  --Str -> A
    --= \s -> lin A {s = s} ;


}