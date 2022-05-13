abstract Food = {
  
      flags startcat = Phrase ;
  
      cat
        Phrase ; Item ; Kind ; Quality ;
        Phrase ; Kind ; Item ; Quality ;
  
      fun
        Is : Item -> Quality -> Phrase ;
        These, Those : Kind -> Item ;
        Pizza : Kind ;
        This, That : Kind -> Item ;
        QKind : Quality -> Kind -> Kind ;
        Wine, Cheese, Fish, Lasagne, Pasta, Oysters, Hamburger, Tacos, Chicken, Salad, Sushi, Soup, Stew : Kind ;
        Very : Quality -> Quality ;
        Fresh, Warm, Italian, Expensive, Delicious, Boring, Tasty, Swedish, Hot, Cheap, Bitter, Salty, Spicy, Bland : Quality ;
 
    }