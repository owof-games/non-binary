//VARIABILI

//Gender: se 1 = AFAB, se 2 = AMAB

VAR gender = 1

//Finali amab: se 1 = perdere, se 2 = sinceramente
VAR amab_tre = 1


//FUNZIONI
    -> random
    === random ===
    translated by mickey
    ~ gender = RANDOM (1,2)
    
       {
        - gender == 1:
        -> intro_afab
        - gender == 2: 
        -> intro_amab
        }
    
    === bullet_hell_buono ===
    $character_creation$
    $bullet_hell_finale$
    -> DONE
    
    === swap_and_restart ===
    {
        - gender == 1:
            -> intro_amab
        - gender == 2:
            -> intro_afab
    }
    
    === restart ===
    {
        - gender == 1:
        -> intro_afab
        - gender == 2: 
        -> intro_amab
        }
        
    
    === purgatorio ===
        //check AFAB
        {
        - gender == 1 && atto_afab_tre: -> finale_afab
        - gender == 1 && atto_afab_due:  -> sconfitta_afab_due 
        - gender == 1 && atto_afab_uno:  -> sconfitta_afab_uno 
      
        //check AMAB
        - gender == 2 && amab_tre == 2: -> finale_amab_due
        - gender == 2 && amab_tre == 1: -> finale_amab_uno 
        - gender == 2 && atto_amab_due:  -> sconfitta_amab_due 
        - gender == 2 && atto_amab_uno:  -> sconfitta_amab_uno 
    }  

//STORIA PALLINO
    === intro_amab ===
    ~ gender = 2
    ~ amab_tre = 0
        <f>Mom</f> and the car rock you on the ride home. #street
        "Barely born and <m>he</m>'s already got a sly face!"
        <m>Dad</m> is on a roll.
        <f>Mom</f>'s laugh shakes you from your slumber.
        Outside the window your little eyes see a blurry world of lights and contours, silhouettes and glows.
        Everything is new, beautiful. You feel like you could be anything.
            + [You make a noise]
            -
        You want to share your joy, but the voices are loud and ignore you.
        "Do you think <m>he</m>'ll want to learn the business?"
        <m>Dad</m> turns right.
        <f>Mom</f> looks at you.
        "Mine or yours?"
        "Mine! God, I don't want a <f>beautician</f> <m>son</m>!"
        <f>Mama</f> bring you out of the car.
            + [You regurgitate]
            -
        After three days of life, it's not like you can do much more.
        You go from <f>Mom</f>'s arms to <f>Grandma</f>'s, <f>aunts</f> and <m>uncles</m> running around you.
        Your bedroom is already full: a little bed with <m>blue</m> blankets, <m>blue</m> curtains, <m>blue</m> walls.
        <m>Blue</m> the closet, the carpet, the pajamas they put on you.
        Pink your cheeks as they comment on your <m>willy</m>.
        On a shelf an array of stuffed animals: a <m>car</m>, a <m>fireman</m>, a teddy bear, a <m>bulldog</m>, a <m>soccer ball</m>.
        Your <m>brother</m> puts the <m>ball</m> in your hands, laughing.
        "These are /m>goalie hands</m>, look at that hook!"
            + You just wanted something to hold on to[], these people say too much and your head spins.
            -
        <f>Grandma</f> asks your <m>brother</m> if <m>he</m> wants to hold you, <m>he</m> says <m>he</m>'s afraid of breaking you.
        "Look, with a baby in your arms, all the little <f>girls</f> will fall for you”
        "<f>Mom</f>, <m>he</m>'s only twelve!"
        They walk and talk, all of them.
        They tell each other what your future will be like, they discuss, they laugh, they draw boundaries. 
        Their words fall on your eyes.
        Outside, along the road you see less and less variety, shapes and colors fade until all that remains is an expanse of <m>blue squares</m> and <f>pink triangles</f>. #people
            + [You cry]
            -
        -> atto_amab_uno

    
    ===atto_amab_uno===
    Childhood. Summer. A park. #title
    
        "Because you're a <m>boy</m>!"
            + "So what?"
            -
        "And so you can't do <f>Ariel</f> because <f>she</f>'s a <f>priiiiiiiiiiiincess</f>! We need a <m>priiiiiiiiiiiiince</m>, that's all you're here for!"
        <f>Marika</f> has <f>her</f> arms wrapped around <f>her</f> chest and is looking at you like you are the stupidest thing in the world.
        The other <f>girls</f> are bored.
        <f>Laura</f> keeps huffing, <f>Elisa</f> throws rocks at lizards.
        The sun is warm and the park is filled with festive shouts.
            + "It's always done the way you want it!"
            + "Elisa can do it."
            + [You glare at her]
            -
        "I'm the oldest so I decide and therefore you are the <m>prince</m>."
        <f>Marika</f> walks away with <f>her</f> braids dancing.
        They start chatting, planning.
        Every now and then they ask you a few questions but you really don't feel like answering them now. You look at your backpack with the new issues of Ranma 1/2, and you think you were so happy to just sit and read in the sun.
            + [You sit on the steps and ignore them]
            + You make an effort to follow along[], <>
            	but you missed something important, a dragon showed up, what's a dragon got to do with it?
            + "Aren't you hungry?"[]. <>
            	<f>Laura</f> hands you <f>her</f> snack smiling at you. <f>She</f> is always so nice to you.	
            -
        At the end of the park <m>Omar</m>, your <m>brother</m>, is playing with other <m>boys</m>.
        Even though <m>he</m> is much older than you, <m>he</m> always tries to play together. <m>He</m>'s a good big <m>brother</m>.
        "<m>Luca</m>!"
        <f>Marika</f>’s shrill voice reaches you. #completion_33
        "Time to start!"
            + [ou reluctantly approach]
            -
        "So <f>Laura</f> is my little sister, <f>Elisa</f> is our <f>mom</f>, but <f>she</f> got sick and we need the potion but it’s under the dragon’s belly and we need a <m>hero</m> and we're calling..."
        "And who does the dragon?" <f>Elisa</f> interrupts <f>Marika</f>.
        <f>Her</f> braids shake in annoyance.
        "That hedge is the dragon."
        "Never! The bush is <f>mom</f>, <f>she</f> won't move if <f>she</f>'s sick anyway, and I'm the dragon!"
        The two start fighting, you decide it's time to do something.
            + "Charge!"
            -
        You run at the dragon that is probably <f>mom</f> when you notice it.
        Unique, fiery red on the outside and yellow on the inside.
        Beautiful, gigantic.
        <f>Marika</f> yells something at you.
            + [You ignore her]
            + You tell her to come[], <>
            	but she screams to run against the dragon and doesn't want <f>mom</f> to die and be an orphan.
            + You smell the flower[], <>
            	and it's like the best thing in the universe, better even than <f>Grandma</f>'s pies.
            -
        "Someone ripped all the others out."
        <f>Elisa</f> is at your side. <f>She</f>'s right, there are buds everywhere in the grass.
            + "It's not fair, it's so strange and beautiful."
            -
        <f>She</f> sniffs it.
        You turn around: <f>Marika</f> is leaving, <f>Laura</f> is chasing <f>her</f>.
        "Next time I'll do the <m>prince</m>!" <f>Elisa</f>'s voice is resolute.
            + "Next time I see you, I'll hide."
            + "And Marika is the dragon!"
            + "Promise?"[] <>
            	And <f>she</f> says yes, and if <f>Marika</f> breaks <f>her</f> balls <f>she</f> will throw <f>her</f> in the mud.
            -
        And then comes the ball.
        Precisely, it slips between the two of you.
        It hits the flower.
        Than it falls to the ground and takes all the petals with it.
        <f>Elisa</f> turns around, yells a "You jerk!" and runs at someone, leaving you there.
        You bend down to pick up the petals.
        "Look at <f>her</f>, the little <f>sissy</f>, <f>LuLu</f>."
        Laughter.
        You get up, behind you a few children.
        They're only slightly older, occasionally picking on you during breaks at school, bullying everyone. #completion_50
            + [You clench your fists]
            
            + You back away[], <>
            	someone yells, "Hey <f>faggot</f>, I'm talking to you!"
            + You respond in rhyme[], <>
            	but you stammer out a "Did you escape from the zoo?"
            -
        A clod of dirt lands on your head, you wipe your eyes with your back and don't see who's throwing you down on the grass, crushing you with their weight.
        You try to kick, you hit something, a little cry gives you satisfaction.
            + You try to get up[], but they crush you to the ground again.
            + You try another kick[], but it goes wide.
            + "Stop it!"
            -
        You reach out your hands, throw what you find, scratching, biting.
        All <f>womanly</f> things according to your <m>brother</m>. <m>Men</m> need to know how to fight.
        "<m>Faggot</m>!" you gasp, the <m>boy</m> sketches a pretend punch on your nose, you try to give <m>him</m> a real one.
        <m>Lorenzo</m>, the <m>boy</m> who was straddling you, starts to fly.
        The surprise takes away even the desire to get up.
        Quick steps, a few screams and then a hand that reaches out, your <m>brother</m>'s.
            + [You grab it]
            -
        <m>He</m> lifts you up, hands you some water, wipes your face.
        "Nothing serious," <m>he</m> tells you, smiling.
        You sit down on the steps, retrieve two half-crushed snacks from your backpack.
            + [You hand him one]
            -
        "What did you do this time, Lu?"
        You tell <m>him</m> the story of the flower.
        <m>Omar</m> laughs, running <m>his</m> big hand through your hair.
        "For a flower, fuck! You got beat up for a flower!"
            + "It was the last one!"
        "You know what the great thing about flowers is, Lu? They grow back, unlike your little head, if you break it, it doesn't grow back!"
            + "I didn't mean to get beat up!"
        <m>Omar</m> sighs. You can see <m>he</m>'s looking for the words to say something.
            -
        "Lu, I can't spend my life defending you, you know that, right?" #completion_70
        "But I don't want to!"
        "But..." <m>Omar</m> looks ahead, torturing the snack paper with <m>his</m> hands.
        "Why do you think they're mad at you, Lu?"
            + "Because they're stupid!"
            + "Because I don’t play with them?”
            + [Remain silent]
            -
        "You're always alone or with the <f>girls</f> or with <f>Grandma</f>. You're never with the <m>boys</m>, and that's weird."
            + "I play with you."
            -
        "I'm your <m>brother</m>, it's different. And I'm older, and someday I won't be there when you need me, and that worries me."
            + "I don't want you to worry about me."
            -
        <m>Omar</m> looks at you in the eyes, serious.
        "You need to learn how to be in the world, little <m>brother</m>. Play with your <m>mates</m>, <m>beat them up</m> when they offend you, and leave the <f>girls</f> alone. You'll see in a couple of years they won't want to play with you anyway."
        <m>He</m> smiles at you.
            + "Why?"
            -
        "Because they'll want to do <f>girl</f> things and <m>boys</m>, <m>boy</m> things. That's the way life goes."
            + "And you'll always be my friend?"
            -
        "Always, Lu."
        <m>He</m> rubs a knuckle on your head.
        "But now I have to go to my <f>girl</f>. Another thing you'll understand someday."
        You watch <m>him</m> walk away.
        You pick up your backpack and head for home.
        The light is low, swallows are racing across the sky.
            + [You hum something]
            -
        You realize your pants are broken, <f>mom</f> is going to be pissed as hell.
        But then, someone yells across the street.
        They're all there in line, the <m>kids</m> from earlier.
        You notice <m>Lorenzo</m>'s eye is swollen, you hope it's because of you.
        They're yelling at you.
        That you're a <f>sissy</f>, that you're not a <m>boy</m>.
        That you dropped your <m>willy</m>, the dog ate it, didn't it?
        That with long hair you look like a <f>girl</f>.
        You wish <m>Omar</m> was with you, but you're alone.
        Lonely.
        What are you, <m>Luca</m>?
        What are you?
        What kind of <m>boy</m> are you? #almost_there
        -> bullet_hell_amab_uno
    
    === bullet_hell_amab_uno ===
        $bullet_hell_amab_uno$
    -> atto_amab_due
    
    === atto_amab_due ===
    Teenage. Winter. At grandma's house. #title
  
    <f>Grandma</f>'s house is like a pile of leaves, layers upon layers of objects.
    The living room is overrun with forty years of <f>fashion</f>, <f>sewing</f>, <f>knitting</f> magazines.
        + [Get a copy of Burda]
        -
    "We're here to throw this stuff away, <f>LuLu</f>."
    <m>Omar</m> walks in holding some boxes.
    <f>Laura</f> comes in from behind and gives you a hug.
    "Are you okay honey?"
        + [You set the magazine down]
        
        + You throw the magazine in Omar's face[], who shrugs and calls you a dork.
        + "Grandma taught me how to sew[."] <>
        on the sly from <f>Mom</f>, since I was ten years old. I would spend hours here reading and drawing <f>decorations</f> that <f>she</f> would then <f>knit</f>. When it was cold we'd sit in front of the TV and watch dinosaur documentaries and grind miles of wool."
            ++ [It was nice]
            -
    "It's not like <f>she</f> died." <m>Omar</m> takes the other magazines and boxes them up.
    "You locked <f>her</f> in a nursing home, it's the same thing."
    "<m>Luca</m>, it's for <f>her</f> own good."
        + "She didn't want to go".
        -
    "Why didn't you accept our proposal?" <f>Laura</f> has <f>her</f> hands on <f>her</f> hips and stares at <m>Omar</m>.
    They don't get along very well. When you got together <m>Omar</m> was happy ("So you're not a <f>faggot</f>!"), but <f>Laura</f> is convinced <m>he</m>'s a bad influence on you.
    "Two fifteen year old <f>dykes</f> to stand behind an <f>old crazy lady</f>?"
        + "She's your fucking grandmother!"
        + "At least she'd be happy."
        + "So mom can sell the house[."] and make money off of it."
            "The money is to pay for the nursing home, you idiot."
        -
    Continue boxing in silence, the only noise being the moving of items. <m>Omar</m> stacks things angrily, closes the boxes, walks down the stairs stomping <m>his</m> feet, returns, repeats.
    <f>Laura</f> hands you things, when your eyes meet <f>she</f> smiles at you, every now and then <f>she</f> gives you a kiss on the cheek. #completion_33
        + [Grandma likes Laura a lot]
        -
    <f>She</f>'s always been of the opinion that if a rule is wrong, it's your duty to break it.
    After Grandpa's death, <f>she</f> never wore mourning garments, <f>she</f> was glad that the violent <m>man</m> was dead and didn't want to pretend otherwise.
    When <f>she</f> started hunting, some <m>men</m> teased <f>her</f>, some tried to get too close.
    "They act so big, but if you shoot them near their feet you see how they run."
    And <f>Laura</f> is a bit like that.
    "What are you thinking?"
        + "It takes courage to break the rules.["]
        <> I would like to be like <f>her</f>."
        + "You two are so much alike.["]
        <> <f>Her</f> nets were made of wool and yours of bits, but you have so much in common." <f>Laura</f> laughs, "Woah, I didn't know you were a poet!"
        + "Mom never got it["]
        <>, what matters to <f>her</f> is what other people think and that's it."
        -
    
    "You know <f>she</f> loves you a lot, right? You can see it in <f>her</f> eyes every time <f>she</f> looks at you."
    <f>Laura</f> smiles at you, handing you a <f>dress</f>.
    It takes you a moment to recognize it.
        + [You take a closer look at the pattern]
        -
    Hibiscus flowers.
    A long dress <f>she</f> made you two years ago.
    You fought with <f>her</f> about that dress.
    You screamed to hide your fear, fear of how much <f>she</f> had seen in you. 
    Fear of the pleasure you felt at the idea of wearing it, of standing there with <f>her</f> in that <f>long summer dress</f>, <f>sewing</f> and talking, with the confidence that no <m>ball</m> would destroy you.
    <f>Laura</f> looks at you tenderly. #completion_50
    "What are you thinking about?"
        + [You share that memory with her]
        -> ricordo
        + [You put the dress in the box]
        -> scatolone
        + You talk about the weather[].
        <f>Laura</f> kisses you on the cheek. "God, are we already like those old couples who have nothing left to say to each other?"
        -> scatolone
        
        = ricordo
        As you speak you feel a weight disappear that you had grown accustomed day by day.
        Outside, autumn seems warm, but <f>Laura</f>'s face turns cold.
        <f>Her</f> hand clenched in yours feels like a fist.
            + "These are things of childhood..."[] you try to say, even though you were thirteen two years ago.
            -
        "Not, I'm not judging you Lu, really. I'd just like to understand..."
        "Me too." #completion_70
        <m>Omar</m> stands in the doorway.
        "Are you gay, <f>LuLu</f>? Just because you're with <f>Laura</f> doesn't mean you're <m>normal</m>."
        "No!"
        <f>Laura</f> sticks up for you, though <f>she</f> falters.
        "<m>Omar</m>, why do you always have to be such a big asshole?
        "I'm just saying what I think."
        Your <m>brother</m> approaches you.
        "You know why <f>Mom</f> doesn't want you with <f>Grandma</f>? Because <f>she</f>'s spent <f>her</f> time indulging your <f>quirks</f>."
            + "They're not quirks!"
            -
        "They're certainly not <m>normal</m> things. I… <m>Luca</m>… Fuck!I love you, I really do."
        <m>Omar</m> is looking at the floor. <m>He</m>'s never said anything like that to you.
        "I want, we just want to see you happy. Instead you just want to be <f>weird</f>. Christ, <f>Mom</f> is convinced <f>Laura</f> is a phase before you tell us you're <m>gay</m>. The world is backwards with you."
        You can't understand how you feel. What do you feel right now? What should you do?
            + [You think of Grandma, her strength]
            "I love <f>Laura</f>, and I don't need you or <f>Mom</f> to tell me what to do or not to do!"
                 -> litigio
            + [You look at your brother, your hero]
            <m>He</m> said, "I love you."
                -> accomodante
            + [Tiredness grinds your bones]
            You leave them there and walk away.                    
                -> litigio

            
            = litigio
            Your <m>brother</m> raises <m>his</m> voice, yelling at you.
            <f>Laura</f> starts to argue with <m>him</m>.
            They make a list of the things that make you a <m>man</m>, and the things that <f>don't</f>.
            Each word comes like a slap in the face, like a bullet.
            You'd like to say that it's up to you, that your voice should be yours and not theirs! But what would you say now?
            Because you don't know how to answer the voice in your head that asks you:
            "What are you, <m>Luca</m>? 
            A <m>boy</m>? 
            A <f>girl</f>? 
            What are you?" #almost_there              
                -> Bullet_hell_amab_due
            
            = accomodante
            You take the <f>dress</f> from <f>Laura</f>'s hands, and put it in the box.
            <m>Omar</m> suggests we take a break for a beer.
            <f>Laura</f> looks at you in the eyes, <f>she</f>’s about to say something, but then turns away.
            The <f>dress</f> looks at you from the box and silently accuses you:
            "What are you, <m>Luca</m>? A <m>boy</m>? A <f>girl</f>? What are you?"
                -> Bullet_hell_amab_due
    
        
        = scatolone
            <m>Omar</m> stands in the doorway with three beers in <m>his</m> hand, a gesture of peace.
            "Have you stopped sulking?" <f>Laura</f> asks <m>Omar</m>, uncorking the bottle.
            "I'm not sulking, but I'm pissed that my <m>brother</m> treats me like a monster. I love <f>Grandma</f> too, I really do."
            <f>She</f> turns <f>her</f> back on you, the tone of <f>her</f> voice more tremulous.
            "I don't want to wake up every morning with the fear that <f>she</f> won't answer the phone and <f>she</f> is dead alone here in the house."
                    + [You rest a hand on Omar's shoulder]
                    
                    + [You look at Laura, who takes your hand]
                    "You're not a monster, I didn't mean to hurt you."
                    + [You don't say a thing]
                    -
                <m>Omar</m> twists the bottle cap back between <m>his</m> fingers. #completion_70
            "There was a time in our lives when someone decided I had to be the <m>strong</m>, <m>practical</m> one, maybe because you, little <m>brother</m>," <m>he</m> looks at you "you've always been in a world of your own. You complain about <f>mom</f>, but in the end all <f>she</f> does is worrying about you."
                    + "I don't need her worry."
                    + "And <f>she</f> doesn't see you."
                    + [You remain silent]            
                    -
        "I know I'm a roughneck and I'm not as good with words as you are. But I care about <f>Grandma</f>, and I want <f>her</f> to be happy. And I care about you, and I want you to be happy. But I don't know how to do that."
                    + [Omar's glossy eyes fill you with guilt]             
                     -> colpa
                    + "I don't demand you to be perfect["], only that you allow me to be myself."
                    -> myself
                    + [Omar needs you]
                        You put aside words and explanations and hug him.
                    -> colpa
        

        
            = myself
           "And what does Lu mean? What are you?"
            You look at your hands, hoping someone has written the words to say it on them, but all you find is dirt from the house and boxes.
            "<m>Omar</m>, leave <m>him</m> alone."
            "That's what I want but I also have to figure out what that means, right, to leave <m>him</m> alone? What are you <m>Luca</m>? Because I don't understand it. You're with <f>Laura</f> and I tell myself you're a <m>man</m>, but you like <f>faggot</f> things though and how many times has <f>grandma</f> filled you with sweaters even <f>mom</f> wouldn't wear? What are you <m>Luca</m>, please tell me so I can help you."
            And you really want to give <m>him</m> an answer, find a solution, but you don't know.
            <m>Luca</m>, what are you? What are you <m>Luca</m>? #almost_there         
                -> Bullet_hell_amab_due
        
            = colpa
           "You're doing good, big <m>brother</m>, you really are. I couldn't ask for better."
            You smile as you tell <m>him</m> and <m>he</m> smiles back and then punches you, calling you a <f>fag</f>, and resumes canning stuff, telling anecdotes about the last night out with the <m>guys</m>.
            <f>Laura</f> looks at you and there is something bitter in <f>her</f> gaze.
            "You can't make everyone happy, <m>Luca</m>. You're going to end up disappearing by doing it."
                    + "And what am I supposed to do?"
                    -
            "Tell your truth, whatever it is."
                    + "About what?"
                    -
            <f>Laura</f> shrugs, but <f>her</f> eyes are tense, expecting an answer.
            The only thing you do is walking away.
            You go into <f>Grandma</f>'s room.
            The window is ajar, <f>her</f> robe lying on the coffee table next to cigarettes and medicine.
            A picture of you, <f>her</f> and <m>Omar</m> many years ago, when everything seemed simple, when no one demanded answers from you.
            But it's impossible to go back to that moment, because <f>Laura</f>'s eyes are still asking you.
            What are you <m>Luca</m>? 
            Are you a <m>boy</m>?
            Or not? #almost_there               
                -> Bullet_hell_amab_due
        
        
        === Bullet_hell_amab_due ===
            $bullet_hell_amab_due$
        -> atto_amab_tre
        
    === atto_amab_tre===
        Adulthood. Autumn. Home. #title

        <f>Laura</f> repeats to you to hurry up.
            + "But that's at least six hours away!"
            -
        "And that's not enough! Bring something to munch on."
        You rummage through your kitchen cabinets, retrieving chocolate and peanut butter.
        You don't feel like going to that stupid party tonight.
            + "But what if we stay home[?"] and watch horror and eat junk food?"
            + "Did I mention that I hate Marika?"
            + "But since when do you like Halloween?"
            -
        You walk up the stairs without <f>Laura</f> answering. The only light is from the study.
        You continue to be amazed by this house, this life. The things you've done together.
        You go to enter but <f>she</f> rushes to the threshold, wraps <f>her</f> arms around your neck.
        "Promise me that for once, just once, you'll say yes without question."
            + "Only if there are Labradors in that room"[].
            "There's something better than labradors!" <f>she</f> replies. "No way, nothing is better than labradors!"
            + "Last time I agreed we got married[."], and I still have to figure out if that was a good idea."
            <f>Laura</f> smacks you on the head laughing.
            + You smell a trap[]. <f>She</f> recognizes your expression.
            "When have I ever done anything that got you in trouble?" You make a fairly detailed list that contains chocolate, sea lions, an Elon Musk costume, and a guillotine. Oh yeah, and that time in the cemetery with the Oujia board. <f>She</f> watches you with <f>her</f> arms crossed, mock seriousness.
            -
        <f>She</f> takes you into the room.
        There are pieces of jeans, <f>makeup</f>, an obscene hat and a <f>wig</f>.
            + "Where is RuPaul's body?"
            -
        <f>She</f> looks at you, <f>her</f> eyes full of affection.
        "Every now and then I think of that shy, insecure <m>kid</m> I met twenty years ago, and I'm amazed to see who you've become."
        You don't know what to answer, even though it's true: at some point, unexpectedly, adulthood has given you a confidence you never imagined you could have.
        <f>Laura</f> changes the subject.  #completion_33
        "Remember how last year <f>Marika</f> said we're the only ones who don't do couples costumes?"
            + "And that's a problem?"
            + "It's hard to forget[!"], since <f>she</f> yelled it drunk from the balcony."
            + "Remind me why she's your friend?"
            <f>She</f> throws a marshmallow at you. 
            -
        "This year I want to prove <f>her</f> wrong. And I've asked myself, what's the scariest couple to bring to a Halloween party?"
        You search fruitlessly for a sensible answer.
        <f>Laura</f> looks at you with anticipation.
            + "Bonnie and Clyde?"
            + "Woody Allen and Soon-Yi?"
            + "My parents?"
            -
        <f>Laura</f> lifts up the denim pieces.
        "<f>Britney</f> and <m>Justin</m> in 2001! Come on, what's cringier than faux denim and <m>Timberlake</m>?"
        <f>She</f> grabs the denim print fabric pieces.
        "I found two costumes but I didn't really like them so I took them apart to make them better but um, I make video games, I'm not a <f>seamstress</f>. And I thought you could help, and in return I'll make you up!"
            + "I haven't sewn since I was thirteen!"
            "I'm sure it's like riding a bike."
            + "Makeup?"
            + "Can't we just go dressed ourselves?"
            <f>Laura</f> ignores you.
            -
        "And surprise of surprises...I'll be <m>Justin</m> and you'll be <f>Britney</f>!"
        You make to say something, but.
        But something stirs in your belly, a warmth that feeds as you look at the denim fabric, the <f>wig</f>, the <f>makeup</f>. #completion_50
        You sit silently in front of the sewing machine and, well: it's really like riding your bike again.
            + [You start sewing pieces of fabric]
            -
        It's a hopping of memories this afternoon, going from one thing to another.
        Mentioning the missing <f>starlet</f> of the day makes you talk about what you were doing that year, a song brings back a broken friendship, a drunken night at the beach.
        "Haven't you talked to <m>him</m> again?"
        You know it's about <m>Omar</m>.
        You haven't spoken in two years now, but every now and then <f>Laura</f> asks you.
            + "No."
            At some point, you couldn't take <m>his</m> insinuations anymore.
                -
        The fabric flows quickly under the machine.
        <f>Laura</f> tries on the dress: tanned by <m>Justin</m>, <f>she</f>'s ridiculously hot.
        "And now sit down, it's my turn!"
        <f>Her</f> light hand shuffles, traces, brushes your face.
        Each time <f>she</f> pulls away <f>she</f> smiles in satisfaction.
            + "Since when did you plan this?"           
             -
        "When I got the idea, I realized that it had actually been there all along. That it was something I wanted to do with you, that I could only do with you."
        <f>She</f> kisses you on the nape of your neck, grabs your hand to get you up, leads you to the mirror.
        The <f>dress</f> is hideous, the <f>wig</f> is awful.
        But your eyes fill with what they see, the face redrawn by the <f>makeup</f>, the waist traced by the belt, the <m>hairy chest</m> sticking out of the neckline.
            + "Should I shave?"
            -
        You murmur.
        "Only if you don't like yourself like this."
        <f>Laura</f> squeezes your hand.
        You look at yourself, and so you like yourself so much.
        You're afraid, you're gasping for air, yet you have the certainty that for the first time you're really seeing yourself.
        It's as if someone has removed a patina from your eyes.
        As if until now the body you saw in the mirror was that of another person, something you kept erasing, that you never wanted to remember.
        But now it's really you.
        You admire your huge eyes under the <f>eyeliner</f>, and the way your lips explode red between the hairs of your <m>beard</m>.
        How the muscles and folds of your <f>dress</f> enhance each other.
            + [...]
            -
                ...
            + [...]
            -
            ... ...
                
            + [...]
            -
            ... ... ...
        You start to cry. #completion_70
        <f>Laura</f> hugs you.
        "Are you okay, honey?"           
            + Reject everything you feel[], because there can be no room for that. Sincerity will push <f>her</f> away like it pushed <m>Omar</m> away.
                    -> Respingi
            +  You can't tell her the truth[], you can't. <f>Laura</f> is wonderful, but so was <m>Omar</m>, and where is <m>he</m> now?            
            -> Perdere
            + You try to find the words[] to tell <f>her</f> how you feel.
                    -> Sinceramente
        
                
        = Sinceramente
        ~  amab_tre = 2
        
            But they don't come, it's like there's a gap, a piece that's missing.
            You smile, you stammer that everything is good, it was just unexpected. You are out of breath.
            You catch a glimpse of yourself in the mirror again and smile.
            A voice inside you screams that you <m>suck</m>.
            You try to ignore that voice, but it's loud from everything you've been told throughout your life.
            <m>Omar</m> who doesn't consider you a <m>real man</m>.
            The neighbor who jokingly calls you "<f>lesbians</f>".
            Your <f>mother</f> who tells you that you look too much like <f>Grandma</f>.
            Your <m>father</m> who keeps giving you tickets to the <m>stadium</m>.
            The judgments, the things said and not said.
            You look in the mirror and you look like <f>half a thing</f>, <f>a wrong thing</f>.
            A <f>woof-woof</f>, an <f>abomination</f>.
            You wonder though.
            What am I? What are you <m>Luca</m>? What the hell are you? #almost_there           

            -> bullet_hell_amab_tre_bis
        
        = Perdere
        ~  amab_tre = 1
        
            <f>She</f> sits you down next to <f>her</f>, <f>her</f> soft smell filling you.
            <f>She</f> looks at you, and you read concern in <f>her</f> eyes.
            "I'm sorry, honey," <f>she</f> tells you.
                + "For what?"
                -
            "It was, it was kind of a trap. I was aware of it, even though I pretended I wasn't."
            <f>She</f> catches <f>her</f> breath.
            "I've known you for so many years, and I’ve noticed so many things. A relationship always shows you everything in between the folds eventually, right? That's the beautiful and scary thing. Noticing things that maybe the other person doesn't want to see."
                + "I would like to see them."
                + "I don't know where to look."
                + "I'm afraid of the consequences."               
             -
            "Have you tried answering the simplest question?"
            You try looking into <f>her</f> eyes.
            "Are you a <m>boy</m>, Lu?"
            You look down at your hands.
            The tension of the last few hours is too much, <f>Laura</f>'s voice disappears, drowned out by all the comments in your life.
            From <m>Omar</m> asking you if you're <f>queer</f>, from classmates calling you a <m>sissy</m>.
            From the gym teacher who told you you were <f>too delicate</f>, from the literature teacher who extolled your <f>feminine sensibilities</f>.
            That <m>guy</m> on the bus and "why are your nails so <f>manicured</f>?"
            Your co-worker saying you're <m>rough</m> as a <m>bricklayer</m> but have a <f>doll's face</f>.
            All the voices that have been asking to take a stand your whole life, to tell them what you are.
            That it is a due act, to give them an answer.
            What are you, what are you <m>Luca</m>?
            What are you? #almost_there          
            -> bullet_hell_amab_tre
        
        = Respingi
            But repressing doesn't work anymore.
            There's too much warmth in your belly, it feels too good.
            You get up, walk around the room, try to get something out.
            -> Perdere
            
        
    ===bullet_hell_amab_tre ===
        $bullet_hell_amab_tre$
    -> finale_amab_uno
    
    === bullet_hell_amab_tre_bis ===
        $bullet_hell_amab_tre$
    -> finale_amab_due
        
    === finale_amab_uno ===
        You open your eyes again and you're in <f>Laura</f>'s arms.
        <f>Her</f> eyes are streaked with tears.
        Outside fires and noises of celebration, children screaming.
        And there, at the bottom of it all, with your body and head emptied, you have the answer.
            + "I am not a [boy."]<>           
             -
        <m>boy</m> or a <f>girl</f>. Or something in between, but more like something else. Like I keep wondering if this thing is white or yellow or black when it's purple, and I didn't even know purple existed."
        <f>Laura</f> looks at you confused.
            + "Are you going to leave?"
            -
        <f>She</f> punches you in the shoulder, serious.
        "You idiot, no, never. I love you."
        You remain silent for a moment, then <f>she</f> hands you a beer.
        "This is something we're going to do together, finding this purple thing, okay? You're not alone, lonely, whatever. Fuck. I'm here. I love you. I'm going to say some shit and for that I already apologize but in short..."
        You shush <f>her</f> with a kiss.
            + "Are we going to go show this new me to the world?"
            + "Do you know how angry Marika will be[?"] when <f>she</f>'s not the first in something for once?"
            + "Come on, before I become the Britney of 2007!"
            -
        "I've got a plan B: a <f>lesbian</f> <f>girl</f> party, a quiet place to hang out, a couple of old school friends should be there too!"
        The way <f>she</f> looks at you makes you feel invincible.
        You walk down the street together, fingers intertwined.        
        You stop in front of a storefront #almost_there.
            + [You look at your reflection]
            -
        -> bullet_hell_buono
    
    === finale_amab_due ===
       When you open your eyes, <f>Laura</f> is crouched in front of you, <f>her</f> eyes fixed in yours.
        "Hey, sweetie!"
            + [You rest your forehead on hers]
            -
        "What happened to that little head?"
        You take a breath.
            + "But you already knew that, so what?"
            -
        "I'd been noticing for a long time that there's something going on inside you for a while. I wondered what would happen if that thing never came out, and I didn't like any answer, not at all."
        <f>She</f> sits down next to you.
            +"I know what I'm not, Laura[“]. I don't feel like a <m>man</m>, but I don't feel like a <f>woman</f> either. It's like being asked to choose only between eating an apple or a pear, when my mouth is full of the taste of every berry."
                "Apples are boring!" jokes <f>Laura</f>.
            + "Not when cooked with sugar and cinnamon."
            -
        "This metaphor is getting creepy," <f>she</f> kisses you, "but I think I get it."
        "And you're okay with that?"
        "At least now when the <m>fascist</m> neighbor calls us '<f>lesbians</f>' I can tell <f>her</f> it's true!"
        <f>She</f> turns away.
        "But it's not true, is it? Oh fuck, what do I say now? But so I'm not <m>straight</m> anymore?"
        You grab <f>her</f> hands.
            + ["We have time."]"I'd say we have all the time in the world to find these answers, we don't have to do it tonight, do we?"
            -
        <f>She</f> relaxes, smiling.
        "You're right. Only one thing matters: we'll find them together. We'll find the berries and my heterosexuality or whatever it is."
            + "Can you imagine Marika[?"] not knowing how to introduce us to <f>her</f> friends anymore?"
            -
        "Speaking of <f>Marika</f>: do you feel like going to that party?"
        You look in the mirror.
        The crying and the tension have messed up your <f>wig</f> and <f>makeup</f>.
        You feel pretty like never before in your entire life. You like the person you see in the mirror.
        You love them.
        But the idea of having your friends see you like this, scares you.
            + [You nod your head]
            -
        <f>Laura</f> smiles at you.
        "I have a plan B: a <f>lesbian</f> <f>girl</f> party, a quiet place to be, a couple of old school friends should be there too."
        A little fear remains.
        But you feel you've stayed hidden too long, you feel like coming out, showing yourself.#almost_there
            + [You take a quick look in the mirror]
            -
        -> bullet_hell_buono



//STORIA PALLINA
    === intro_afab ===
   ~ gender = 1
        "There's no need, really."
        <f>Mom</f>'s voice wakes you up.
        <f>She</f>'s talking to <f>Grandma</f>, sounding annoyed.
        You've just been born, but you can feel all the tensions.
            + [You scream]
            -
        It's the only thing you know how to do if something bothers you.
        "<f>She</f>'s hungry!" says <f>Grandma</f>, hands clasped on the steering wheel. #street
        "I'll feed <f>her</f> at home or <f>she</f>'ll throw up, it's almost time."
        <f>Grandma</f> snorts, <f>Mom</f> as well.
            + [You yawn]
            -
        Your eyes strain to look out the window.
        Half-blind, they just recognize halos, figures, outlines that seem like they could be anything.
        Like you.
        The car stops.
        "You need help? Food? I could run to the grocery."
        "No," <f>Mom</f> interrupts <f>Grandma</f>, "we already have everything. Thanks for the ride."
        "It's the least for my <f>granddaughter</f>."
        Silence.
        The car moves away.
        <f>Mom</f> opens the house, it smells stale and of rotten food.
        "Welcome, <f>Elisa</f>."
            + [You suck your finger]
                -
        <f>She</f> smiles and shows you the two-room apartment.
        "I know it's small, but it's just us, honey. Two <f>women</f> against the world!" <f>she</f> laughs.
        "Okay, one and a half for now. But here," <f>she</f> shows you a corner of the room, "is your crib, here are the stuffed animals and then look at this carousel!" and spins a bunch of <f>pink</f> hanging animals.
            + [You try to grab one]
            -
        <f>Mom</f> smiles and pulls you away, and you protest with your little fists.
        "Are you hungry?" <f>she</f> asks, and slumps down on the couch.
        <f>She</f> brings you to <f>her</f> <f>breast</f>.
        "You know what? You're going to be the best in school, so you're going to make me proud. I’ll get you a lot of <f>flowery dresses</f>, because when I was little I wanted them too, <f>girls</f> always like <f>flowery dresses</f>."
        <f>She</f> switches positions with you.
        "And then you're going to be a doctor, yes, you have doctor hands. Maybe <f>obstetrics</f>, so you'll make a lot of other <f>moms</f> happy. Although I'll be the one for you, always."
        Sigh.
            + [The sleep grabs you]
            -
        "And maybe when you get married to a nice <m>man</m> you'll let me live with you, so I can help with the grandkids, and you can keep working. And if I'm still <f>beautiful</f>..."
        But you are already asleep.
        In the dream you see the road from before, the journey you took.
        But there are no more colors and shapes and all the possible things.
        There are only <m>blue squares</m>
        <f>pink</f> triangles
        and huge hands crushing and tearing at you, trying to shape you. #people       
     -> atto_afab_uno

    
    === atto_afab_uno ===
    Childhood. Spring. School. #title
        
        With your feet you tap an imaginary rhythm on the floor.
        "<f>Elisa</f>, stay still!"
        <f>Mom</f> smiles but <f>she</f> is a statue, <f>she</f> wants you to be a statue.
        A <f>beautiful</f> little <f>statue</f> in a <f>flowered dress</f>, white shoes, and <f>upswept hair</f>.
        <f>She</f> spent the entire car ride telling you that you need to make a good impression.
        That the parent/teacher meeting is a time when parents are judged harshly.
        That a <f>single mother</f> is always guilty, and because of that you must not make any mistakes.
        You think it doesn't make much sense, but you trust <f>her</f>.
            + [Look outside]
            -
        You trust <f>her</f>, but that doesn't erase the boredom.
        Some <m>guys</m> are chasing each other.
        That loudmouth <m>Lorenzo</m> brought a <m>ball</m>, they're making teams.
            + "Mom?"
            -
        <f>She</f> ignores you.
        Across the yard your classmates are chatting.
        You recognize <f>Laura</f>, <f>Marika</f>, <f>Chloe</f>, and an older <f>girl</f>, <f>Emma</f>.
            + "Can I go to the bathroom?"
            -
        "You were in there two seconds ago, honey."
        <f>She</f> sighs and takes your hand.
        <f>Mommy</f>'s scent is so strong it gives you a headache.
        "If you're good then I'll get you some ice cream, okay?"
        <f>She</f> hands you a Roald Dahl’s book, which you unwillingly flip through. #completion_33
        "Goooal!" someone yells from outside.
        <f>Sister Addolorata</f>'s big voice drowns out the shouts of your classmates.
        They make promises, broken the moment the window is closed.
        The <f>nun</f> looks out a small door, calls to your <f>mother</f>.
        “You stay here ten minutes, just ten minutes okay? And then you'll get your ice cream."
            + [You nod your head]
            -
        How long is that, ten minutes? 
        You count six breaths. Seven. You decide that's enough.
        You stand up.
            + [Join the boys]
            -> gioco
            + [Go to your girlfriends]
            -> compagne

            
        
            = gioco
                <m>Lorenzo</m> looks at you annoyed, but <m>Luca</m> joins you smiling.
                "Do you want to take my place?"
                <m>He</m> doesn't wait for an answer, just hands you the <m>ball</m> and runs to the <f>girls</f>.
                An older <m>boy</m> high-fives you.
                You hear <f>Marika</f> and <f>Chloe</f>'s idiotic giggles.
                "You're the penalty <f>girl</f>, right?"
                    + You nod[], barely hiding your pride.
                    -
                "It was just luck," <m>Lorenzo</m> comments.
                "Let's try it!" says the other <m>boy</m>. "Just be on my team, okay? Stay close to <m>Lorenzo</m>, so we can rattle <m>him</m>."
                You're a splinter.
                Your little legs have built up so much energy while you've been waiting in the chair, you now run like a spring.
                It takes you two minutes to score. <m>Lorenzo</m> calls a non-existent penalty.
                    + [You tell him to shut his frog mouth]
                    -
                One more goal, then an assist to your teammate.
                You feel like you're flying.
                <m>Luca</m> and <f>Laura</f> cheer for you. #completion_50
                You smile, you steal the ball from <m>Lorenzo</m> who knocks you down.
                The older <m>boy</m> says something but you ignore <m>him</m>.
                    + [You throw a punch to Lorenzo]
                    -
                It's chaos.
                The <m>boys</m> make fun of <m>Lorenzo</m> for getting beat up by a little <f>girl</f>.
                You hear <f>Chloe</f> behind you calling out to <f>Sister Addolorata</f>.
                You look at <m>Lorenzo</m> who is struggling to hold back <f>tears</f>.
                A hand grabs your shoulder, a very <f>sweet scent</f> invests you.
                    + [Puffs]
                    -
                Like a deflating balloon, you have stopped flying. #completion_70
                The hand is <f>Mom</f>'s, <f>her</f> voice screams that the dress is torn, the good <f>dress</f> and Christ, no! The white shoes are filthy!
                <f>Sister Addolorata</f> picks on the older <m>boy</m>, who yells at <f>her</f>.
                <f>Marika</f> points and laughs.
                "That's not for little <f>girls</f>!"
                    + [You stick your tongue out at her]
                    -
                <f>Mom</f> slaps you in the face.
                You feel like you're in the middle of a stage, and everyone is screaming your name.
                You want to get off, but everyone asks you: what are you <f>Elisa</f>, what are you?
                Why do you act like a <m>boy</m>?
                Why don't you <f>dress properly</f>?
                Why do you <m>curse</m> and <m>hit</m>?
                Why are you good at <m>soccer</m>?
                What are you <f>Elisa</f>, what are you? #almost_there
                ->bullet_hell_uno_afab

                
            = compagne
                Not exactly your first choice but the one that makes the most sense: no <m>ball</m> equals no mess equals no scolding from <f>mom</f>.
                "Nice shoes!" comments <f>Marika</f>.
                You look at your feet.
                They're tight, you only wore them for your cousin's communion.
                    + "What are you talking about?"
                    -
                The answer is so boring that your brain ignores it.
                You watch the ball run from one side to the other.
                <m>Lorenzo</m> showing off to <m>Luca</m>.
                "Why are <m>boys</m> such idiots?"
                It's <f>Chloe</f> talking to you.
                    + "At least they have fun."
                    -
                "So do we. We're playing <f>princesses</f>, we're missing one."
                    + [You try to ignore her]
                    -
                "Are you coming?"
                You don't feel like it, but you have an idea.
                    + "Would you like a challenge?["] If you win, I'll play <f>princesses</f> until the end of school."
                    -
                <f>Chloe</f>'s gaze is doubtful. Behind <f>her</f> come the others. #completion_50
                    + "On that tree[..."]" you point to an old elm tree with low branches "is <f>Sister Addolorata</f>'s ledger. If you get it before me, you have won."
                    -
                "It was you then who stole it?" <f>Laura</f> is surprised.
                You are full of pride. No record, no proof of the dozens of notes you took.
                And those of many classmates.
                "What a <m>tomboy</m>!" <f>Marika</f> raises <f>her</f> pointed nose.
                "But <f>Chloe</f> is a nerd, then for sure <f>she</f>’ll take it to the <f>nuns</f>!" <f>Laura</f> is unconvinced.
                "I'm not nerdy!"
                    + [You looks at Chloe with her arms folded]
                    -
                <f>Chloe</f> walks over to the tree, rests <f>her</f> hand and looks up.
                "What if I lose?"
                    + "You and Marika stop making me be a princess["] every day, and let me be a <m>hunter</m>, or a <m>dragon</m>."
                    -
                <f>Chloe</f> doesn't wait for you, and starts climbing.
                You dive onto the lowest branch.
                <f>She</f>'s faster than you thought.
                Cleverly, <f>she</f> makes sure to occupy the narrowest branches so you can't outrun <f>her</f>.
                There are people cheering. <m>Boys</m> are screaming your name.
                    + [You jump onto a weaker branch]
                    -
                You make it, <f>Chloe</f> catches up though. 
                <f>Her</f> dress rips and <f>she</f> ignores it.
                Maybe you like <f>Chloe</f> now.
                To the screams of the children now they are adding those of the adults. #completion_70
                "Get down, now!"
                <f>Marika</f> holds <f>Sister Addolorata</f>'s hand, and points at you.
                Your <f>mother</f> is livid, but you can't stop now, you don't want to lose.
                    + "Give up, I'm faster than you!"
                    -
                <f>Chloe</f> doesn't answer you.
                The <f>nuns</f> and your <f>mother</f> are under the tree.
                <f>Chloe</f> shouts: <f>she</f> has grabbed the ledger.
                    + [A curse escapes you] <f>Marika</f> is scandalized.
                    -
                And then <f>Chloe</f> falls down.
                A moment of silence and <f>she</f> starts to cry.
                You get off in a hurry.
                You can tell right away that <f>her</f> arm is broken.
                And your <f>mother</f> is furious.
                In front of everyone <f>she</f> carries you away by weight.
                <f>Her</f> voice echoes that of <f>Marika</f>.
                <f>She</f> tells you that <f>she</f> doesn't have a <f>daughter</f> but a monster, a <m>boy</m>, that <f>she</f> is a disgrace, that the <f>dress</f> is a disaster.
                <f>Marika</f>, the <f>nuns</f> want to know who you are, <f>Elisa</f>.
                What kind of <f>girl</f> you are, <f>Elisa</f>.
                You are not a <f>girl</f>, <f>Elisa</f>. What are you?
                What are you? #almost_there                
                    ->bullet_hell_uno_afab

    
    ===bullet_hell_uno_afab===
    $bullet_hell_afab_uno$
    -> atto_afab_due
    
    === atto_afab_due ===
    Teenage. Winter. School.  #title
    
        From downstairs only a few laughs.
        There is a strange silence: no one is sleepy, yet the chatting seems to be over.
            + "We did it!"
            -
        Sitting on the desk you pass the cigarette to <f>Chloe</f>, with a strained smile.
        Outside the city sleeps, the square is empty.
        Tomorrow morning it will be filled with police trucks, professors, some <m>rich guy</m>. Maybe a couple of bored journalists.
        For now, though, the plaza rests.
        "So much for 'three fucking <f>dykes</f>!', right?"
        <f>Emma</f> tries hard to sound calm, but <f>she</f>'s shaking.
            + "I'm proud of you, Bunny."         
            -
        And it's true, because in spite of your anxieties and fears, <f>Emma</f>-SailorMoonSuperFan-<f>Bunny</f> never gave you up, not even when half the student council insulted all of you in front of everyone.
        Three fucking <f>dykes</f>.
        Yet you got the okay, found over thirty willing <f>female</f> students,and the squatting began.      
        "Do you think <f>Marika</f> could really use all of this?"
        <f>Chloe</f> hands the cigarette back to you.
            + "At least she'll know she's not alone."
            -
        "There's nothing more we can do, I'm afraid."
        <f>Emma</f> looks out the window.
        <f>Marika</f>: suspended after reporting principal harassment.
            + "And then tomorrow Lorenzo will be in deep shit!"
            -
        "I wonder if <m>his</m> majesty as well as eternal school representative <m>Lorenzo</m> Shitface Guagliotti will do something useful.”
        "Naa, <m>he</m>'ll say something about the legality to be respected and the need to cooperate with the teachers."
        <f>Chloe</f> clings to your arm.
            + "With his legality we get beaten up[."]. <m>He</m> can shove it up <m>his</m> ass."
            -
        <f>Chloe</f> stares at you smiling, proud and in love.
        <f>Emma</f> reads something in <f>her</f> gaze.
        <f>She</f>'s never asked you for anything, but <f>she</f> knows.
        "I'm going to go down to the twins, try to get some sleep."
        You hug <f>her</f>.
            + "Take care of the primaries!"
            + "I love you, Bunny!"
            + "If you don't feel like it, no one will judge you."
            <f>She</f> smiles at you, tired, "We started together, let's finish together."
            -
        As the door closes, <f>Chloe</f> kisses you.
        "How are you so cool?"  #completion_33
            + "I feed off of Lorenzo's anger."[]
            <f>She</f> gives you another kiss. "I was hoping it was a little bit about me."
            + "I steal beauty from young virgins."[]
            "Then I'm safe," <f>she</f> replies mischievously.
            + "I ignore my feelings[."], so they rot, become compost and feed my cells."
            "Idiot," <f>she</f> pretends to slap you.
            -
        "What will your mother say?"
        <f>She</f> asks you by laying out a small sleeping bag, so small that you wonder how your body will fit in there.
        You put your hands on your hips and imitate your <f>mom</f>. 
            + ["Why me, young lady!"] "Because I didn't raise you on my own to see you become a <m>hooligan</m>! I work two jobs and one of them is to pay for your damages, goddamn it!"
            -
        You joke about it, but you would like <f>her</f> to understand that you do these things for <f>her</f> too, so that stories like hers or <f>Marika</f>'s don't happen again.
        But <f>she</f> would only want you to study and volunteer at church. Later on, a good <m>engineer husband</m>, two children and an apartment below hers.
        You imagine <f>her</f> alone, at home, worried, and your heart breaks.
        "I meant about us." #completion_50
        <f>Chloe</f>'s voice grew low.
            + "Uh."
            -
        You get off the desk.
        "What answer is 'uh'?"
            + "I haven't told her anything yet."
            -
        "But that won't be a problem for <f>her</f>, will it? <f>She</f> even saw the pictures from last Pride!"
            + "I'm just not sure."
            -
        "Of us?"
            + "Of me."
            -
        <f>Chloe</f> looks at you, half-still in the act of undressing.
        The light highlights an old scar on <f>her</f> arm and <f>her</f> hurt look.
        You know there's something, something you need to understand, but the words go away when you try to grab that thing and talk about it.
            + "I love you[."], and that's all I know."
            -
        <f>Chloe</f> lays back in silence.
            + "But that's not enough for you."
            -
        You lie down next to <f>her</f>.
        You look at the filthy ceiling: shoe marks, cobwebs, chewing gum, traces of grease. An exposed beam from which dust falls.#completion_70
        "I just don't get it."
        <f>Chloe</f>'s voice cuts through the silence of the room.
        "There always comes a time when you put up a barrier and keep me out."
            + ["I don't want to bullshit you."]"I'm just keeping you out of what I don't understand about me, so I don't bullshit you. I need time, <f>Chloe</f>."
            -
        "And this is a shield against me?"
        <f>She</f> lift a little your <m>binder</m>.
        After a full day it's a torture, your back is in pieces but you don't want to take it off.
        <f>Her</f> fingers get underneath, you feel yourself dying.
            + [You try to resist] Your body stiffens.
        "Are you holding your breath?" <f>Chloe</f> looks at you puzzled.
            + [You lift your hand]
            -      
        <f>She</f> gets up, goes to the window.
        You hate it when <f>she</f> tries to make you feel guilty, hate that <f>she</f> always succeeds.
        "This again. You're not a <m>man</m>, <f>Elisa</f>. I would know. They give me, like, hives if I touch them. Your strength is that of a <f>woman</f>, your moans..."
            + "It's not for you to decide what I am."
            -
        It comes out harder than you'd like.
        You blame it on fatigue, but you also know that you can't take it anymore. That it all hurts you.
        <f>She</f> keeps telling you <f>she</f> loves you, but then <f>she</f> always seems to want something you're not.
        "You're right. But this is hard for me, too."
        <f>Chloe</f>'s body returns next to yours, <f>she</f> hugs you, but you feel like <f>she</f>'s light years away.
            + [You hold her]
            -
        There comes this idea, this thought that becomes a certainty.
        If it ends with <f>her</f>, no one will ever love you again.
        There's a choice you have to make, or things you need to learn to reconsider.
        To ignore.
        Maybe they're not that important, right?
        When <f>she</f> starts snoring you're still there, eyes wide open and brain locked on one question, one question only. #almost_there
            + "Am I a girl?" 
            -
    -> bullet_hell_due_afab
    
    === bullet_hell_due_afab ===
   $bullet_hell_afab_due$
    -> atto_afab_tre
    
    === atto_afab_tre ===
    Adulthood. Autumn. At disco.  #title
    
        You watch your <f>mom</f> and <f>Chloe</f> talk at the club counter. 
        You still can't get over how things have changed.
        <f>Mom</f> gestures for you to join <f>her</f>.
        "<f>Chloe</f> was telling me that you guys are thinking about going to Spain to, you know..."
        You look at your wife: this <f>motherhood</f> thing <f>she</f> mentioned just two nights ago.
            + [You remain silent]
            
            + "It's just an idea for now."
            + "It's a long process[."] but yeah, we're thinking about it."
            -
        "I can't wait to be a grandmother."
        Your <f>mother</f> is beaming.
        <f>She</f> looks around.
        "Maybe it's time for me to go now, but I've been happy to help you guys out."
        <f>She</f> gives you a hug and walks out of the club.
        "Why didn't you wear the costume I got you?"
        <f>Chloe</f> looks annoyed at your loose sweatshirt.
            +"I didn't make it in time[."]. The preparations and all..."
            -
        But <f>she</f> doesn't listen to you because two <f>women</f> approach, dressed as <f>Ellen Degeneres</f> and <f>Portia de Rossi</f>.
        They start talking to <f>Chloe</f> about money, politics, the Alderman's <f>daughter</f>, redeveloping the neighborhood.
            +"What's wrong with the neighborhood?"[] you ask without thinking.
            -
        <f>Chloe</f> elbows you and whispers, "Be nice, they're the ones funding us."
            +[You smile weary]
            -
        "You <f>girls</f> did a really great job, congratulations," says the fake <f>Portia</f>.
        "Maybe the title is a little prosaic," comments the fake <f>Ellen</f>.
        <f>Chloe</f> laughingly defends the name of the party, because obviously "Halloween Without <m>Men</m>" was <f>her</f> choice, like ninety percent of the night's stuff.
        "Are you okay?", <f>Emma</f> interrupts your thoughts.
            + [You nod your head]
            
            + "I hate these people."
            + You plug your ears[], pretending to scream in despair.
            -
        <f>Emma</f> slips <f>her</f> arm under yours.
        <f>She</f>'s dressed like <f>she</f> just got out of the shower, with a giant scarf/towel over <f>her</f> hair.
        "Can I talk to you?"
            + You cast a glance at Chloe[], who is caught up in revering the couple.
            -       
        The impromptu disco is already full, hundreds of <f>women</f> jiggling and dancing and chatting. #completion_33
        Several have "Three Fucking <f>Dykes</f>" pins.
        <f>Chloe</f> will be happy with all these new members.
        You notice that <f>Emma</f> isn't wearing hers.
        <f>She</f> drags you out to the back of the club.
        <f>She</f> catches <f>her</f> breath, <f>she</f>'s shivering a little but you know <f>her</f> well enough to know it's not because of the cold.
            + "Are you okay Bunny?"
            -
        You pass an arm around <f>her</f> neck.
        "I'm leaving the association."
        It's a cold, unexpected blow.
        You three created it, it was born from the years of occupations and marches, of Pride, of unauthorized demonstrations against the fascist politician of the day.
        "It's not the project we believed in anymore, <f>Elisa</f>. This stuff is, it's something else, it's <f>Chloe</f>'s wet dream. These are the people we fought against, what are those two bitches doing here?"
            + "If we want to survive..."
            -
        "Those are <f>Chloe</f>'s words, for fuck's sake. You know you’re my bestie, right?"
            + [Stay silent]
            
            + [You nod your head]
            
            + "You’re mine, Bunny."
            -
        <f>She</f> takes your hands.
        "You're not yourself anymore, <f>Elisa</f>. You're basically just obeying <f>Chloe</f>, never questioning <f>her</f>. Where's the <f>Elisa</f> who used to say "fuck you!" to everyone? The one who was trying to save the world? The one whose couch housed tons of <f>girls</f> kicked out of the house?"
        There's a cold knock somewhere in your belly.
        Where you've put a defense system that has been firing at everything lately, indiscriminately, as long as you don't look inside.
            + You head back inside the club[], but <f>Emma</f> stops you.
            + You let go of Emma's hand[], reaching into your tight pockets for a cigarette.
            + "Some people have decided to grow up, and some haven't."
            You say in a mean way, but <f>she</f> doesn't let go.            
            -
        "Honey, you haven't been well, for a long time. I don't know what's going on, but you're smiling less and less, and I'm worried. I want to help you, but I don't know how to do it if..."
        You are interrupted by shouting.
            + You take the opportunity to go inside[] and see what's going on.
            <f>Emma</f>'s words stick with you.
            -
        "They are not a <m>man</m>."
        The voice falls into total silence, even the music has disappeared. #completion_50
        "Rules are rules and," is <f>Chloe</f>'s voice, shaking.
        You know <f>she</f>'s pissed.
        The two <f>hyenas</f> are behind <f>her</f>, holding two martinis.
            + [You approach]
            -
        "<f>Laura</f>, never mind, let's go elsewhere."
        You suddenly recognize the two people who are arguing with <f>Chloe</f>.
        <f>Laura</f>, your old schoolmate, you lost each other after the first year of high school.
        And <m>Luca</m> who, who. You can't hear yourself think, understand "what".
        You know that in theory <m>he</m> is in a costume, dressed as a <f>blonde</f>, but you also realize that for Luca that is not just a costume.
        That cold knock, again, in your stomach.
            + [You go towards Chloe]
            -
        But <f>Emma</f> gets in the way.
        "This is what doesn't have to happen. We're not this thing here."
        You hear <f>Laura</f> say something in the tone of someone who is tired of repeating the same phrase over and over again.
        "They are NOT a <m>boy</m>, they are a non-binary person, and they just wants to be somewhere quiet. It’s the first time they have left the house dressing like this. They were hoping not to get mocked here at least, but apparently it’s impossible."
        <f>Laura</f> intercepts your gaze, recognizing you.
        <f>Chloe</f> realizes the <f>woman</f> is looking away.
        <f>She</f> sees you, and with <f>her</f> eyes <f>she</f> begs you to give <f>her</f> support.        
            + [You Smile at Laura] -> Pacificazione
            + [You lean on Chloe] -> Durezza
            + [You go drinking] -> al_bancone_emma

        
            = Pacificazione
                Greetings, pleasantries, you explain that it's a particular evening, that there is no desire to discriminate against anyone, it's just that you have been asked about, about what, you don't even know at the end.
                The more you talk the more there are murmurs, people leaving the club.
                Luca smiles at <f>Laura</f>.
                "Let's leave honey, it doesn't matter."
                <f>Laura</f> looks disappointed as they leave.
                "Do you know those guys?" <f>Chloe</f> asks.
                Apparently <f>she</f> didn't recognize them.
                Out of the corner of your eye you see <f>Emma</f> walking out.                    
                    + [Chase her]
                    -> pre_terzo_bullet_hell_afab
        
            
            = Durezza
               <f>Chloe</f> keeps talking, <f>her</f> anger less and less hidden now that you're at <f>her</f> side.
                <m>Luca</m> is standing in front of you.
                You realize <m>he</m>'s uncomfortable with the situation, but he's glowing nonetheless.
                The way his? Maybe <f>her</f> fingers move, how <f>her</f> eyes explore the space.
                The smile that comes over <f>her</f> mouth as she sees herself in the reflection of the door.
                How she, not, not she, 'cause Laura used "they".
                How they shakes out their long hair, letting their hand then remain on their bare chest.
                You look at your own <f>chest</f>, which you always try to forget, to ignore.
                You haven't worn a <m>binder</m> in years, since <f>Chloe</f> told you, "It's either that, or me."
                    + "Get out."
                    -
                Your voice is full of anger.
                    + "This is no place for you[.] You can't go where you want, how you want. It's a private party with its own rules, there's nothing to complain about."
                    -
                You see the <f>hyenas</f> smiling in satisfaction, <f>Chloe</f> takes your hand.
                <f>Laura</f> turns <f>her</f> back on you and walks away.
                You avoid to cross Luca's eyes.
                Several people leave with them, some are activists of the group.
                <f>Chloe</f> kisses you and thanks you.
                <f>Emma</f> approaches you, looks at you, and silently leaves.
                    + [You chase her]             
                ->  pre_terzo_bullet_hell_afab
            
            
            = pre_terzo_bullet_hell_afab
                But you quickly lose <f>her</f> in the crush. #completion_70
                The street is full of people and voices and smells, but not <f>Emma</f>.
                Why are you chasing <f>her</f>?
                <f>Chloe</f> screams your name.
                    + You quicken your pace[], leaving <f>her</f> behind.
                    -
                You think back to <f>Emma</f>'s words.
                You betrayed the person you were? And why?
                When running your <f>breasts</f> jump, reminding you that they exist, filling you with discomfort.
                Your body feels immense, exposed.
                The gazes of other people ready to judge it, dissect it.
                To decide through its shapes, what you are.
                All eyes are <f>Chloe</f>'s.
                    + [You lean against a wall]
                    -
                You're out of breath and that sense of discomfort, of cold is there cracking, filling you with words and judgments, promises and veiled threats.
                Of <f>Chloe</f> wanting you to be <m>her</m> <f>girlfriend</f>, <f>her</f> <f>woman</f>, the <f>mother</f> of <f>her</f> child.
                There are questions you don't want to hear because you're thinking about your <f>mom</f>, your <f>mom</f> who took thirty years to accept that you're a <f>lesbian</f>, and now you really want to change everything, again?
                Do you want to risk losing <f>her</f> again?
                You start crying, drained.
                Who do you have to be, for you to be happy? #almost_there
            -> bullet_hell_tre_afab
            
            = al_bancone_emma
                You down two glasses in a row. #completion_70
                <f>Emma</f> approaches you.
                "Weren't those our classmates in the lobby?"
                    + [You close your eyes, focusing on the music]
                    -
                "It's not like if you don't look at things they disappear!"
                    + [You order another shot]
                    -
                "<f>Elisa</f>!" 
                <f>Emma</f> grabs your hands. "What's happening?"
                You feel yourself breaking, you feel something about to give way.
                You look into <f>her</f> eyes, try to speak.
                    + [But you still order a shot]
                    -
                The alcohol comes in all at once, you feel dizzy and nauseated.
                The noise at the entrance is driving people away, the music has stopped, but you only notice <f>Emma</f> looking at you worriedly.
                You wonder if <f>she</f> can really see you, see what you are.
                Because you've been denying yourself for so long, and you now have no answers.
                    + "I don't know who I am, Emma."
                    -
                You feel yourself falling. The alcohol alters everything.
                The fall is endless, slowed by the comments of a lifetime.
                "You need to dress like a <f>girl</f>!"
                "This is not a <f>girl</f> thing."
                "Why do you play <m>soccer</m>?"
                "I'm a <f>lesbian</f>, so you're a <f>girl</f>."
                "It's normal that you hate your <f>breasts</f> in such a sexualized society."
                "There are <m>only two genders</m>."
                "This is <m>unnatural</m>!"
                You puke, and with vomiting you break that chunk of frost you had in your <m>chest</m>.
                The words come rushing in, hurting you, and you no longer have the strength to fight back. #almost_there              
                -> bullet_hell_tre_afab
         

    === bullet_hell_tre_afab ===
        $bullet_hell_afab_tre$
    -> finale_afab
    
    === finale_afab ===
            "<f>Elisa</f>! Please look at me!"
                + [You struggle to open your eyes]
                -
            They weigh a ton.
            You're on your knees, and in front of you is <f>Emma</f>.
            "Shit, how worried you made me!"
            You look for something to say, and realize there's plenty of room now in your head.
            Space for new words.
            The chill in your belly is gone.
                + "Emma."
                -
            Your friend looks at you worriedly.
                + "I'm scared."
                -
            You start to cry, can't remember how long it's been since you've done this.
            You beam at <f>Emma</f>'s shoulder, holding you, reassuring you. Telling you that everything is going to be okay.
            Slowly you catch your breath, you let go of <f>her</f>.
            You never realized how much <f>her</f> friendship was your safe place.
                + "Emma, I don't think I'm a girl."
                -
            <f>She</f> remains silent, touching your hair.
                + "Nor a [boy."]<>
                <f>boy</f> and when I saw Luca earlier, when I saw how happy they was in that other way, I thought, "That's where I belong. And it scared me."
                -
            "What's the worst thing that could happen to you if it did?"
                +"I would lose Chloe."
                -
            "What if you keep not looking for an answer to that question?"
            You remain silent.
            You realize that the alternative is losing yourself.
                +"I think I'm going to need your support, Emma."
            -
            "I'm not going anywhere honey, but don't call me Emma again."
            You point to her< costume foulard..
                +"May I, Bunny?"
                -
            <f>She</f> hands it to you, you ask <f>her</f> to close <f>her</f> eyes.
            It's immense, you use it to bind your tight breasts, to make them disappear.
                +"Want to go get drunk somewhere?"
                -
            <f>Emma</f> smiles at you, handing you <f>her</f> leather jacket.
            "If you want, I still have two cans of spray streamers, and I know where the two rich bitches' SUV is parked."
            You grab <f>her</f> hand.
            <f>She</f> picks up <f>her</f> phone, ready for a selfie together. #almost_there
                + [The screen shows your body]
           -
        -> bullet_hell_buono

//FINALI INTERMEDI

    === sconfitta_amab_uno ===
        Screams bring you back to your senses.
        You see <f>Elisa</f> holding rocks, blood on <m>Lorenzo</m>'s forehead, <m>he</m>’s screaming things.
        "Go cry to mommy, come on!"
        A bus honks annoyed, forcing the <m>boys</m> to get out of the way.
        Only you and <f>Elisa</f> remain.
            + You try to say something[], but you barely mumble.
            -
        <f>Elisa</f> seeks your gaze, "You have to..."
            + "Beat them up?"[]
        You think back to what <m>Omar</m> said just now.
            -
        "Ignore them."
        <f>She</f> is serious, hands on <f>her</f> hips like a <f>superheroine</f> in a comic book.
        "First, because they're idiots. Second, because they're idiots, and third, because they're idiots and why do you even care about them?"
            + "You make it easy, they like you."
            -
        "Not always, only when it comes to play."
        <f>She</f> holds out <f>her</f> hand to you, an invitation to stand up.
        "You always listen to what the teacher or <f>Marika</f> or the other <m>boys</m> say, but it's not like they know everything and you don't."
            +"Omar says I have to be like them."
            -
        "It's not like <m>Omar</m> knows everything too. Look at you."
        <m>He</m> turns you around.
        You have an abandoned storefront in front of you.
        "You are you, period. I am me. Period. They do what they want, we do what we want."
        You look into the store window, and you begin to see something, something that wasn't there before, something that had been covered up by the words of your <m>brother</m> and the <m>boys</m> and the teachers and your <f>mother</f>. #almost_there   
        You smile at <f>Elisa</f>, and <f>she</f> grabs your hand.
            + "Elisa, you want to see something reaaally good?"   
            -
        -> bullet_hell_buono


    === sconfitta_amab_due ===
        When you open your eyes again, <f>Grandma</f>'s things surround you.
        You're in <f>her</f> bed, voices are coming from the living room.
        There is a glass of water on the nightstand, but when you try to grab it, it falls.
        Footsteps come quickly into the room.
        <f>Laura</f> hugs you, <m>Omar</m> looks at you worriedly.
        "What the fuck did you do <m>brother</m>?"
        You look at them puzzled.
        "You passed out at one point. We got worried."
        <f>Laura</f> squeezes your hand.
        "You really are a <f>pussy</f>, <f>LuLu</f>!"
            + "Stop."
            -
        Tough, the word gets in <m>Omar</m>'s face, and you're okay with that.
        “I was just kidding!"
        Your mind is clear, the world’s clear.
        You get out of bed.
            + "Stop. It!"
            -
        You stare into <m>Omar</m>'s eyes.
        "<f>LuLu</f>, did you hit your head?"
            + "I've had enough, Omar.["] Of your <f>LuLu</f>, <f>faggot</f>, <m>gay</m>, <m>fag</m>, <f>sissy</f>, <f>lesbian</f>, and so on. They hurt. They hurt."
            -
        "Because you're..."
            + "Because I'm not you[."], and that's okay. That's enough. I don't have to look like you, I don't even want to, why should I?"
            -
        Your <m>brother</m> clenches <m>his</m> lips and fists.
        "It's time for me to go."           
            + "Omar?"
            -
        Your <m>brother</m> stops.
            + "If you love me, let me be who I am."
            -
        "If I did then I wouldn't love you, because the world would devour you."
        You look at <f>Laura</f>, smile at <f>her</f>.
            + "Maybe your world[]. But there are others where there is room for me too."
            -
        <m>Omar</m> leaves.
        <f>Laura</f> hugs you.
        <f>She</f> cries.
        "I love you."
        You kiss <f>her</f> looking into <f>her</f> eyes.
        There is your reflection in <f>her</f> tears and, finally, you see your true self, and you love them. #almost_there
            + [Smile]
            -
        -> bullet_hell_buono
        
        
        
    === sconfitta_afab_uno ===
        You're home with <f>mom</f>, <f>she</f> didn't talk the whole trip.
        Now you have two hot chocolates in front of you, but you're both standing still.
        You have no idea what <f>she</f>'s thinking.
        Then <f>she</f> catches <f>her</f> breath.
        "Are you ready for some grown-up talk?"
            + You immediately nod your head[], glad <f>she</f> addressed you.
            -
        "I don't know how to be a good <f>mom</f>, <f>Elisa</f>," <f>she</f> sighs. "Certainly not like <f>Grandma</f> Melina."
        <f>She</f> smiles at you.
        "I've messed up a lot, you know? Always on my own, and it drove <f>her</f> crazy."
        <f>Her</f> eyes glaze over.
        "But I'm glad I disobeyed <f>her</f>. Otherwise, I wouldn't be the person I am, and I like myself. And I wouldn't have you. You know I'm happy to have you, right?"
            + [You don't know if and how to move] These are talks new to you.
            -
        "I'll make you a deal: you'll tell me what you need, what you want to do. I will only say 'no' if I know it will be dangerous, and you will have to trust me. In return, you put up with the nuns until the end of primary school, and then that's it."
        You're looking at your hands, because you don't know what to say. It's the first time you've been treated like an adult.
        And then you realize you know one thing.
            + "Mom? I'd like to get a haircut."
            -
        "That sounds like an easy request, honey," <f>she</f> musses your long curls.
            +"I want it shaved like Lorenzo."
            -
        <f>Mom</f> makes to say something, then stops.
        "Would you like me to cut them for you?"
            + [You take her hand]
            -
        <f>She</f> gives you a hug.
        When <f>she</f> pulls away <f>her</f> eyes glaze over.
        <f>She</f> walks you to the bathroom, and as the locks fall out you feel like a veneer is disappearing. 
        And as it disappears, something emerges. #almost_there
            + "Mommy, mommy! I really see myself!"
            -
    -> bullet_hell_buono
    
    
    
    === sconfitta_afab_due ===
        Waking up is like coming out of a nightmare.
        Outside there is chaos: choirs, sirens, screams, laughter.
        At your side is not <f>Chloe</f> but <f>Emma</f>.
        <f>She</f>'s reading something, and <f>she</f> smiles at you when you wake up, a small, sad smile.
        "<f>Chloe</f> left last night, I'm sorry."
        It hurts you more than you want it to.
            + You get up and lean against your friend[],
            <> you need comfort.
            -
        <f>She</f> holds you tight, giving you all the time in the world.
        When you pull away, <f>she</f> tells you that the demo below is waiting for you.
            + "Bunny, what do you think I am?"
            -
        "What do you mean?"
            + "No, I don't, I don't feel like a [girl.]<f>girl</f>. Or even a <m>boy</m>. Or anything in between. More of an "other", different thing. But every time I think about it, I'm gasping, I feel like I'm dying. And because of this thing, <f>Chloe</f> will be gone."
            -
        "<f>Chloe</f>..." but then <f>Emma</f> changes <f>her</f> mind.
        <f>She</f> opens <f>her</f> makeup mirror, you look at each other together.
        "I always knew I liked <f>girls</f>, but at home this didn't exist, you know how religious my parents are. I only realized there were other <f>girls</f> like me when I met you and <f>Chloe</f>. My parents could keep saying that certain things didn't exist, but what I feel are facts. When I accepted this, I really saw myself."
        <f>She</f> turns the mirror towards you.
        "Only you can know who you are. Outside they can say you don't exist, but that's their problem. It's not that because <f>Chloe</f> is a lesbian <f>she</f> can't be prejudiced, but those are <f>her</f> problems. You know who you are, and you have the right to say it out loud whenever you want."
            + "How are you so wise?"
            -
        You smile as you look at yourself in the small mirror.
        You strive to ignore the signs of sleep and unmade hair and slowly your face emerges, your true self. #almost_there
            + [You smile at Bunny]
            -
    -> bullet_hell_buono