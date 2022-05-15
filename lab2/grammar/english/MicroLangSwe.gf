--# -path=.:../abstract
concrete MicroLangSwe of MicroLang = open MicroResSwe, Prelude in {

---------------- Grammar part -----------------------

  lincat
    Utt = {s : Str} ;
    
    S  = {s : Str} ;
    VP = {verb : Verb ; compl : Str} ; ---s special case of Mini
    Comp = {s : Str} ;
    AP = Adjective ;
    NP = {s : Case => Str ; a : Agreement} ;
    Pron = {s : Case => Str ; a : Agreement} ;
    Det = {s : Str ; n : Number} ;
    Prep = {s : Str} ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;

    Adv = {s : Str} ;
    
    N = Noun ;
    CN = Noun ;

  lin
    UttS s = s ;
    UttNP np = {s = np.s ! Acc} ;

    PredVPS np vp = {
      s = np.s ! Nom ++ vp.verb.s ! agr2vform np.a ++ vp.compl
      } ;
      
    UseV v = {
      verb = v ;
      compl = [] ;
      } ;
      
    ComplV2 v2 np = {
      verb = v2 ;
      compl = v2.c ++ np.s ! Acc  -- NP object in the accusative, preposition first
      } ;
      
    UseComp comp = {
      verb = be_Verb ;     -- the verb is the copula "be"
      compl = comp.s
      } ;
      
    CompAP ap = ap ;
      
    AdvVP vp adv =
      vp ** {compl = vp.compl ++ adv.s} ;
      
    DetCN det cn = {
      s = \\c => det.s ++ cn.s ! det.n ;
      a = Agr det.n ;
      } ;
      
    UsePron p = p ;
            
    a_Det = {s = pre {"a"|"e"|"i"|"o" => "en" ; _ => "ett"} ; n = Sg} ; --- a/an can get wrong
    aPl_Det = {s = "" ; n = Pl} ;
    the_Det = {s = "the" ; n = Sg} ;
    thePl_Det = {s = "the" ; n = Pl} ;
    
    UseN n = n ;
    
    AdjCN ap cn = {
      s = table {n => ap.s ++ cn.s ! n}
      } ;

    PositA a = a ;

    PrepNP prep np = {s = prep.s ++ np.s ! Acc} ;

    in_Prep = {s = "i"} ;
    on_Prep = {s = "på"} ;
    with_Prep = {s = "med"} ;

    he_Pron = {
      s = table {Nom => "han" ; Acc => "honom"} ;
      a = Agr Sg ;
      } ;
    she_Pron = {
      s = table {Nom => "hon" ; Acc => "henne"} ;
      a = Agr Sg ;
      } ;
    they_Pron = {
      s = table {Nom => "de" ; Acc => "dem"} ;
      a = Agr Pl ;
      } ;

---------------- Lexicon part -----------------------

---Nouns---

lin animal_N = mkN "djur" ;
lin apple_N = mkN "äpple" ;
lin baby_N = mkN "bebis" ;
lin beer_N = mkN "öl" "öl" ;
lin bike_N = mkN "cykel" ;
lin bird_N = mkN "fågel";
lin blood_N = mkN "blod" ;
lin boat_N = mkN "båt" ;
lin book_N = mkN "bok" ;
lin boy_N = mkN "pojke" ;
lin bread_N = mkN "bröd" ;
lin car_N = mkN "bil" ;
lin cat_N = mkN "katt" ;
lin child_N = mkN "barn" "barn" ;
lin city_N = mkN "stad" ;
lin cloud_N = mkN "moln" ;
lin computer_N = mkN "dator" ;
lin cow_N = mkN "ko" ;
lin dog_N = mkN "hund" ;
lin fire_N = mkN "eld" ;
lin fish_N = mkN "fisk" ;
lin flower_N = mkN "blomma" ;
lin friend_N = mkN "vän" ;
lin girl_N = mkN "flicka" ;
lin grammar_N = mkN "grammatik" ;
lin horse_N = mkN "häst" ;
lin house_N = mkN "hus" ;
-- lin john_PN = mkPN "John" ;
-- lin know_VS = mkVS (mkV "know" "knew" "known") ;
lin language_N = mkN "språk" ;
lin man_N = mkN "man" ;
lin milk_N = mkN "mjölk" ;
lin music_N = mkN "musik" ;
-- lin paris_PN = mkPN "Paris" ;
lin river_N = mkN "flod" ;
lin sea_N = mkN "sjö" ;
lin ship_N = mkN "skepp" ;
lin star_N = mkN "stjärna" ;
lin train_N = mkN "tåg" ;
lin tree_N = mkN "träd" ;
lin water_N = mkN "vatten" ;
lin wine_N = mkN "vin" ;
lin woman_N = mkN "kvinna" "kvinnor" ;

---Adjectives---

lin bad_A = mkA "dålig" ;
lin big_A = mkA "stor" ;
lin black_A = mkA "svart" ;
lin blue_A = mkA "blå" ;
lin clean_A = mkA "ren" ;
lin clever_A = mkA "smart" ;
lin cold_A = mkA "kall" ;
lin dirty_A = mkA "smutsig" ;
lin good_A = mkA "bra" ;
lin green_A = mkA "grön" ;
lin heavy_A = mkA "tung" ;
lin hot_A = mkA "het" ;
lin new_A = mkA "ny" ;
lin old_A = mkA "gammal" ;
lin ready_A = mkA "redo" ;
lin red_A = mkA "röd" ;
lin small_A = mkA "liten" ;
lin warm_A = mkA "varm" ;
lin white_A = mkA "vit" ;
lin yellow_A = mkA "gul" ;
lin young_A = mkA "ung" ;

---Verbs---
lin come_V = mkV "komma" "kom" "kommit" ;
lin break_V2 = mkV2 (mkV "bryta" "bröt" "brutit") ;
lin buy_V2 = mkV2 (mkV "köpa" "köpt" "köpte") ;
lin drink_V2 = mkV2 (mkV "dricka" "drack" "druckit") ;
lin eat_V2 = mkV2 (mkV "äta" "åt" "ätit") ;
lin find_V2 = mkV2 (mkV "hitta" "hittde" "hittat") ;
lin go_V = mkV "gå" "gick" "gick" ;
lin jump_V = mkV "hoppa" ;
lin kill_V2 = mkV2 "döda" ;
lin live_V = mkV "leva" ;
lin love_V2 = mkV2 (mkV "älska") ;
lin play_V = mkV "leka" ;
lin read_V2 = mkV2 (mkV "läsa" "läste" "läst") ;
lin run_V = mkV "springa" "sprang" "sprungit" ;
lin see_V2 = mkV2 (mkV "se" "såg" "såg") ;
lin sleep_V = mkV "sova" "sov" "sovit" ;
lin swim_V = mkV "simma" "simmade" "simmat" ;
lin teach_V2 = mkV2 (mkV "lära" "lärde" "lärt") ;
lin travel_V = mkV "resa" ;
lin understand_V2 = mkV2 (mkV "förstå" "förstod" "förstått") ;
lin wait_V2 = mkV2 "vänta" "for" ;
lin walk_V = mkV "gå" ;

---Adverbs---

lin already_Adv = mkAdv "redan" ;
lin now_Adv = mkAdv "nu" ;

---------------------------
-- Paradigms part ---------
---------------------------

oper
  mkN = overload {
    mkN : Str -> Noun   -- predictable noun, e.g. car-cars, boy-boys, fly-flies, bush-bushes
      = \n -> lin N (smartNoun n) ;
    mkN : Str -> Str -> Noun  -- irregular noun, e.g. man-men
      = \sg,pl -> lin N (mkNoun sg pl) ;
    } ;

  mkA : Str -> A
    = \s -> lin A {s = s} ;

  mkV = overload {
    mkV : (inf : Str) -> V  -- predictable verb, e.g. play-plays, cry-cries, wash-washes
      = \s -> lin V (smartVerb s) ;
    mkV : (inf,pres,part : Str) -> V  -- irregular verb, e.g. drink-drank-drunk
      = \inf,pres,part -> lin V (irregVerb inf pres part) ;
    } ;

  mkV2 = overload {
    mkV2 : Str -> V2          -- predictable verb with direct object, e.g. "wash"
      = \s   -> lin V2 (smartVerb s ** {c = []}) ;
    mkV2 : Str  -> Str -> V2  -- predictable verb with preposition, e.g. "wait - for"
      = \s,p -> lin V2 (smartVerb s ** {c = p}) ;
    mkV2 : V -> V2            -- any verb with direct object, e.g. "drink"
      = \v   -> lin V2 (v ** {c = []}) ;
    mkV2 : V -> Str -> V2     -- any verb with preposition
      = \v,p -> lin V2 (v ** {c = p}) ;
    } ;

  mkAdv : Str -> Adv
    = \s -> lin Adv {s = s} ;
  
  mkPrep : Str -> Prep
    = \s -> lin Prep {s = s} ;

}