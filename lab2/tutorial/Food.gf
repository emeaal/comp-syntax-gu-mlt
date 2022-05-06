abstract Food = {
  
      flags startcat = Phrase ;
  
      cat
        Phrase ; Item ; Kind ; Quality ;
  
      fun
        Is : Item -> Quality -> Phrase ;
        This, That : Kind -> Item ;
        QKind : Quality -> Kind -> Kind ;
        Wine, Cheese, Fish, Lasagne, Pasta, Oysters, Hamburger : Kind ;
        Very : Quality -> Quality ;
        Fresh, Warm, Italian, Expensive, Delicious, Boring, Tasty, Swedish, Hot : Quality ;
    }