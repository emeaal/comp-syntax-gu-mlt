concrete FoodEng of Food = {
  
      lincat
        Phrase, Item, Kind, Quality = {s : Str} ;
  
      lin
        Is item quality = {s = item.s ++ "is" ++ quality.s} ;
        This kind = {s = "this" ++ kind.s} ;
        That kind = {s = "that" ++ kind.s} ;
        QKind quality kind = {s = quality.s ++ kind.s} ;
        Wine = {s = "wine"} ;
        Cheese = {s = "cheese"} ;
        Fish = {s = "fish"} ;
        Very quality = {s = "very" ++ quality.s} ;
        Fresh = {s = "fresh"} ;
        Warm = {s = "warm"} ;
        Italian = {s = "Italian"} ;
        Expensive = {s = "expensive"} ;
        Delicious = {s = "delicious"} ;
        Boring = {s = "boring"} ;
        
        Lasagne = {s = "lasagne"} ;
        Pasta = {s = "pasta"} ;
        Oysters = {s = "oysters"} ;
        Hamburger = {s = "hamburger"} ;
        Tacos = {s = "tacos" } ;
        Chicken = {s = "chicken" } ;
        Salad = {s = "salad" } ;
        Sushi = {s = "sushi" } ;
        Soup = {s = "soup" } ;
        Stew = {s = "stew" } ;
        
        Tasty = {s = "tasty"} ;
        Hot = {s = "hot"} ;
        Swedish = {s = "Swedish"} ;
        Cheap = {s = "cheap" } ;
        Bitter = {s = "bitter" } ;
        Salty = {s = "salty" } ;
        Spicy = {s = "spicy" };
        Bland = {s = "bland"} ;
    }