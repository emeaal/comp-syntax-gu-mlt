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

  coughAction = mkVP (mkV "hosta") ;
  breatheAction = mkVP (mkV "andas") ;
  vomitAction = mkVP (mkV "kräk") ;
  sleepAction = mkVP (mkV "sova" "sov" "sovit") ;
  undressAction = mkVP (mkVP take_V2 (mkNP thePl_Det (mkN "kläder"))) (pAdv "av") ;
  dressAction = mkVP (mkVP put_V2 (mkNP thePl_Det (mkN "kläder"))) (pAdv "på") ;
  eatAction = mkVP (mkV "ät" "åt" "ätit") ;
  drinkAction = mkVP (mkV "drick" "drack" "druckit") ;
  smokeAction = mkVP (mkV "röka") ;
  measureTemperatureAction = mkVP (mkV2 (mkV "mäta")) (mkNP the_Det (mkN "kroppstemperatur")) ;
  measureBloodPressureAction = mkVP (mkV2 (mkV "mäta")) (mkNP the_Det (mkN "blodtryck")) ;

  hospitalPlace = {at = pAdv "på sjukhuset" ; to = pAdv "till sjukhuset"} ;
  homePlace = {at = pAdv "hemma" ; to = pAdv "hemma"} ;
  schoolPlace = {at = pAdv "i skolan" ; to = pAdv "till skolan"} ;
  workPlace = {at = pAdv "på jobbet" ; to = pAdv "till jobbet"} ;

  doctorProfession = mkCN (mkN "doktor") ;
  nurseProfession = mkCN (mkN "sköterska") ;
  interpreterProfession = mkCN (mkN "tolk") ;

  bePregnantProperty = mkVP (mkA "gravid") ;
  beIllProperty = mkVP (mkA "sjuk") ;
  beWellProperty = mkVP (mkA "frisk") ;
  beDeadProperty = mkVP (mkA "död") ;
  haveAllergiesProperty = mkVP have_V2 (mkNP aPl_Det (mkN "allergi")) ;
  havePainsProperty = mkVP have_V2 (mkNP aPl_Det (mkN "smärta")) ;
  haveChildrenProperty = mkVP have_V2 (mkNP aPl_Det (mkN "barn" "barn")) ;

  feverIllness = mkNP a_Det (mkN "feber") ;
  fluIllness = mkNP a_Det (mkN "influensa") ;
  headacheIllness = mkNP a_Det (mkN "huvudvärk") ;
  diarrheaIllness = mkNP a_Det (mkN "diarré") ;
  heartDiseaseIllness = mkNP a_Det (mkN "hjärtsjukdom") ;
  lungDiseaseIllness = mkNP a_Det (mkN "lungsjukdom") ;
  hypertensionIllness = mkNP (mkN "hypertoni") ;

  alcoholSubstance = mkNP (mkN "alkohol") ;
  medicineSubstance = mkNP a_Det (mkN "medicin") ;
  drugsSubstance = mkNP aPl_Det (mkN "drog") ;

oper
  pAdv : Str -> Adv = ParadigmsSwe.mkAdv ;

  go_V = mkV "gå" "gick" "gått" ;
  stay_V = mkV "stanna" ;
  need_V2 = mkV2 (mkV "behöver") ;
  take_V2 = mkV2 (mkV "ta" "tog" "tagit") ;
  put_V2 = mkV2 (mkV "sätta" "satt" "suttit") ;
  vaccinate_V2 = mkV2 (mkV "vaccinera") ;
  examine_V2 = mkV2 (mkV "undersöka") ;

}
