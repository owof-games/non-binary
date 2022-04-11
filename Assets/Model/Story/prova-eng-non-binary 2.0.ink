//VARIABILI//

VAR gender = 0

//FUNZIONI//
    -> random
    === random ===
    ~ gender = RANDOM (0,1)
    
       {
        - gender:
        -> intro_amab
        - else: 
        -> intro_amab
        }
    
    === bullet_hell_buono ===
    $bullet_hell_finale$
    -> outro
    
    === outro === 
    {
    - gender:
    + [Vivi la vita di Pallino]
    -> intro_amab
    + [Voglio uscire] -> END
    
    - else:
    + [Vivi la vita di Pallina]
    -> intro_afab
    + [Voglio uscire] -> END
    }
    
    === purgatorio ===
    {
   - not atto_amab_due && atto_amab_uno:  -> sconfitta_amab_uno
   - atto_amab_due && atto_amab_uno:  -> sconfitta_amab_due
   - not atto_afab_due && atto_afab_uno:  -> sconfitta_afab_uno
   - atto_afab_due && atto_afab_uno:  -> sconfitta_afab_due
    }

//STORIA PALLINO//
    === intro_amab ===
    INTRO AMAB PRIMA PERSONA #title
    
        Mom and car rock you on the ride home.
        "Barely born and <m>he</m>'s already got a sly face!"
        Dad is on a roll.
        Mom's laugh shakes you from your slumber.
        Outside the window your little eyes see a blurry world of lights and contours, silhouettes and glows.
        Everything is new, beautiful. You feel like you could be anything.
            + You make a verse[].
            -
        You want to share your joy, but the voices are loud and ignore you.
        "Do you think <m>he</m>'ll want to learn the business?"
        Dad turns right.
        Mom looks at you.
        "Mine or yours?"
        "Mine! God, I don't want a <f>beautician</f> son!"
        Get out of the car.
            + You regurgitate[].
            -
        After three days of life, it's not like you can do much more.
        You go from Mom's arms to Grandma's, aunts and uncles running around you.
        Your bedroom is already full: a little bed with <m>blue blankets</m>, <m>blue curtains</m>, <m>blue walls</m>.
        Blue the closet, the carpet, the pajamas they put on you.
        Pink your cheeks as they comment on your willy.
        On a shelf an array of stuffed animals: a <m>car</m>, a <m>fireman</m>, a teddy bear, a <m>bulldog</m>, a <m>soccer ball</m>.
        Your brother puts the ball in your hands, laughing.
        "These are <m>goalie hands</m>, look at that hook!"
            + You just wanted something to hold on to[], these people say too much and your head spins.
            -
        Grandma asks your brother if he wants to hold you, he says he's afraid of breaking you.
        "Look, with a baby in your arms, you're killing little girls!"
        "Mom, he's only twelve!"
        They walk and talk, all of them.
        They tell each other what your future will be like, they discuss, they laugh, they draw boundaries. 
        Their words fall on your eyes.
        Outside, along the road you see less and less variety, shapes and colors fade until all that remains is an expanse of <m>blue squares</m> and <f>pink triangles</f>.
            + You cry[].
            -

        -> intro_amab_terza_persona
    
    === intro_amab_terza_persona ===
    INTRO AMAB TERZA PERSONA #title
        Mom and car cradle Luca on the ride home.
        "Barely born and <m>he</m>'s already got a sly face!"
        Dad is on a roll.
        Mom's laughter shakes the baby from <m>his</m> slumber.
        Outside the window <m>his</m> little eyes see a blurry world of lights and contours, silhouettes and glows.
        Everything is new, beautiful. <m>He</m> feels <m>he</m> can be anything.
            + Luca makes a verse[].
            -
        <m>He</m> wants to share <m>his</m> joy, but the voices are loud and ignore <m>him</m>.
        "Do you think <m>he</m>'ll feel like learning the business?"
        Dad turns right.
        Mom looks at the baby.
        "Mine or yours?"
        "Mine! God, I don't want a <f>beautician</f> son!"
        They get out of the car.
            + The baby regurgitates[].
            -
        After three days of life, it's not like <m>he</m> can do much more.
        <m>He</m> goes from Mom's arms to Grandma's, aunts and uncles running around <m>him</m>.
        <m>His</m> little room is already full: a little bed with <m>blue blankets</m>, <m>blue curtains</m>, <m>blue walls</m>.
        Blue the closet, the carpet, the pajamas they put on you.
        Pink her cheeks as they make comments about her willy.
        On a shelf an array of stuffed animals: a <m>car</m>, a <m>fireman</m>, a teddy bear, a <m>bulldog</m>, a <m>soccer ball</m>.
        <m>His</m> brother puts the ball in <m>his</m> hands, laughing.
        "These are <m>goalie hands</m>, look at that hook!"
            + Luca just wanted something to hold on to[], these people say too much and <m>his</m> head spins.
            -
        Grandma asks <m>his</m> brother if he wants to hold <m>him</m>, he says he's afraid of breaking <m>him</m>.
        "Look, with a baby in your arms, you're making a carnage of little girls!"
        "Mom, he's only twelve!"
        They walk and talk, all of them. They tell each other what Luca's future will be like, they discuss, they laugh, they draw boundaries. 
        Their words fall on <m>his</m> eyes.
        Outside, along the way <m>he</m> sees less and less variety, shapes and colors fade until all that remains is an expanse of <m>blue squares</m> and <f>pink triangles</f>.
            + Luca begins to cry[].
            -
    
    -> bullet_hell_buono
    
    
    ===atto_amab_uno===
    
        -> bullet_hell_amab_uno
    
    === bullet_hell_amab_uno ===
        $bullet_hell_amab_uno$
    -> atto_amab_due
    
    === atto_amab_due ===
    
        Laura ti guarda con tenerezza. 
            + Condividi quel ricordo[].
            -> ricordo
            + Infili il vestito nello scatolone[].
            -> scatolone
            + Parli del meteo[].
            Laura ti bacia sulla guancia. "Dio, siamo già come quelle vecchie coppie che non hanno più nulla da dirsi?"
            -> scatolone
        
        = ricordo
            
            Non sai capire come ti senti. Cosa provi ora? Cosa ha senso fare?
                + Pensi a nonna, alla sua forza[].
                    “Amo Laura, e non serve che siate tu o mamma a dirmi cosa fare o non fare!”
                    -> litigio
                + Guardi tuo fratello, il tuo eroe[].
                    Ti ha detto “Ti voglio bene.”
                    -> accomodante
                + La stanchezza ti macina le ossa[].
                    Li lasci lì e te ne vai.
                    -> litigio
            
            = litigio
                
                -> Bullet_hell_amab_due
            
            = accomodante
                
                -> Bullet_hell_amab_due
    
        
        = scatolone
           
            “So di essere un grezzone e di non essere bravo come voi con le parole. Ma tengo a nonna, e voglio che sia felice. E tengo a te, e voglio che tu sia felice. Ma non so come farlo.”
                + Gli occhi lucidi di Omar ti riempiono di senso di colpa[].
                -> colpa
                + “Non pretendo che tu sia perfetto[“], solo che tu mi permetta di essere me stesso."
                -> myself
                + Omar ha bisogno di te[]. 
                Metti da parte parole e spiegazioni e lo abbracci.
                -> colpa
        
            = myself
                
                -> Bullet_hell_amab_due
        
            = colpa
               
                -> Bullet_hell_amab_due
        
        
        === Bullet_hell_amab_due ===
            $bullet_hell_amab_due$
        -> atto_amab_tre
        
    === atto_amab_tre===
   
        “Tutto ok, tesoro?”
            + Respingi tutto quello che provi[], perché non può esserci spazio per questo. La sincerità la allontanerà come ha allontanato Omar.
            -> Respingi
            + Non puoi dirle la verità[], non puoi. Laura è magnifica, ma lo era anche Omar, e dov'è ora?
            -> Perdere
            + Provi a cercare le parole[] per dirle ciò che senti.
            -> Sinceramente
        
        = Sinceramente
            
            -> bullet_hell_amab_tre_bis
        
        = Perdere
           
            -> bullet_hell_amab_tre
        
        = Respingi
            
            -> Perdere
            
        
    ===bullet_hell_amab_tre ===
        $bullet_hell_amab_tre$
    -> finale_amab_uno
    
    === bullet_hell_amab_tre_bis ===
        $bullet_hell_amab_tre$
    -> finale_amab_due
        
    === finale_amab_uno ===
        
        -> bullet_hell_buono
    
    === finale_amab_due ===
       
        -> bullet_hell_buono



//STORIA PALLINA//
    === intro_afab ===
     
        -> atto_afab_uno
    
    === atto_afab_uno ===
   
        Ti alzi.
            + Raggiungi i ragazzi[].
            -> gioco
            + Vai dalle tue compagne[].
            -> compagne
            
        
            = gioco
                L
                ->bullet_hell_uno_afab
                
            = compagne
                
                ->bullet_hell_uno_afab
    
    ===bullet_hell_uno_afab===
    $bullet_hell_afab_uno$
    -> atto_afab_due
    
    === atto_afab_due ===
    
    
    -> bullet_hell_due_afab
    
    === bullet_hell_due_afab ===
   $bullet_hell_afab_due$
    -> atto_afab_tre
    
    === atto_afab_tre ===
    
        Chloe si rende conto che la tizia sta guardando altrove.
        Ti vede, e con gli occhi ti supplica di darle soccorso.
        + Sorridi a Laura[]. -> Pacificazione
        + Ti appoggi a Chloe[]. -> Durezza
        + Te ne vai a bere[]. -> al_bancone_emma

        
            = Pacificazione
               
                    + La insegui[].-> pre_terzo_bullet_hell_afab
        
            
            = Durezza
                
                    + La insegui[].
                ->  pre_terzo_bullet_hell_afab
            
            
            = pre_terzo_bullet_hell_afab
                
            -> bullet_hell_tre_afab
            
            = al_bancone_emma
                
                -> bullet_hell_tre_afab
         

    === bullet_hell_tre_afab ===
        $bullet_hell_afab_tre$
    -> finale_afab
    
    === finale_afab ===
       
        -> bullet_hell_buono

//FINALI INTERMEDI//

    === sconfitta_amab_uno ===
        
        -> bullet_hell_buono


    === sconfitta_amab_due ===
        
        -> bullet_hell_buono
        
        
        
    === sconfitta_afab_uno ===
       
    -> bullet_hell_buono
    
    
    
    === sconfitta_afab_due ===
        
    -> bullet_hell_buono