concrete FoodSwe of Food = {
  
      lincat
        Phrase, Item, Kind, Quality = {s : Str} ;
  
      lin
        Is item quality = {s = item.s ++ "är" ++ quality.s} ;
        This kind = {s = "denna" ++ kind.s} ;
        That kind = {s = "den" ++ kind.s} ;
        QKind quality kind = {s = quality.s ++ kind.s} ;
        Wine = {s = "vin"} ;
        Cheese = {s = "ost"} ;
        Fish = {s = "fisk"} ;
        Very quality = {s = "väldigt" ++ quality.s} ;
        Fresh = {s = "fräsch"} ;
        Warm = {s = "varm"} ;
        Italian = {s = "italiensk"} ;
        Expensive = {s = "dyr"} ;
        Delicious = {s = "god"} ;
        Boring = {s = "tråkig"} ;
        
        Lasagne = {s = "lasagne"} ;
        Pasta = {s = "pasta"} ;
        Oysters = {s = "ostron"} ;
        Hamburger = {s = "hamburgare"} ;
        Tacos = {s = "tacos" } ;
        Chicken = {s = "kyckling" } ;
        Salad = {s = "sallad" } ;
        Sushi = {s = "sushi" } ;
        Soup = {s = "soppa" } ;
        Stew = {s = "gryta" } ;
        
        Tasty = {s = "smakfull"} ;
        Hot = {s = "het"} ;
        Swedish = {s = "svensk"} ;
        Cheap = {s = "billig" } ;
        Bitter = {s = "bitter" } ;
        Salty = {s = "saltig" } ;
        Spicy = {s = "kryddig" };
        Bland = {s = "tråkig"} ;
    }