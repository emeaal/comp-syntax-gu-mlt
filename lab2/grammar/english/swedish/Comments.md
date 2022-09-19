Comments

- Whenever I have saved something new in my Swedish gf files I get the following "error" message: 
    " 
    Happened in linearization of wait_V2
      Warning: ignoring lock fields in resolving mkV2 (mkV "vänta") "på"
               for
                 V Str
               using
                 {s : VForm => Str} Str
    "
This applies for all transitive verbs (V2) and everything still works regardless of it. I remember I had the same problem back in June and a few other students did as well. We asked Arianna about it but couldn't find a solution to make these messages go away. Everything seems to work fine even if I'm getting them so I decided to not put too much effort into finding a solution for making them go away, even though they annoy me at times.

- Adverbs are sometimes repeated in random generated sentences. For example this works when two different adverbs are randomly chosen e.g "han sover redan nu" but sometimes the same word is chosen and therefore repeated twice e.g "han sover nu nu" or "han sover redan redan". Since this was also the case when I compared my grammar using the functor I decided to keep it this way too but there is hopefully a solution to this that I couldn't find at the moment.

- When testing my grammar using the functor most things that differ from the functor are just the different translations of words. For example "river" is translated into "å" in the functor but I chose to translate it to "flod", "good" was translated into "god" but I translated it to "bra", "find" was translated into "finna" but I had chosen the word "hitta". Since my grammar is built according to these words and in my head they are synonyms I decided to keep them this way instead of changing them. 

- Verbs: In the functor "break" was translated into "slå sönder" but I chose to use the word "bryta". Since, in my opinion, the transitive verb "slå sönder" was not correct in most cases I decided to keep my translation of "break" to "bryta" since I found it difficult working with transitive verbs in this assignment and because the functor was no good guideline in this case, in my opinion. I was however able to solve how to work with the verb "wait" where the particle "på" is always added after the verb, e.g "att vänta på", "hon väntar på...", "de väntar på...". This was tricky to me at first since the other transitive verbs didn't need a particle between the verb and the object but wait_V2 did. This was solve by creating an empty particle for those verbs and make a new oper for wait_V2. "Slå sönder" could probably be solved in a similar manner but then I also needed to change my verb rules in the res file to fit that.

- One adjective that I would like to comment on too is the small_A since I couldn't find a way to make a general rule for that one. Instead I added all four versions to the lexicon ("liten" "litet" "lilla" "små") and made a new rule for cases with four strings in them (small_A being the only adjective with that though). I don't know if it's a good solution for it but it was the only thing I could figure out at the moment.