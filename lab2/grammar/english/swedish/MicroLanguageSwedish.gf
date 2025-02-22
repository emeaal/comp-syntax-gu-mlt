--# -path=.:../abstract
concrete MicroLanguageSwedish of MicroLang = open MicroResSwedish, Prelude in {

---------------- Grammar part -----------------------

lincat
  Utt = {s : Str} ;
  S = {s : Str} ;
  NP = {s : Case => Str ; n : Number ; g : Gender ; a : Agreement} ;
  VP = {verb : Verb ; part : Str ; compl : Number => Gender => Str } ; 
  AP = Adjective ;
  
   
  N = Noun ;
  CN = Noun ;

  V = Verb ;
  V2 = Verb2 ;
  

  A = Adjective ;  
  Comp = Adjective ;  

  Adv = {s : Str} ;  
  Prep = {s : Str} ;
  Pron = {s : Case => Str ; a : Agreement ; g : Gender ; n : Number} ;
  Det = {s : Gender => Art => Str ; n : Number ; sp : Species ; g : Gender} ;


lin
-- Phrase
  UttS s = s ;
  UttNP np = {s = np.s ! Obj } ;

--Sentence 

  PredVPS np vp = {
    s = np.s ! Nom ++ vp.verb.s ! Pres ++ vp.part ++ vp.compl ! np.n ! np.g 
  } ;


--Verb 


  UseV v = {
    verb = v ;
    part = "" ;
    compl = table {
      num => table {
        gen => [] 
      }
    }
  } ;
  
  UseComp comp = {
      verb = be_Verb ;     -- "att vara"
      part = "" ;
      compl = table {
          n => table {
            g => comp.s ! Positive ! n ! g ! Indef
          }
      }
  } ;


  AdvVP vp adv = {
    verb = vp.verb ;
    part = "" ;
    compl = table {
      num => table {
        gen => vp.compl ! num ! gen ++ adv.s
      }
    }
  } ;


 ComplV2 v np = {
      verb = v ;
      part = v.c ;
      compl = table {
        n => table {
          g => np.s ! Obj
        } 
      }
      } ;


--Noun

UseN n = n ;

--Determiners 

  DetCN det cn = {
    s = table {
      c => det.s ! cn.g ! cn.a ++ cn.s ! det.n ! det.sp ! c  
    };
    a = Agr det.n ;
    g = cn.g ;
    n = det.n 
    } ;

   a_Det = {
    s = table {
      Utr => table {
        Article => "en" ;
        NoArticle => "en"
      } ;
      Neut => table {
        Article => "ett" ;
        NoArticle => "ett" 
      } 
    } ;
    g = Neut ;
    n = Sing ;
    sp = Indef
  } ;

  aPl_Det = {
    s = table {
      Utr => table {
        Article => "" ;
        NoArticle => ""
      } ;
      Neut => table {
        Article => "" ;
        NoArticle => "" 
      } 
    } ;
    g = Utr ;
    n = Plur ;
    sp = Indef
  } ;

  the_Det = {
    s = table {
      Utr => table {
        Article => "den" ;
        NoArticle => ""
      } ;
      Neut => table {
        Article => "det" ;
        NoArticle => "" 
      } 
    } ;
    g = Utr ;
    n = Sing ;
    sp = Def
  } ;

  thePl_Det = {
    s = table {
      Utr => table {
        Article => "de" ;
        NoArticle => ""
      } ;
      Neut => table {
        Article => "de" ;
        NoArticle => "" 
      } 
    } ;
    g = Utr ;
    n = Plur ;
    sp = Def
  } ;


AdjCN ap cn = {
    s = table {
      n => table {
        sp => table {
          c => ap.s ! Positive ! n ! cn.g ! sp ++ cn.s ! n ! sp ! c
        } 
      }
    } ;
    g = cn.g ;
    a = Article
  } ;
 

  PositA a = a ;

  CompAP ap = ap ;


--extra
  lin already_Adv = mkAdv "redan" ;
  lin now_Adv = mkAdv "nu" ;

  PrepNP prep np = {s = prep.s ++ np.s ! Obj} ;

    in_Prep = {s = "i"} ;
    on_Prep = {s = "på"} ;
    with_Prep = {s = "med"} ;

-- Pronouns
 
  UsePron p = p ;

   he_Pron = {
     s = table {Nom => "han" ; Obj => "honom" ; Geni => "hans"} ;
     a = Agr Sing ;
     g = Utr ;
     n = Sing
      } ;
    she_Pron = {
      s = table {Nom => "hon" ; Obj => "henne" ; Geni => "hennes"} ;
      a = Agr Sing ;
      g = Utr ; 
      n = Sing
    } ;
    they_Pron = {
      s = table {Nom => "de" ; Obj => "dem" ; Geni => "deras"} ;
      a = Agr Plur ;
      g = Utr ;
      n = Plur
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
lin cat_N = mkN "katt" Utr ; 
lin child_N = mkN "barn" Neut ;
lin city_N = mkN "stad" "städer" Utr ;
lin cloud_N = mkN "moln" Neut ;
lin computer_N = mkN "dator" "datorer" Utr ; 
lin cow_N = mkN "ko" Utr; 
lin dog_N = mkN "hund" Utr ;
lin fire_N = mkN "eld" Utr ;
lin fish_N = mkN "fisk" Utr ;
lin flower_N = mkN "blomma" Utr ;
lin friend_N = mkN "vän" "vännen" "vänner" "vännerna" Utr ; 
lin girl_N = mkN "flicka" Utr ;
lin grammar_N = mkN "grammatik" Utr ; ---uncountable, check for mass noun
lin horse_N = mkN "häst" Utr ;
lin house_N = mkN "hus" Neut ;
lin language_N = mkN "språk" Neut ;
lin man_N = mkN "man" "mannen" "män" "männen" Utr ;
lin milk_N = mkN "mjölk" Utr; 
lin music_N = mkN "musik" Utr ; 
lin river_N = mkN "flod" Utr ;
lin sea_N = mkN "hav" Neut ;
lin ship_N = mkN "skepp" Neut ; 
lin star_N = mkN "stjärna" Utr ;
lin train_N = mkN "tåg" Neut ; 
lin tree_N = mkN "träd" Neut ; 
lin water_N = mkN "vatten" Neut ;
lin wine_N = mkN "vin" Neut ;
lin woman_N = mkN "kvinna" Utr ;

---Adjectives---
lin bad_A = mkA "dålig" "dåligt" ;
lin big_A = mkA "stor" "stort" ; 
lin black_A = mkA "svart" ;
lin clean_A = mkA "ren" "rent" ;
lin clever_A = mkA "klok" "klokt" ; --smart
lin cold_A = mkA "kall" "kallt" ;
lin dirty_A = mkA "smutsig" "smutsigt" ; 
lin good_A = mkA "god" ; --bra
lin green_A = mkA "grön" "grönt" ; 
lin heavy_A = mkA "tung" "tungt" ; 
lin hot_A = mkA "het" "hett" ;
lin new_A = mkA "ny" "nytt" ; 
lin old_A = mkA "gammal" ;
lin ready_A = mkA "färdig" "färdigt" ; --redo
lin red_A = mkA "röd" "rött" ;
lin small_A = mkA "liten" "litet" "lilla" "små" ; --solution here might not be perfect
lin warm_A = mkA "varm" "varmt" ;
lin white_A = mkA "vit" "vitt" ;
lin yellow_A = mkA "gul" "gult" ;
lin young_A = mkA "ung" "ungt" ; 
lin blue_A = mkA "blå" "blått" ;


---Verbs---
lin come_V = mkV "komma" "kom" "kommit" ;
lin break_V2 = mkV2 (mkV "bryta" "bröt" "brutit") ; --v2
lin buy_V2 = mkV2 (mkV "köpa") ; --v2
lin drink_V2 = mkV2 (mkV "dricka" "drack" "druckit") ; --v2
lin eat_V2 = mkV2 (mkV "äta" "åt" "ätit") ; --v2
lin find_V2 = mkV2 (mkV "finna" "fann" "funnit") ;--"hitta" "hittade" "hittat") ; --v2 
lin go_V = mkV "gå" "gick" "gått" ;
lin jump_V = mkV "hoppa" ;
lin kill_V2 = mkV2 (mkV "döda") ; --v2
lin live_V = mkV "leva" ;
lin love_V2 = mkV2 (mkV "älska") ; --v2
lin play_V = mkV "leka" ;
lin read_V2 = mkV2 (mkV "läsa" "läste" "läst") ; --v2
lin run_V = mkV "springa" "sprang" "sprungit" ;
lin see_V2 = mkV2 (mkV "se" "såg" "sett") ; --v2
lin sleep_V = mkV "sova" "sov" "sovit" ;
lin swim_V = mkV "simma" "simmade" "simmat" ; --check
lin teach_V2 = mkV2 (mkV "undervisa" "undervisade" "undervisat" ) ;--"lära" "lärde" "lärt") ; --v2
lin travel_V = mkV "resa" ;
lin understand_V2 = mkV2 (mkV "förstå" "förstod" "förstått") ; --v2
lin wait_V2 = mkV2 (mkV "vänta") "på"  ; 
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
    mKV2 : Verb -> Str -> Verb2  -- for "vänta" "på"
      = \verb,p -> lin V2 (verb ** {c = p}) 
  } ;

  

  mkA = overload {
    mkA : Str -> Adjective
      = \pos_utr
        -> lin A (mkAdjective1 pos_utr) ;
    mkA : Str -> Str -> Adjective
    = \pos_utr,pos_neutr
      -> lin A (mkAdjective2 pos_utr pos_neutr) ;
    mkA : Str -> Str -> Str -> Str -> Adjective
    = \pos_utr,pos_neutr,pos_def,pos_plu 
      -> lin A (mkAdjectiveSmall pos_utr pos_neutr pos_def pos_plu )
  } ;

  mkAdv : Str -> Adv
    = \adv -> lin Adv {s = adv} ;



}