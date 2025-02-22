concrete DoctorSwe of Doctor =
  open
    SyntaxSwe,
    ParadigmsSwe,
    Prelude
  in {

-- application using standard RGL

lincat
  Phrase = Utt ;
  Fact = Cl ;
  Action = VP ;
  Property = VP ;
  Profession = CN ;
  Person = NP ;
  Place = {at,to : Adv} ;
  Substance = NP ;
  Illness = NP ;

lin
  presPosPhrase fact = mkUtt (mkS fact) ;
  presNegPhrase fact = mkUtt (mkS negativePol fact) ;
  pastPosPhrase fact = mkUtt (mkS anteriorAnt fact) ;
  pastNegPhrase fact = mkUtt (mkS anteriorAnt negativePol fact) ;
  presQuestionPhrase fact = mkUtt (mkQS (mkQCl fact)) ;
  pastQuestionPhrase fact = mkUtt (mkQS anteriorAnt (mkQCl fact)) ;

  impPosPhrase action = mkUtt (mkImp action) ;
  impNegPhrase action = mkUtt negativePol (mkImp action) ;

  actionFact person action = mkCl person action ;
  propertyFact person property = mkCl person property ;

  isProfessionProperty profession = mkVP (mkNP a_Det profession) ;
  needProfessionProperty profession = mkVP need_V2 (mkNP a_Det profession) ;
  isAtPlaceProperty place = mkVP place.at ;
  haveIllnessProperty illness = mkVP have_V2 illness ;

  theProfessionPerson profession = mkNP the_Det profession ;

  iMascPerson = i_NP ;
  iFemPerson = i_NP ;
  youMascPerson = you_NP ;
  youFemPerson = you_NP ;
  hePerson = he_NP ;
  shePerson = she_NP ;

  goToAction place = mkVP (mkVP go_V) place.to ;
  stayAtAction place = mkVP (mkVP stay_V) place.at ;
  vaccinateAction person = mkVP vaccinate_V2 person ;
  examineAction person = mkVP examine_V2 person ;
  takeSubstanceAction substance = mkVP take_V2 substance ;

-- end of what could be a functor
--------------------------------

  coughAction = mkVP (mkV "hostar") ;
  breatheAction = mkVP (mkV "andas") ;
  vomitAction = mkVP (mkV "kräks") ;
  sleepAction = mkVP (mkV "sova" "sov" "sovit") ;

  undressAction =  reflexiveVP (mkV2 dress_V (mkPrep "av")) ; --reflexive
  dressAction = reflexiveVP (mkV2 dress_V (mkPrep "på")) ; --reflexive
  --dressAction = mkVP (mkVP dress_V2 (mkNP thePl_Det (mkN "mig"))) (pAdv "på") ; -reflexive

  eatAction = mkVP (mkV "äta" "åt" "ätit") ;
  drinkAction = mkVP (mkV "dricka" "drack" "druckit") ;
  smokeAction = mkVP (mkV "röker") ;
  measureTemperatureAction = mkVP (mkV2 (mkV "mäter")) (mkNP the_Det (mkN "kroppstemperatur")) ;
  measureBloodPressureAction = mkVP (mkV2 (mkV "mäter")) (mkNP the_Det (mkN "blodtryck" "blodtrycket")) ;

  hospitalPlace = {at = pAdv "på sjukhuset" ; to = pAdv "till sjukhuset"} ;
  homePlace = {at = pAdv "hemma" ; to = pAdv "hem"} ;
  schoolPlace = {at = pAdv "i skolan" ; to = pAdv "till skolan"} ;
  workPlace = {at = pAdv "på jobbet" ; to = pAdv "till jobbet"} ;

  doctorProfession = mkCN (mkN "doktor" "doktorer") ;
  nurseProfession = mkCN (mkN "sköterska") ;
  interpreterProfession = mkCN (mkN "tolk") ;

  bePregnantProperty = mkVP (mkA "gravid") ;
  beIllProperty = mkVP (mkA "sjuk") ;
  beWellProperty = mkVP (mkA "frisk") ;
  beDeadProperty = mkVP (mkA "död") ;
  haveAllergiesProperty = mkVP have_V2 (mkNP aPl_Det (mkN "allergi" "allergier")) ;
  havePainsProperty = mkVP have_V2 (mkNP aPl_Det (mkN "smärta")) ;
  haveChildrenProperty = mkVP have_V2 (mkNP aPl_Det (mkN "barn" "barn")) ;

  feverIllness = mkNP (mkN "feber") ; --no determiner
  fluIllness = mkNP (mkN "influensa") ;
  headacheIllness = mkNP (mkN "huvudvärk") ;
  diarrheaIllness = mkNP (mkN "diarré") ;
  heartDiseaseIllness = mkNP a_Det (mkN "hjärtsjukdom") ;
  lungDiseaseIllness = mkNP a_Det (mkN "lungsjukdom") ;
  hypertensionIllness = mkNP (mkN "hypertoni") ;

  alcoholSubstance = mkNP (mkN "alkohol") ;
  medicineSubstance = mkNP a_Det (mkN "medicin" "mediciner") ;
  drugsSubstance = mkNP aPl_Det (mkN "drog" "droger") ;

oper
  pAdv : Str -> Adv = ParadigmsSwe.mkAdv ;

  go_V = mkV "gå" "gick" "gått" ;
  stay_V = mkV "stannar" ;
  need_V2 = mkV2 (mkV "behöver") ;
  take_V2 = mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") ;
  put_V2 = mkV2 (mkV "sätta" "satte" "satt") ;
  vaccinate_V2 = mkV2 (mkV "vaccinerar") ;
  examine_V2 = mkV2 (mkV "undersöker") ;
  --dress_V2 = mkV2 (mkV "klär") ;
  dress_V = mkV "klär" ;
  

}
