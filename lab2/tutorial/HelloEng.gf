-- a "Hello World" grammar
    abstract Hello = {
  
      flags startcat = Greeting ;
  
      cat Greeting ; Recipient ;
  
      fun
        Hello : Recipient -> Greeting ;
        World, Mum, Friends : Recipient ;
    }

concrete HelloEng of Hello = {
  
      lincat Greeting, Recipient = {s : Str} ;
  
      lin
        Hello recip = {s = "hello" ++ recip.s} ;
        World = {s = "world"} ;
        Mum = {s = "mum"} ;
        Friends = {s = "friends"} ;
    }