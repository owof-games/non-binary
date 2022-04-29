//VARIABILI

//Gender: se 1 = AFAB, se 2 = AMAB

VAR gender = 1

//Finali amab: se 1 = perdere, se 2 = sinceramente
VAR amab_tre = 1


//FUNZIONI
    -> random
    === random ===
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
        Mamma e l’auto ti cullano nel tragitto verso casa. #street
        “Pallino! Appena <m>nato</m> e hai già la faccia da <m>furbetto</m>!”
        <m>Papà</m> è su di giri.
        La risata di <f>mamma</f> ti scuote dal dormiveglia.
        Fuori dal finestrino i tuoi occhietti vedono un mondo sfocato, fatto di luci e contorni, sagome e bagliori. 
        È tutto nuovo, bellissimo. Senti di poter essere qualunque cosa.
            + [Fai un versetto]
            -
        Vuoi condividere la tua gioia, ma gli adulti ti ignorano.
        “Secondo te avrà voglia di imparare il mestiere?”
        <m>Papà</m> svolta a destra.
        <f>Mamma</f> ti guarda.
        “Il mio o il tuo?”
        “Il mio! Dio, non voglio un <m>figlio</m> <f>estetista</f>!”
        Scendete dall’auto.
            + [Rigurgiti]
            -
        Non è che tu possa fare molto di più.
        Passi dalle braccia di <f>mamma</f> a quelle di <f>nonna</f>, <f>zie</f> e <m>zii</m> che ti corrono attorno.
        La tua cameretta è già piena: un lettino con coperte <m>azzurre</m>, <m>azzurre</m> le tendine, <m>azzurre</m> le pareti.
        <m>Azzurro</m> l'armadio, il tappeto, il pigiamino che ti mettono.
        Rosa le tue guance mentre fanno commenti sul tuo pisellino.
        Su una mensola una serie di peluches: un’<m>auto</m>, un <m>pompiere</m>, un orsacchiotto, un <m>bulldog</m>, un <m>pallone</m> da <m>calcio</m>.
        Tuo <m>fratello</m> ti mette il <m>pallone</m> tra le mani, se la ride.
        “Queste sono mani da <m>portiere</m>, guarda che presa!”
        Ti guarda pieno di ammirazione.
            + Volevi solo aggrapparti a qualcosa[], questa gente dice troppe cose e ti gira la testa.
            -
        <f>Nonna</f> chiede a tuo <m>fratello</m> se ti vuole tenere in braccio, <m>lui</m> risponde che ha paura di romperti.
        “Guarda che con un <m>bimbo</m> in braccio fai strage di <f>ragazzine</f>!”
        “<f>Mamma</f>, ha solo dodici anni!”
        Camminano e parlano, tutti. Si dicono come sarà il tuo futuro, discutono, ridono, tracciano confini. 
        Le loro parole si posano sui tuoi occhi.
        Fuori, lungo la strada vedi sempre meno varietà, forme e colori si sfumano fino a quando non rimane che una distesa di <m>quadrati</m> <m>azzurri</m> e <f>triangoli</f> <f>rosa</f>. #people
        Tutto ti sembra uguale. 
            + [Piangi]
            -
        -> atto_amab_uno
    
    ===atto_amab_uno===
    Infanzia<br/>Estate<br/>Parco giochi #title
    
        “Perché sei un <m>maschio</m>!”
        Il tono di chi dice qualcosa di ovvio.
            + “E quindi?”
            -
        “E quindi non puoi fare Ariel perché è una <f>prin</f>-<f>ci</f>-<f>pes</f>-<f>sa</f>. A noi ci serve un <m>principe</m>, sei qui solo per questo!”
        <f>Marika</f> ha le braccia strette al petto e ti guarda come se tu fossi la cosa più stupida al mondo.
        Le altre <f>bimbe</f> sono annoiate.
        <f>Laura</f> continua a sbuffare, <f>Pallina</f> lancia sassi alle lucertole.
        Il sole è caldo e il parco è pieno di grida festose.
            + “Si fa sempre come vuoi te!”
            + “Può farlo [Pallina.”]<f>Pallina</f>."
            + [La guardi con aria di sfida]
            -
        “Sono la più grande quindi decido io e quindi tu sei il <m>principe</m>.”
        <f>Marika</f> si allontana con le treccine che ballonzolano.
        Iniziano a chiacchierare, a pianificare.
        Ogni tanto ti fanno qualche domanda ma a te non va proprio di rispondere ora.
        Guardi il tuo zaino con i nuovi numeri di Ranma 1/2, e pensi che eri così felice di startene a leggere al sole.
            + [Ti siedi e le ignori]
            + Ti sforzi di seguire il discorso[], <>
            	ma hai perso qualcosa di importante, è comparso un drago, cosa c'entra un drago?
            + “Non avete fame?”[]. <>
            	<f>Laura</f> ti passa la sua merendina sorridendoti. È sempre così gentile con te.	
            -
        In fondo al parco tuo <m>fratello</m> <m>Omar</m> sta giocando con altri <m>ragazzi</m>.
        Anche se è molto più grande, cerca sempre di giocare con te. È un bravo <m>fratellone</m>.
        "<m>Pal</m>-<m>lin</m>-<m>oooooooooooooo</m>!"
        <f>Marika</f> stridula ti chiama.
        “È ora di iniziare!”
            + [Ti avvicini controvoglia]
            -
        “Quindi <f>Laura</f> è la mia <f>sorella</f> piccola <f>Pallina</f> è la nostra <f>mamma</f> ma si è ammalata e ci serve la pozione ma ce l’ha il drago sotto la pancia e serve un <m>eroe</m> e stiamo chiamando...”
        “E chi fa il drago?” <f>Pallina</f> interrompe <f>Marika</f>.
        Le treccine tremano dal fastidio.
        “Quella siepe è il drago.”
        "Col cavolo! Il cespuglio è la <f>mamma</f> che tanto se è malata mica si muove, e io faccio il drago!"
        Le due iniziano a litigare, decidi che è il caso di fare qualcosa.
            + “Caricaaaa!”
            -
        Corri contro il drago che forse è la <f>mamma</f>, quando lo noti.
        Unico, rosso fuoco fuori e giallo dentro.
        Bellissimo, gigantesco.
        Marika ti urla qualcosa. #completion_33
            + [La ignori]
            + [Le dici di venire]
            	<f>Le</f> dici di venire ma <f>lei</f> urla di correre contro il drago e non vuole che <f>mamma</f> muore e rimane <f>orfana</f>.
            + Annusi il fiore[], <>
            	ed è tipo la cosa più buona dell’universo, più buona anche delle torte di <f>nonna</f>.
            -
        “Qualcuno ha strappato tutti gli altri."
        <f>Pallina</f> è al tuo fianco.
        Ha ragione, ci sono boccioli ovunque tra l'erba.
            + “Non è giusto[."], è così strano e bello.”
            -
        <f>Lei</f> lo annusa.
        Vi girate: <f>Marika</f> se ne sta andando, <f>Laura</f> la insegue.
        “La prossima volta lo faccio io il <m>principe</m>!”
        Pallina è risoluta.
            + “La prossima volta mi nascondo."
            + [“E Marika è il drago!”]"E <f>Marika</f> è il drago!"
            + “Promesso?”[] <>
            	E <f>lei</f> ti risponde sì, e se <f>Marika</f> rompe le scatole la butta nel fango.
            -
        E poi arriva una pallonata.
        Netta si infila tra voi due.
        Colpisce il fiore.
        La palla cade a terra e porta tutti i petali con sé.
        <f>Pallina</f> si gira, urla un “Cretino!” e corre contro a qualcuno, lasciandoti lì.
        Ti chini per raccogliere i petali.
        “<f>Guardatela</f>, la <f>femminuccia</f>.”
        Risate.
        Ti alzi, alle tue spalle qualche <m>bambino</m>.
        Sono di poco più grandi, ogni tanto ti prendono di mira durante le pause a scuola, fanno i prepotenti con tutti. #completion_50
            + [Stringi i pugni]
            + Ti allontani[], <>
            	qualcuno urla: “Ehi <m>frocetto</m>, sto parlando con te!”
            + Rispondi per le rime[] con la voce più sicura che trovi, <>
            	ma balbetti un “Siete scappati dallo zoo?”
            -
        Ti arriva in testa una zolla di terra, ti pulisci gli occhi col dorso e non vedi chi ti butta sull'erba, schiacciandoti col suo peso.
        Provi a scalciare, colpisci qualcosa, un gridolino ti dà soddisfazione.
            + Cerchi di alzarti[], ma ti schiacciano di nuovo a terra.
            + Provi con un altro calcio[], che però va a vuoto. 
            + "Smettetela!"
            -
        Allunghi le mani, lanci quello che trovi, provi a graffiare, morsicare. 
        Tutte cose <f>da donna</f> secondo tuo <m>fratello</m>. Gli <m>uomini</m> devono sapere <m>fare a pugni</m>.
        “<f>Frocetto</f>!” ti manca l’aria.
        <m>Lorenzo</m>, ora lo riconosci, abbozza un pugno per finta sul tuo naso, provi a mollargliene uno vero.
        E <m>Lorenzo</m> inizia a volare.
        La sorpresa ti toglie anche la voglia di rialzarti.
        Passi veloci, qualche grido e poi una mano che si tende, quella di tuo fratello.
            + [La afferri]
            -
        Ti solleva, ti passa dell’acqua, ti pulisce la faccia.
        “Niente di grave”, ti dice sorridendoti.
        Vi siedete sui gradini, recuperi dallo zaino due merendine mezze spappolate.
            + [Gliene passi una]
            -
        “Che hai combinato questa volta, <m>Pal</m>?”
        <m>Gli</m> racconti la storia del fiore.
        <m>Omar</m> ride, ti passa la manona tra i capelli.
        “Per un fiore, caz, capperi! Ti sei fatto menare per un fiore!” 
            + “Era l’ultimo!”
            ”Lo sai qual è la cosa bella dei fiori, <m>Pal</m>? È che ricrescono, a differenza della tua testolina che se te la rompi non ricresce più!”
            + “Non volevo mica farmi picchiare!”
            <m>Omar</m> sospira. Vedi che sta cercando le parole per dire qualcosa.
            -
            + [Resti in silenzio]
            -
        “<m>Pal</m>, non posso passare la vita a difenderti, lo sai vero?” #completion_70
        “Ma mica lo voglio!”
        “Però...” <m>Omar</m> guarda davanti a sé, tortura con le mani la cartaccia della merendina.
        “Perché ce l’hanno con te, <m>Pal</m>?”
        Che risposta si aspetta da te?
            + “Perché sono stupidi!”
            + “Perché non gioco con loro?”
            + [Resti in silenzio]
            -
        “Sei sempre da <m>solo</m> o con le </f>bambine</f> o con la </f>nonna</f>. Coi <m>bambini</m> non ci stai mai, e questo è <m>strano</m>.”
        Lancia la cartaccia nel cestino.
            + “Gioco con te.”
            -
        “Che sono tuo <m>fratello</m>, è diverso. E sono grande, un giorno non ci sarò quando servirà e questi mi preoccupa.”
            + “Non voglio che ti preoccupi per me.”
            -
        <m>Omar</m> ti guarda negli occhi, serio.
        “Devi imparare come si sta al mondo, <m>fratellino</m>. Gioca coi tuoi <m>compagni</m>, <m>menali</m> quando ti offendono, e lascia stare le <f>bambine</f>. Tanto vedrai che tra un paio d’anni non vorranno più giocare con te.”
        Ti sorride.
            + “Perché?”
            -
        “Perché vorranno fare <f>cose da femmine</f>, e i <m>ragazzi</m> <m>cose da maschi</m>. Così va la vita.”
        Forse la vita è stupida.
            + “Tu sarai per sempre mio amico?”
            -
        “Sempre, <m>Pal</m>.”
        Ti strofina una nocca sulla testa.
        “Ma ora devo andare dalla <f>morosa</f>. Un’altra cosa che un giorno capirai.”
        <m>Lo</m> osservi allontanarsi.
        Prendi lo zaino e ti avvii verso casa.
        La luce è bassa, le rondini corrono nel cielo.
            + [Canticchi qualcosa]
            -
        Ti rendi conto che i pantaloni sono rotti, <f>mamma</f> si incazzerà a manetta.
        Ma poi, grida dall’altra parte della strada.
        Sono tutti lì in fila, i <m>ragazzi</m> di prima.
        Noti che <m>Lorenzo</m> ha un occhio gonfio, speri sia merito tuo.
        Ti stanno urlando contro.
        Che sei una <f>femminuccia</f>, che non sei un <m>ragazzino</m>.
        Che ti è caduto il <m>pisellino</m>, te l’ha mangiato il cane vero?
        Che coi capelli lunghi <f>sembri una ragazza</f>.
        Vorresti che <m>Omar</m> fosse con te, ma sei <m>solo</m>.
        <m>Solo</m>.
        Che cosa sei, <m>Pallino</m>?
        Cosa sei?
        Che razza di <m>bambino</m> sei? #almost_there
        -> bullet_hell_amab_uno
    
    === bullet_hell_amab_uno ===
        $bullet_hell_amab_uno$
    -> atto_amab_due
    
    === atto_amab_due ===
    Adolescenza<br/>Autunno<br/>Da nonna #title
  
        Casa di <f>nonna</f> è come un cumulo di foglie, strati su strati di oggetti.
        Il salotto è invaso da quarant’anni di riviste di <f>moda</f>, <f>cucito</f>, <f>maglia</f>.
        La quintessenza di nonna.
            + [Prendi una copia di Burda]
            -
        “Siamo qui per gettarla via ‘sta roba.”
        <m>Omar</m> entra con in mano una marea di scatoloni.
        <f>Laura</f> arriva da dietro e ti abbraccia.
        “Tutto ok tesoro?”
            + Fai sì con la testa[] e appoggi la rivista.
            + Lanci la rivista contro [Omar]<f>Omar</f>, che si scansa e ti dà della schiappa.
            + “Mi ha insegnato a cucire[.“] <>
            di nascosto da mamma, da quando avevo dieci anni. Passavo qui le ore a leggere e a disegnare le decorazioni che poi lei faceva a maglia. Quando faceva freddo stavamo davanti alla TV a guardare documentari sui dinosauri e macinavamo chilometri di lana.”
                ++ [Era bello]
            -
        “Non è mica morta”. <m>Omar</m> prende le altre riviste e le inscatola.
        “L’avete chiusa in una casa di riposo, è la stessa cosa.”
        “<m>Pal</m>, è per il suo bene.”
        Certo.
            + "Lei non ci voleva andare."
            -
        “Perché non avete accettato la nostra proposta?” <f>Laura</f> ha le mani sui fianchi e fissa <m>Omar</m>.
        Non vanno molto d’accordo. Quando vi siete messi assieme <m>Omar</m> era contento (“Quindi non sei <f>frocio</f>!”), ma <f>Laura</f> è convinta che abbia una pessima influenza su di te.
        “<f>Due ragazzine</f> di quindici anni a stare dietro a una <f>vecchia</f> rincoglionita?”
        Laura fa per dire qualcosa ma la interrompi.
            + “È tua nonna, cazzo!”
            + “Almeno sarebbe stata felice.”
            + “Così mamma può vendere la casa[."] e farci i soldi.”
                “I soldi servono per pagare la casa di riposo, idiota.”
            -
        Continuate a inscatolare in silenzio, l’unico rumore è lo spostarsi degli oggetti.
        <m>Omar</m> impila le cose con rabbia, chiude gli scatoloni, scende le scale pestando i piedi, risale, ricomincia.
        Laura ti passa le cose, quando i vostri sguardi si incrociano ti sorride, ogni tanto ti dà un bacio sulla guancia. #completion_33
            + [Nonna adora Laura]<f>Nonna</f> adora <f>Laura</f>.
            -
        È sempre stata dell’idea che se una regola è sbagliata è tuo dovere infrangerla.
        Dopo la morte di <m>nonno</m> non ha mai indossato il lutto, era contenta che quel violento fosse morto e non voleva fingere il contrario.
        Quando ha iniziato ad andare a <m>caccia</m> qualche <m>uomo</m> l’ha presa in giro, qualcuno ha provato ad avvicinarsi troppo.
        “Fanno tanto i grossi, ma se gli spari vicino ai piedi vedi come scappano.”
        E <f>Laura</f> è un po’ come lei. #completion_50
        “A che pensi?”
            + “Ci vuole coraggio[..."] a rompere le regole.”
            <> Vorrei essere come <f>lei</f>.”
            + “Vi somigliate tanto, voi due.[”]
            <> Le sue reti erano di lana e le tue di bit, ma avete tanto in comune.” <f>Laura</f> ride: "Woah, non sapevo fossi un <m>poeta</m>!"
            + [“Mamma non l’ha mai capita“] "<f>Mamma</f> non l'ha mai capita, per <f>lei</f> l’importante è quello che pensano gli altri e basta.”
            -
        
        “Sai che ti vuole un sacco bene, vero? Si illumina ogni volta che ti guarda.”
        <f>Laura</f> ti sorride, passandoti un <f>vestito</f>.
        Ci metti un attimo a riconoscerlo.
            + [Osservi meglio la fantasia]
            -
        Fiori di ibisco.
        Un <f>vestito lungo</f> che <f>nonna</f> ti aveva fatto due anni fa.
        Hai litigato con <f>lei</f> per quel <f>vestito</f>.
        Hai urlato per nascondere la paura, paura di quanto <f>lei</f> avesse visto in te. 
        Paura del <f>piacere</f> che hai provato all’idea di indossarlo, di restare con <f>lei</f>  lì con quel <f>lungo vestito</f> estivo a cucire e parlare, con la sicurezza che nessuna pallonata ti avrebbe distrutto.
        Laura ti guarda con tenerezza.
            + [Condividi quel ricordo]
            -> ricordo
            + [Infili il vestito nello scatolone]
            -> scatolone
            + [Parli del meteo]
            <f>Laura</f> ti bacia sulla guancia. "Dio, siamo già come quelle vecchie coppie che non hanno più nulla da dirsi?"
            -> scatolone
        
        = ricordo
            Man mano che parli senti sparire un peso a cui avevi fatto l'abitudine fino a dimenticartene.
            Fuori l’autunno sembra caldo, ma il volto di <f>Laura</f> si fa freddo.
            La sua mano stretta nella tua sembra un pugno. 
                + “Son cose dell’infanzia...”[] <>
                -
            provi a dire, anche se due anni fa ne avevi tredici di anni.
            “Non, non ti giudico <m>Pal</m>, davvero. vorrei solo capire...”
            “Anche io.” #completion_70
            <m>Omar</m> è sulla soglia.
            “Sei <f>gay</f>, <m>Pallino</m>? Anche se stai con <f>Laura</f> non vuol dire che tu sia <m>normale</m>.”
            “No!”
            <f>Laura</f> prende le tue difese, pur tentennando.
            “<m>Omar</m>, perché devi essere grezzo come la merda?”
            “Dico solo quello che penso.”
            Tuo <m>fratello</m> ti si avvicina.
            “Sai perché <f>mamma</f> non ti vuole con <f>nonna</f>? Perché ha passato il tempo ad assecondare le tue <m>stranezze</m>.”
            Ha i pugni stretti.
                + “Non sono stranezze!”
                -
            “Di certo non sono cose <m>normali</m>. Io, <m>Pal</m>, Cristo, ti voglio bene, davvero.”
            <m>Omar</m> sta guardando il pavimento. Non ti ha mai detto una cosa del genere.
            “Voglio, vogliamo solo vederti felice. Invece tu vuoi solo essere <f>strano</f>."
            Sospira.
            "Cristo, <f>mamma</f> è convinta che <f>Laura</f> sia una fase prima che tu ci dica di essere <m>gay</m>. Con te il mondo va al contrario.”
            Ti girano così tanti pensieri in testa che non sai cosa provi, non sai cosa fare.
                + [Pensi a nonna, alla sua forza]
                    “Amo <f>Laura</f>, e non serve che siate tu o <f>mamma</f> a dirmi cosa fare o non fare!”
                    -> litigio
                + [Guardi tuo fratello, il tuo eroe]
                    Ti ha detto “Ti voglio bene.”
                    -> accomodante
                + [La stanchezza ti macina le ossa]
                    Li lasci lì e te ne vai.
                    -> litigio
            
            = litigio
                Tuo <m>fratello</m> alza la voce, ti urla contro.
                <f>Laura</f> inizia a litigare con <m>lui</m>.
                Fanno una lista delle cose che fanno di te un </m>uomo</m> e delle cose che fai da <f>donna</f>.
                Ogni parola arriva come uno schiaffo, come un proiettile.
                Vorresti dire che sta a te decidere, che tua deve essere la voce e non la loro!
                Ma che cosa diresti ora?
                Perché non sai rispondere alla voce che nella tua testa ti chiede:
                “Cosa sei, <m>Pallino</m>? 
                </m>Un ragazzo</m>? 
                <f>Una ragazza</f> 
                Cosa sei?” #almost_there
                -> Bullet_hell_amab_due
            
            = accomodante
                Prendi il <f>vestito</f> dalle mani di <f>Laura</f>, e lo metti nello scatolone.
                <m>Omar</m> propone di fare una pausa per una birra.
                <f>Laura</f> ti guarda negli occhi, fa per dire qualcosa, ma poi si allontana.
                Il <f>vestito</f> ti osserva dallo scatolone, silenzioso ti accusa:
                “Cosa sei, <m>Pallino</m>? <m>Un ragazzo</m>? Una <f>ragazza</f>? Cosa sei?” #almost_there
                -> Bullet_hell_amab_due
    
        
        = scatolone
            <m>Omar</m> si presenta sulla soglia con tre birre in mano, un gesto di pace.
            “Hai smesso di tenerci il muso?” gli chiede <f>Laura</f>, stappando la bottiglia.
            “Non vi tengo il muso, ma mi girano che <m>mio</m> <m>fratello</m> mi tratta come un mostro. Voglio bene anche io a <f>nonna</f>, davvero.”
            Vi volta le spalle, il tono della voce è più tremulo.
            “Non voglio svegliarmi ogni mattina con il timore che non risponda al telefono e sia morta in casa.”
                + [Appoggi una mano sulla spalla di Omar]
                + [Guardi Laura, che ti prende la mano]
                + [Osservi i tuoi piedi]
            “Non sei un mostro, non volevo ferirti.”
            -
            Glielo dici col cuore, speri che lo capisca davvero.
            <m>Omar</m> si rigira tra le dita il tappo della bottiglia. #completion_70
            “C’è stato un momento nella nostra vita in cui qualcuno ha deciso che dovevo essere quello <m>forte</m> e <m>pratico</m>, forse perché tu <m>fratellino</m>...” ti guarda.
            Quasi trema.
            “Sei sempre stato in un mondo tutto tuo. Ti lamenti di <f>mamma</f>, ma alla fine non fa altro che preoccuparsi per te.”
                + “Non mi serve la sua preoccupazione."
                + “E non vede te."
                +  [Resti in silenzio]
            -
            “So di essere un grezzone e di non essere bravo come voi con le parole. Ma tengo a <f>nonna</f>, e voglio che sia felice. E tengo a te, e voglio che tu sia felice. Ma non so come farlo.”
                + [Senti solo senso di colpa.] Gli occhi lucidi di <m>Omar</m> ti riempiono di senso di colpa.
                -> colpa
                + “Non pretendo tu sia [perfetto]<m>perfetto</m>, solo che tu mi permetta di essere me stesso."
                -> myself
                + [Omar ha bisogno di te]
                Metti da parte parole e spiegazioni e lo abbracci.
                -> colpa
        
            = myself
                “E che vuol dire <m>Pal</m>? Che cosa sei?”
                Ti guardi le mani, sperando che qualcuno ci abbia scritto le parole per dirlo, ma non trovi che lo sporco della casa e degli scatoloni.
                “<m>Omar</m>, lascialo in pace.”
                <f>Laura</f> cerca di difenderti, ma tuo fratello la ignora.
                “È quello che voglio ma devo anche capire che vuol dire, no, lasciarlo in pace?"
                <m>Omar</m> ti si avvicina.
                "Cosa sei <m>Pallino</m>? Perché io mica lo capisco. Stai con <f>Laura</f> e mi dico che sei un <m>uomo</m>, ti piacciono però le cose da <f>frocio</f> e quante volte <f>nonna</f> ti ha riempito di <f>maglie coi brillantini</f> che manco <f>mamma</f> avrebbe messo? Cosa sei <m>Pallino</m>, dimmelo ti prego, così posso aiutarti.”
                E tu vorresti davvero dare una risposta, trovare una soluzione ma non lo sai <m>Pallino</m> cosa sei?
                Cosa sei <m>Pallino</m>? #almost_there
                -> Bullet_hell_amab_due
        
            = colpa
                “Vai bene così, <m>fratellone</m>, davvero. Non potrei chiedere di meglio.”
                Sorridi mentre glielo dici e lui risponde al sorriso per poi darti un pugno chiamandoti <m>ricchione</m>, e riprende a inscatolare roba, a raccontare anedotti sull'ultima serata fatta coi <m>ragazzi</m>.
                <f>Laura</f> ti guarda e c’è qualcosa di amaro nel suo sguardo.
                “Non puoi fare felici tutti, amore. A forza di farlo finirai per sparire.”
                    + “E che dovrei fare?”
                    -
                “Dire la tua verità, quella che sia.”
                    + “Su cosa?”
                    -
                <f>Laura</f> alza le spalle, ma gli occhi sono lì tesi ad aspettarsi una risposta.
                L’unica cosa che fai è allontanarti.
                Vai in camera di <f>nonna</f>.
                La finestra è socchiusa, la sua vestaglia stesa sul tavolino accanto a sigarette e medicine.
                A una foto di te, <f>lei</f> e <m>Omar</m> tanti anni fa, quando tutto sembrava semplice, quando nessuno pretendeva da te risposte.
                Ma è impossibile tornare a quel momento, perché gli occhi di <f>Laura</f> te lo stanno chiedendo ancora.
                Cosa sei <m>Pallino</m>?
                Cosa <m>ragazzo</m> sei? #almost_there
                -> Bullet_hell_amab_due
        
        
        === Bullet_hell_amab_due ===
            $bullet_hell_amab_due$
        -> atto_amab_tre
        
    === atto_amab_tre===
    Età adulta<br/>Autunno<br/>Casa #title

        <f>Laura</f> ti ripete di sbrigarti
            + “Ma mancano almeno sei ore!”
            -
        “E non bastano! Porta qualcosa da sgranocchiare.”
        Ravani tra i mobili della vostra cucina, recuperi cioccolata e burro d’arachidi.
        Non hai voglia di andare a quella stupida festa stasera.
            + “Ma se rimanessimo a casa[?"] a guardare horror e mangiare schifezze?”
            + [Tu detesti Marika!]“Ti ho già detto che odio <f>Marika?</f>”
            + “Ma da quando ti piace Halloween?”
            -
        Sali le scale senza che <f>Laura</f> ti risponda. L’unica luce è quella dello studiolo.
        Continua a stupirti questa casa, questa vita. Le cose che avete fatto assieme.
        Fai per entrare ma <f>lei</f> si fionda sulla soglia, ti cinge il collo con le braccia.
        “Promettimi che per una volta, una sola volta mi dirai di sì senza fare domande.”
            + ["Ci sono dei labrador?"]“Solo se ci sono dei labrador in quella stanza”.
            “C’è qualcosa di meglio dei labrador!” risponde. “Impossibile, niente è meglio dei labrador!”
            + [Le ricordi il matrimonio]“L’ultima volta che ho accettato ci siamo sposati, e devo ancora capire se sia stata una buona idea.”
            <f>Laura</f> ti dà un pugnetto in testa ridendo.
            + [Senti odore di trappola] <f>Lei</f> riconosce la tua espressione.
            “Quando mai ho fatto qualcosa che ti ha messo nei guai?”. Fai una lista abbastanza dettagliata che contiene cioccolata, leoni marini, un costume da Elon Musk e una ghigliottina. Ah, sì, e quella volta al cimitero con la tavola Oujia. <f>Lei</f> ti osserva con le braccia incrociate, fintamente seria.
            -
        Ti porta nella stanza.
        Ci sono <f>trucchi</f>, un capello osceno, una <f>parrucca</f>.
        E un sacco di pezzi di tessuto.
            + “Dov'è il cadavere di [RuPaul?”]<f>RuPaul</f>?"
            -
        Ti guarda, gli occhi pieni di affetto.
        "Ogni tanto penso a quel <m>ragazzino</m> timido e insicuro che ho conosciuto vent'anni fa, e mi stupisce vedere chi sei diventato."
        Non sai cosa rispondere, anche se è vero: ad un certo punto, inaspettatamente, l'età adulta ti ha regalato una sicurezza che non avresti mai immaginato di poter avere.
        <f>Laura</f> cambia discorso. #completion_33
        “Ti ricordi che l’anno scorso Marika ha detto che siamo gli unici a non fare costumi di coppia?”
            + “Ed è un problema?”
            + “È difficile dimenticarlo[!"], visto che l’ha urlato <f>ubriaca</f> dal balcone.”
            + “Mi ricordi perché è [tua amica?”]<f>tua</f> <f>amica</f>?"
            Ti lancia addosso un marshmallow.
            -
        “Quest’anno voglio dimostrarle che si sbaglia. E mi sono chiesta: qual è la coppia più spaventosa da portare ad una festa di Halloween?”
        Cerchi inutilmente una risposta sensata.
        Laura ti guarda con trepidazione.
            + [“Bonnie e Clyde?”]"<f>Bonnie</f> e <m>Clyde</m>?"
            + [“Woody Allen e Soon-Yi?”]“<m>Woody Allen</m> e <f>Soon-Yi</f>?”
            + “I miei?"
            -
        “<f>Britney</f> e <m>Justin</m> nel 2001! Dai, cosa c’è di più cringe del finto denim e di <m>Timberlake</m>?”
        <f>Laura</f> solleva i pezzi di tessuto.
        “Ho trovato due costumi ma non mi piacevano molto e così li ho smontati per rifarli meglio ma ehm, creo videogiochi, non sono una <f>sarta</f>. E ho pensato che potresti aiutarci tu, e in cambio ti <f>trucco</f>!”
        Ti guarda speranzosa.
            + “Non cucio da quando avevo tredici anni!”
                “Sono sicura che sia come andare in bicicletta.”
            + [“Trucco?”]"<f>Trucco</f>?"
            + “Possiamo vestirci da noi?”
                <f>Laura</f> ti ignora.
            -
        “E, sorpresa delle sorprese... io farò <m>Justin</m> e tu <f>Britney</f>!”
        Fai per dire qualcosa, ma.
        Ma qualcosa si muove nella pancia, un calore che si alimenta mentre osservi il tessuto di jeans, la <f>parrucca</f>, i <f>trucchi</f>. #completion_50
        Ti siedi in silenzio davanti alla macchina da cucire e, beh: è come tornare in bicicletta.
            + Inizi a cucire[] i pezzi di stoffa.
            -
        È un saltellare di ricordi il pomeriggio, passate da una cosa all’altra.
        Citare la <f>starlet</f> scomparsa di turno vi fa parlare di cosa stavate facendo quell’anno, un brano riporta un’amicizia rotta, una nottata ubriachi al mare.
        “Non vi siete più sentiti?”
        Sai che parla di <m>Omar</m>.
        Non vi parlate da due anni ormai, ma ogni tanto Laura te lo richiede.
            + “No."
            A un certo punto, non hai più sopportato le sue insinuazioni.
            -
        Il tessuto scorre veloce sotto la macchina.
        <f>Laura</f> prova il vestito: conciata da <m>Justin</m> è ridicolmente uno schianto.
        “E ora siediti, è il mio turno!”
        La sua mano leggera mescola, traccia, spennella la tua faccia.
        Ogni volta che si allontana sorride soddisfatta.
            + “Da quando l'avevi progettato?”
            -
        “Quando ho avuto l’idea mi sono accorta che in realtà era lì da sempre. Che era qualcosa che volevo fare con te, che potevo fare solo con te.”
        Ti bacia sulla nuca, ti afferra la mano per farti alzare, ti porta allo specchio.
        Il <f>vestito</f> è orribile, la <f>parrucca</f> oscena.
        Ma i tuoi occhi si riempiono di ciò che vedono, del volto ridisegnato dal <f>trucco</f>, della <f>vita</f> tracciata dalla cintura, del <m>petto peloso</m> che esce dalla <m>scollatura</m>. 
        Ti gira la testa.
            + “Dovrei rasarmi?”
            -
        Lo mormori.
        “Solo se non ti piaci così.”
        <f>Laura</f> stringe la tua mano.
        Ti guardi, e adori ciò che vedi allo specchio.
        Hai paura, ti manca l’aria, eppure hai la certezza che per la prima volta ti stai vedendo veramente.
        È come se qualcuno avesse tolto una patina dai tuoi occhi.
        Come se fino ad ora il corpo che vedevi allo specchio fosse quello di un’altra persona, qualcosa che continuavi a cancellare, che non volevi mai ricordare.
        Ma ora sei davvero tu.
        Ammiri i tuoi occhi enormi sotto l’<f>eyeliner</f>, e il modo in cui le <f>labbra</f> esplodano di rosso tra i peli della <m>barba</m>.
        Come i muscoli e le pieghe del vestito si esaltino a vicenda.
            + ...
            -
        Piangi. #completion_70
        <f>Laura</f> ti abbraccia.
        “Tutto ok, tesoro?”
            + Respingi tutto quello che provi[], perché non può esserci spazio per questo. La sincerità la allontanerà come ha allontanato <m>Omar</m>.
            -> Respingi
            + Non puoi dirle la verità[], non puoi. <f>Laura</f> è <f>magnifica</f>, ma lo era anche <m>Omar</m>, e dov'è ora?
            -> Perdere
            + Provi a cercare le parole[] per dirle ciò che senti.
            -> Sinceramente
        
        = Sinceramente
        ~  amab_tre = 2
        
            Ma non vengono, è come se ci fosse un vuoto, un pezzo che manca.
            Sorridi, balbetti che tutto è bello, è stato solo inaspettato.
            Ti manca il fiato.
            Ti intravedi di nuovo allo specchio e sorridi.
            Una voce dentro di te ti urla che fai schifo.
            Cerchi di ignorare quella voce, ma è forte di tutto quello che ti è stato detto durante la tua vita.
            <m>Omar</m> che non ti ritiene un <m>vero uomo</m>.
            La <f>vicina</f> che scherzando vi chiama “<f>lesbiche</f>”.
            Tua <f>madre</f> che ti dice che somigli troppo a <f>nonna</f>.
            Tuo <m>padre</m> che continua a regalarti biglietti per lo <m>stadio</m>.
            I giudizi, le cose dette e quelle taciute.
            Ti guardi allo specchio e sembri una cosa a metà, una <m>cosa sbagliata</m>.
            Un </f>babau</f>, un <m>abominio</m>.
            Te lo chiedi però.
            Cosa sono?
            Cosa sei <m>Pallino</m>?
            Cosa diavolo fottutamente sei? #almost_there
            -> bullet_hell_amab_tre_bis
        
        = Perdere
        ~  amab_tre = 1
        
            <f>Lei</f> ti fa sedere vicino a sé, il suo odore morbido che ti riempie.
            Ti guarda, e leggi nei suoi occhi la preoccupazione.
            “Mi spiace, tesoro”, ti dice.
                + “Per cosa?”
                -
            “È stata, è stata una specie di trappola. Ne ero consapevole, anche se ho fatto finta di no."
            Prende fiato.
            "Ti conosco da così tanti anni, e tante cose si vedono. Una relazione alla fine ti mostra sempre tutto ciò che sta tra le pieghe, no?"
            Ti affera la mano.
            "È quella la cosa bella e spaventosa. Notare cose che magari l’altra persona non vuole vedere.”
                + “Io vorrei vederle.”
                + “Non so dove guardare.”
                + "Ho paura delle conseguenze."
                -
            “Hai provato a rispondere alla domanda più semplice?”
            Provi a guardarla negli occhi.
            “Sei un <m>ragazzo</m>, <m>Pal</m>?”
            Ti guardi le mani.
            La tensione delle ultime ore è troppa, la voce di <f>Laura</f> sparisce, sommersa da tutti i commenti della tua vita.
            Da <m>Omar</m> che ti chiede se sei </m>frocio</m>, dai <m>compagni</m> di scuola che ti chiamano <f>femminuccia</f>.
            Dal prof di ginnastica che ti diceva che sei <f>troppo delicato</f>, da quella di letteratura che esaltava la tua <f>sensibilità femminile</f>.
            Quel <m>tizio</m> sul bus e "perché hai le <f>unghie così curate</f>?"
            Il tuo collega che dice che sei <m>grezzo</m> come un <m>muratore</m> ma hai il <f>faccino da bambola</f>.
            Tutte le voci che per tutta la vita ti chiedono solo di prendere posizione, di dire loro cosa sei.
            Che è un atto dovuto, dar loro una risposta.
            Cosa sei, cosa sei <m>Pallino</m>?
            Cosa sei? #almost_there
            -> bullet_hell_amab_tre
        
        = Respingi
            Ma reprimere non funziona più.
            C’è troppo calore nella pancia, è troppo bella la sensazione che hai provato.
            Ti alzi, cammini per la stanza, cerchi di tirare fuori qualcosa.
            -> Perdere
            
        
    ===bullet_hell_amab_tre ===
        $bullet_hell_amab_tre$
    -> finale_amab_uno
    
    === bullet_hell_amab_tre_bis ===
        $bullet_hell_amab_tre$
    -> finale_amab_due
        
    === finale_amab_uno ===
        Riapri gli occhi e sei tra le braccia di <f>Laura</f>.
        Ha gli occhi rigati dalle lacrime.
        Fuori fuochi e rumori di festa, bimbi che gridano.
        E lì, in fondo a tutto, col corpo e la testa svuotati, hai la risposta.
            + “Non sono un [ragazzo.”]<>
            -
            <m>ragazzo</m>. né una <f>ragazza</f>. O qualcosa a metà, ma più qualcosa d’altro. Come se continuassero a chiedermi se questa cosa è nera o gialla o bianca quando è viola, e non sapevo nemmeno che esistesse il viola.”
            <f>Laura</f> ti guarda confusa.
            + “Te ne andrai?”
            -
        Ti tira un pugno sulla spalla, seria.
        “Idiota, no, mai. Ti amo.”
        Rimanete in silenzio per un attimo, poi ti passa della birra.
        “È una cosa che faremo assieme questa cosa del trovare il viola, ok? Non sei <m>solo</m>, <f>sola</f>, quel che è. Cazzo. Ci sono. Ti amo. Dirò delle cazzate e per questo ti chiedo già scusa ma insomma.”
        La zittisci con un bacio.
            + “Andiamo a mostrare questә me al mondo?”
            + “Sai che rabbia proverà [Marika?"]<f>Marika</f> quando non sarà la prima in qualcosa per una volta?”
            + “Vieni[!"], prima che divenga la <f>Britney</f> del 2007!”
            -
        "Ho un piano B: una festa di <f>ragazze</f> <f>lesbiche</f>, un posto tranquillo dove stare, dovrebbero esserci anche un paio di <f>vecchie</f> <f>compagne</f> di scuola!"
        Il modo in cui ti guarda ti fa sentire invincibile.
        Scendete assieme in strada, le dita intrecciate.
        Ti fermi davanti ad una vetrina #almost_there
            + [Osservi il tuo riflesso]
            -
        -> bullet_hell_buono
    
    === finale_amab_due ===
        Quando apri gli occhi, <f>Laura</f> è accovacciata davanti a te, gli occhi fissi nei tuoi.
        “Ehi, dolcezza!”
            + [Appoggi la fronte alla sua]
            -
        “Cos’è successo in quella testolina?”
        Prendi un respiro.
            + “Avevi già capito?”
            -
        “Che c’è qualcosa che ti gira dentro? Da un po’. Mi sono chiesta cosa sarebbe successo se non fosse mai uscita, e ogni risposta non mi piaceva, per nulla.”
        Si siede accanto a te, lasci che ti stringa.
        “So cosa non sono, <f>Laura</f>. Non mi sento un <m>uomo</m>, ma nemmeno una <f>donna</f>. È come se mi venisse chiesto di scegliere solo tra mangiare una mela o una pera, quando la mia bocca è piena del gusto di ogni frutto di bosco.”
        “Le mele sono noiose!” scherza <f>Laura</f>.
            + “Non cotte[."] con lo zucchero e la cannella.”
            -
        “Questa metafora sta diventando creepy,” ti bacia, “ma credo di aver capito.”
        “E a te va bene?”
        “Almeno ora quando la <f>vicina</f> <m>fascia</m> ci chiama “<f>lesbiche</f>” posso dirle che è vero!”
        Si gira di colpo.
        “Ma non è vero, vero? Oh <f>mamma</f>, cosa devo dire ora? Ma quindi non sono più <m>etero</m>?”
        Le afferri le mani.
            + ["Abbiamo tempo."]“Direi che abbiamo tutto il tempo del mondo per trovare queste risposte, non serve per forza farlo stasera, no?”
            -
        <f>Lei</f> si rilassa, sorride.
        “Hai ragione. L’importante è solo una cosa: le troveremo assieme. Ritroveremo i frutti di bosco e la mia eterosessualità o qualsiasi cosa sia.”
            + “Te la immagini [Marika?"]<f>Marika</f>, che non sa più come presentarci ai suoi amici?”
            -
        “A proposito di <f>Marika</f>: te la senti di andare a quella festa?”
        Ti guardi allo specchio.
        I pianti e le tensioni hanno incasinato <f>parrucca</f> e <m>trucco</m>.
        Ti senti bellә come non è mai successo in tutta la tua vita, ma l'idea di farti vedere dai tuoi amici così, ti spaventa.
            + [Fai di no con la testa]
            -
        <f>Laura</f> ti sorride.
        "Ho un piano B: una festa di <f>ragazze</f> <f>lesbiche</f>, un posto tranquillo dove stare, dovrebbero esserci anche un paio di <f>vecchie</f> <f>compagne</f> di scuola."
        Un po' di paura rimane.
        Ma senti di esser rimastә troppo a lungo nascostә, hai voglia di uscire, di mostrarti. #almost_there
            + [Ti osservi un'ultima volta allo specchio]
            -
        -> bullet_hell_buono



//STORIA PALLINA
    === intro_afab ===
   ~ gender = 1

        “Non serve, davvero.”
        La voce di <f>mamma</f> ti sveglia. Sta parlando con <f>nonna</f>, sembra infastidita.
        Sei al mondo da poche ore, ma le tensioni le senti tutte.
            + [Gridi]
            -
        È l’unica cosa che sai fare se qualcosa ti dà fastidio.
        “Ha fame!” dice <f>nonna</f>, le mani strette sul volante.  #street
        “Le do da mangiare a casa sennò ora vomita, tanto manca poco.”
        Nonna sbuffa, mamma pure.
            + [Sbadigli]
            -
        I tuoi occhi si sforzano di guardare fuori dal finestrino. 
        Mezzi ciechi riconoscono giusto aloni, figure, contorni che sembrano poter essere qualsiasi cosa.
        Come te.
        La macchina si ferma.
        “Vuoi che?”
        “No”, <f>mamma</f> interrompe <f>nonna</f>, “abbiamo già tutto. Grazie per il passaggio.”
        “È il minimo per <f>mia</f> <f>nipote</f>.”
        Silenzio.
        La macchina si allontana.
        <f>Mamma</f> apre casa, c’è odore di chiuso e cibo andato a male.
        “Benvenuta, <f>Pallina</f>.”
        Il tono della sua voce è pieno di orgoglio.
            + [Ti ciucci il dito]
            -
        <f>Lei</f> sorride e ti mostra il monolocale.
        “Lo so che è piccolo, ma siamo solo noi, tesoro. Due <f>donne</f> contro il mondo!”, ride.
        “Ok, una e mezzo per ora. Però qui”, ti mostra un angolo della stanza, “c’è il tuo lettino, qui i peluches e poi guarda questa giostrina!” e fa girare un gruppo di animaletti <f>rosa</f> impiccati.
        C'è una volpe senza coda.
            + [Provi ad afferrarla]
            -
        <f>Mamma</f> sorride e ti allontana, e tu protesti coi pugnetti.
        “Hai fame?” chiede, e si accascia sul divano.
        Ti porta al <f>seno</f>.
        “Sai una cosa? Sarai la più brava della scuola, così mi renderai orgogliosa. E ti prenderò un sacco di <f>vestiti a fiori</f>, perché da piccola li volevo anche io, a <f>tutte</f> piacciono i <f>vestiti a fiori</f>.”
        Ti cambia posizione.
        “E poi diventerai una <f>dottoressa</f>, sì, hai le mani da <f>dottoressa</f>. Magari <f>ostetrica</f>, così farai felice tante altre <f>mamme</f>. Anche se io sarò la <f>tua</f>, sempre.”
        Sospira.
            + [Il sonno ti afferra]
            -
        “E magari quando ti sposerai con un brav’<m>uomo</m> mi farai vivere con voi, così ti aiuterò coi nipotini, e tu potrai continuare a lavorare. E se sarò ancora <f>bella</f>...”
        Ma stai già dormendo.
        Nel sogno vedi la strada di prima, il viaggio che hai fatto.
        Ma non ci sono più colori e forme e tutte le cose possibili.
        Ci sono solo <m>quadratini</m> <m>azzurri</m>
        <f>triangoli</f> <f>rosa</f>
        e mani enormi che ti schiacciano e strappano, cercando di darti una forma. #people
        -> atto_afab_uno
    
    === atto_afab_uno ===
    Infanzia<br/>Primavera<br/>Scuola #title
        
        Coi piedi batti un ritmo immaginario sul pavimento.
        “<f>Pallina</f>, stai ferma!”
        <f>Mamma</f> sorride ma è una statua, vuole che tu sia una statua.
        Una <f>bella</f> <f>statuina</f> col <f>vestito a fiori</f>, le <f>scarpe bianche</f> e i <f>capelli raccolti</f>.
        Ha passato tutto il viaggio in auto a dirti che dovete fare una buona impressione.
        Che l'incontro genitori/insegnanti è un momento in cui i genitori vengono giudicati severamente.
        Che un genitore solo è sempre colpevole, e per questo non dovete fare nessun errore.
        Pensi che non abbia molto senso, ma ti fidi di <f>lei</f>.
            + [Guardi fuori]
            -
        Ti fidi, ma questo non cancella la noia.
        Dei <m>ragazzi</m> si rincorrono.
        Quello sbruffone di <m>Lorenzo</m> ha portato un pallone, stanno facendo le squadre.
            + [“Mamma?”]"<f>Mamma?</f>"
            -
        Ti ignora.
        Dall’altro lato del giardino le <f>compagne</f> di classe chiacchierano.
        Riconosci <f>Laura</f>, <f>Marika</f>, <f>Chloe</f> e una di quarta, <f>Emma</f>.
        Perché solo tu devi startene seduta?
            + “Posso andare in bagno?”
            -
        “Ci sei stata due secondi fa tesoro.”
        Sospira e ti prende una mano.
        Il profumo di <f>mamma</f> è così forte che ti fa venire il mal di testa.
        “Se fai la <f>brava</f> poi ti prendo un gelato, ok?”
        Ti passa un libro di Geronimo Stilton, che sfogli controvoglia. #completion_33
        “Goool!” qualcuno urla da fuori.
        Il vocione di <f>suor Addolorata</f> spegne le grida dei tuoi <m>compagni</m>.
        Loro fanno promesse, rotte nel momento stesso in cui la finestra viene richiusa.
        La <f>suora</f> si affaccia da una porticina, chiama tua <f>madre</f>.
        “Stai qui dieci minuti, solo dieci minuti ok? E poi avrai il tuo gelato.”
            + [Fai sì con la testa]
            -
        Quanto sono lunghi, dieci minuti? 
        Conti sei respiri. Sette. Decidi che sono abbastanza.
        Ti alzi.
            + [Raggiungi i ragazzi]
            -> gioco
            + [Vai dalle tue compagne]
            -> compagne
            
        
            = gioco
                <m>Lorenzo</m> ti guarda infastidito, ma <m>Pallino</m> ti raggiunge sorridente.
                “Vuoi prendere il mio posto?”
                Non aspetta una risposta, ti passa il <m>pallone</m> e corre dalle <f>ragazze</f>.
                <m>Uno</m> della quinta ti batte il cinque.
                Senti i risolini idioti di <f>Marika</f> e <f>Chloe</f>.
                “Sei quella dei rigori, vero?”
                    + Fai sì con la testa[], nascondendo a fatica l’orgoglio.
                    -
                “Tutta fortuna”, commenta <m>Lorenzo</m>.
                “Proviamo!” dice <m>quello</m> di quinta.
                “Stai in squadra con me, ok? Marca <m>Lorenzo</m>, così lo facciamo innervosire.”
                Sei una scheggia.
                Le tue gambette hanno accumulato così tanta energia mentre aspettavi sulla sedia, che ora corri come una molla.
                Ci metti due minuti a segnare.
                Lorenzo chiama un fallo inesistente.
                    + "Chiudi quella bocca da rana!"
                    -
                Un gol ancora, poi un assist al <m>ragazzo</m> di quinta.
                Ti sembra di volare.
                <m>Pallino</m> e <f>Laura</f> fanno il tifo per te. #completion_50
                Sorridi, rubi la palla a <m>Lorenzo</m> che ti sbatte a terra.
                Il <m>ragazzo</m> di quinta dice qualcosa ma lo ignori.
                    + [Tiri un pugno a Lorenzo]
                    -
                È il caos.
                I <m>ragazzini</m> prendono in giro <m>Lorenzo</m> perché si è fatto <m>picchiare</m> da una <f>bambina</f>.
                Senti <f>Chloe</f> alle tue spalle chiamare <f>suor Addolorata</f>.
                Guardi <m>Lorenzo</m> che trattiene a fatica le <f>lacrime</f>.
                Una mano ti afferra la spalla, ti investe un profumo dolcissimo. 
                    + [Sbuffi]
                    -
                Come un palloncino che si sgonfia, hai smesso di volare. #completion_70
                La mano è quella di <f>mamma</f>, la sua voce urla che il vestito è strappato, il <f>vestito buono</f> e Cristo, no! Le scarpe bianche sono lerce!
                <f>Suor Addolorata</f> se la prende col <m>ragazzino</m> di quinta, che urla contro di lei.
                <f>Marika</f> ti indica e ride.
                “<f>Non è una cosa da bambine</f>!”
                Quanto è noiosa!
                    + [Le fai la linguaccia]
                    -
                <f>Mamma</f> ti tira una sberla.
                Ti senti al centro di un palco, e tutti urlano il tuo nome.
                Vorresti scendere, ma tutti ti chiedono: cosa sei <f>Pallina</f>, cosa sei?
                Perché ti comporti <m>come un bambino</m>?
                Perché <f>non ti vesti a dovere</f>?
                Perché usi le <m>parolacce</m> e <m>picchi</m>?
                Perché sei <f>brava</f> a <m>calcio</m>?
                Cosa sei <f>Pallina</f>, cosa sei? #almost_there
                ->bullet_hell_uno_afab
                
            = compagne
                Non esattamente la tua prima scelta ma quella più sensata: niente <m>pallone</m> uguale niente pasticci uguale niente sgridate di <f>mamma</f>.
                “Belle scarpe!” commenta <f>Marika</f>.
                Ti guardi i piedi.
                Ti stanno strette, le hai messe solo per la comunione di tuo cugino.
                    + “Di cosa parlate?”
                    -
                La risposta è così noiosa che il tuo cervello la ignora.
                Guardi il pallone correre da una parte all’altra.
                <m>Lorenzo</m> che fa il gradasso con <m>Pallino</m>.
                “Perché i <m>maschi</m> sono così idioti?”
                È <f>Chloe</f> a parlarti.
                Che noia.
                    + “Almeno si divertono.”
                    -
                “Anche noi. Stiamo giocando alle <f>principesse</f>, ce ne manca <f>una</f>.”
                Ti guarda speranzosa.
                    + [La ignori]
                    -
                “Vieni?”
                Non ne hai voglia, ma hai un’idea.
                    + “Ti va una sfida?["] Se vinci, gioco alle <f>principesse</f> fino a fine della scuola.”
                    -
                Lo sguardo di <f>Chloe</f> è dubbioso.
                Alle sue spalle sono arrivate le altre. #completion_50
                    + “Su quell’albero[..."]”, indichi un vecchio olmo dai rami bassi “c’è il registro di <f>suor Addolorata</f>. Se lo prendi prima di me, hai vinto.”
                    -
                “Sei stata tu a rubarlo?” <f>Laura</f> è sorpresa.
                Ti senti orgogliosa.
                Niente registro, niente prova delle decine di note che hai preso.
                E di quelle di molti compagni di classe.
                “Che <m>maschiaccio</m>!” <f>Marika</f> solleva il naso a punta. 
                “Ma <f>Chloe</f> è una secchiona, poi lo porta sicuro alle <f>suore</f>!”
                <f>Laura</f> non è convinta.
                “Non sono secchiona!”
                    + [Osservi Chloe]
                    -
                Si avvicina all’albero, appoggia la mano e guarda verso l’alto.
                “E se perdo?”
                    + [Sai cosa vuoi.]“Tu e <f>Marika</f> la smettete di farmi fare la <f>principessa</f> ogni giorno, e mi lasciate fare il <m>cacciatore</m>, o il <m>drago</m>.”
                    -
                Non ti aspetta, e inizia a salire.
                Ti tuffi sul ramo più basso.
                È più veloce di quanto pensassi.
                Furba, fa in modo di occupare i rami più stretti, così che tu non possa superarla.
                Ci sono persone che fanno il tifo.
                I ragazzi urlano il tuo nome.
                    + [Salti su un ramo instabile]
                    -
                Ce la fai, <f>lei</f> però recupera lo svantaggio. 
                Il suo <f>vestito</f> si strappa e lo ignora.
                Forse ora <f>Chloe</f> ti sta simpatica.
                Alle urla dei bambini però ora ci sono quelle degli adulti. #completion_70
                “Scendete subito!”
                <f>Marika</f> tiene la mano di <f>suor Addolorata</f>, e vi indica.
                Tua <f>madre</f> è livida.
                Ma non puoi fermarti ora, non vuoi perdere.
                    + “Arrenditi[!"], sono più veloce di te!”
                    -
                <f>Chloe</f> non ti risponde.
                Le <f>suore</f> e tua <f>madre</f> sono sotto all’albero.
                Chloe grida: ha afferrato il registro.
                    + Ti scappa una parolaccia[]. <f>Marika</f> si scandalizza.
                    -
                E poi <f>Chloe</f> cade.
                Un attimo di silenzio e inizia a piangere.
                Scendi di fretta.
                Si capisce subito che il braccio è rotto.
                E tua <f>madre</f> è una furia.
                Davanti a tutti ti porta via di peso.
                La sua voce fa eco a quella di <f>Marika</f>.
                Ti dice che non ha una <f>figlia</f> ma un <m>mostro</m>, un <m>ragazzo</m>, che è una vergogna, che il vestito è un disastro.
                Te lo dice <f>Marika</f>, lo dicono le <f>suore</f>.
                Ti chiedono cosa tu sia, <f>Pallina</f>.
                Non sei una <f>bambina</f>, <f>Pallina</f>. Cosa sei?
                Cosa sei? #almost_there
                ->bullet_hell_uno_afab
    
    ===bullet_hell_uno_afab===
    $bullet_hell_afab_uno$
    -> atto_afab_due
    
    === atto_afab_due ===
    Adolescenza<br/>Inverno<br/>Liceo  #title
    
        Dal piano di sotto solo qualche risata.
        C’è un silenzio strano: nessuno ha sonno, eppure le parole sembrano finite.
            + “Ce l’abbiamo fatta!”
            -
        Seduta sulla cattedra passi la sigaretta a <f>Chloe</f>, con un sorriso teso.
        Fuori la città dorme, il piazzale è vuoto.
        Domattina sarà riempito dalle camionette della pula, dai prof, da qualche <m>figlio di papà</m>.
        Forse un paio di giornalisti annoiati.
        Ora però il piazzale riposa.
        “Tanta roba per “<f>tre lesbiche del cazzo</f>!”, vero?”
        Emma si sforza di sembrare serena, ma sta tremando.
            + “Sono orgogliosa di te, [Bunny.”]<f>Bunny</f>."
            -
        Ed è vero, perché nonostante ansie e paure <f>Emma</f>-Superfandi<f>SailorMoon</f>-<f>Bunny</f> non vi ha mai smollate, manco quando mezzo consiglio studentesco vi ha insultate davanti a tutti.
        Tre <f>lesbiche</f> del cazzo.
        Eppure avete avuto l’ok, avete trovato più di trenta <f>studentesse</f> disponibili, e l’occupazione è iniziata.
        “Pensi possa davvero servire a <f>Marika</f>, tutto questo?”
        Chloe ti ripassa la sigaretta.
            + “Almeno saprà di non essere [sola.”]<f>sola</f>."
            -
        “Non possiamo fare di più, temo.”
        <f>Emma</f> guarda fuori dalla finestra.
        <f>Marika</f>: sospesa dopo aver accusato di molestie il <m>preside</m>.
        E nessuno che vuol fare qualcosa.
            + “Domani [il Guagliotti mangerà merda!”]il <m>Guagliotti</m> mangerà merda!”
            -
        “Chissà se l'eterno rappresentante d'istituto <m>Lorenzo</m> Facciadimerda Guagliotti ammetterà che era il caso di organizzare almeno un’autogestione.”
        “Naa, dirà qualcosa sulla legalità da rispettare.”
        Chloe si abbarbica sul tuo braccio.
            + “Con la sua legalità ci menano[."]. Se la può ficcare nel culo.”
            -
        <f>Chloe</f> ti fissa sorridendo, orgogliosa e innamorata.
        <f>Emma</f> legge qualcosa nel suo sguardo.
        Non vi ha mai chiesto niente, ma sa.
        “Scendo da <f>Laura</f> e dalle <f>gemelle</f>, provo a dormire un po'.”
        La abbracci.
            + “Prenditi cura delle primine!”
            + “Ti voglio bene, [Bunny!”]<f>Bunny</f>!"
            + “Se non te la senti[..."], nessuno ti giudica.”
            <f>Lei</f> ti sorride, stanca: “Abbiamo iniziato assieme, finiamo assieme”.
            -
        Come la porta si chiude, <f>Chloe</f> ti bacia. #completion_33
        “Come fai ad essere tanto <f>figa</f>?”
        Sorridi.
            + “Divoro la rabbia del [Guagliotti.”]<m>Guagliotti</m>.”
            Ti dà un altro bacio. “Speravo fosse un po’ merito mio.”
            + “Rubo la bellezza delle [vergini.”]<f>vergini</f>."
            “Allora sono salva”, ti risponde con malizia.
            + “Ignoro i miei sentimenti[."], così marciscono, diventano compost e alimentano le mie cellule.”
            “Idiota”, finge di darti una sberla.
            -
        “Cosa dirà tua <f>madre</f>?”
        Te lo chiede stendendo un piccolo sacco a pelo, così piccolo che ti chiedi come ci starà il tuo corpicione lì dentro.
            + [Imiti tua madre]
            “Perché io <f>signorina</f> non ti ho mica cresciuta da <f>sola</f> per vederti poi diventare un <m>teppista</m>! Faccio due lavori e uno è per pagare i tuoi danni, acciderbolina!”
        -
        Ci scherzi sopra, ma vorresti capisse che queste cose le fai anche per <f>lei</f>, perché storie come la sua o quella di <f>Marika</f> non si ripetano più.
        Ma <f>lei</f> ti vorrebbe solo a studiare e fare volontariato in chiesa. Più avanti un <f>bravo marito</f> ingegnere, due <f>figli</f> e un appartamento sotto al suo.
        Te la immagini <f>sola</f>, a casa, preoccupata, e ti si spezza il cuore.
        “Intendevo di noi.” #completion_50
        La voce di Chloe si è fatta bassa.
            + “Uh.”
            -
        Scendi dalla cattedra.
        “Che risposta è “uh”?”
            + “Non le ho ancora detto niente.”
            -
        “Ma non sarà un problema per <f>lei</f>, no? Ha anche visto le foto dello scorso Pride!”
        Non è che sia andata benissimo però.
            + “È che non sono sicura.”
            -
        “Di noi?”
            + “Di me.”
            -
        <f>Chloe</f> ti guarda, ferma a metà nel gesto di spogliarsi.
        {atto_afab_uno.compagne: La luce mette in evidenza una vecchia cicatrice sul braccio e lo sguardo ferito.} 
        Sai che c’è qualcosa, qualcosa che devi capire, ma le parole se ne vanno quando provi ad afferrarla quella cosa e a parlarne.
            + “Ti amo[.“], ed è tutto quel che so.”
            -
        Chloe si stende in silenzio.
            + “Ma non ti basta.”
            -
        Ti sdrai accanto a <f>lei</f>. 
        Guardi il soffitto lercio: segni di scarpe, ragnatele, gomme da masticare, tracce di unto. Una trave esposta da cui cade polvere. #completion_70
        “È che non capisco.”
        La voce di <f>Chloe</f> taglia il silenzio della stanza.
        “Arriva sempre un momento in cui alzi una barriera e mi tieni fuori.”
            + ["Non voglio dirti cazzate."]“Ti tengo fuori solo da quello che non capisco di me, per non dire cazzate. Ho bisogno di tempo, <f>Chloe</f>.”
            -
        “E questo è uno scudo contro di me?”
        Ti tira il <m>binder</m>.
        Dopo un’intera giornata è una tortura, la schiena è a pezzi ma non vuoi levartelo.
        Le sue dita si infilano sotto, ti senti morire.
            + Provi a resistere[]. Il tuo corpo si irrigidisce.
            “Stai trattenendo il respiro?” <f>Chloe</f> ti guarda perplessa.
            -
            + [Levi la mano]
            -
        <f>Lei</f> si alza, va alla finestra.
        Detesti quando cerca di farti sentire in colpa, detesti che ci riesca sempre.
        Ti avvicini a <f>lei</f>.
        “Ancora questa storia. Non sei un <m>uomo</m>, <f>Pallina</f>. Lo saprei. Mi fanno venire tipo l’orticaria se <m>li</m> tocco. La tua forza è quella di una <f>donna</f>, i tuoi gemiti...”
        Ti accarezza.
            + “Non sta a te decidere cosa sono.”
            -
        Ti esce più dura di quanto vorresti.
        Dai la colpa alla stanchezza, ma sai anche che non ne puoi più. Che tutto questo ti ferisce.
        Continua a dirti che ti ama, ma poi sembra sempre volere qualcosa che non sei.
        “Hai ragione. Ma questa cosa è difficile anche per me.”
        Il corpo di Chloe torna accanto al tuo, ti abbraccia, ma senti che è lontana anni luce.
            + [La stringi]
            -
        Arriva questa idea, questo pensiero che diventa una certezza.
        Se finisce la storia con <f>lei</f>, nessuna ti amerà più.
        C'è una scelta che devi fare, o cose che è il caso che tu impari a riconsiderare.
        A ignorare.
        Forse non sono così importanti, no?
        Quando inizia a russare tu sei ancora lì, gli occhi spalancati e il cervello bloccato su una domanda, una sola domanda.
            + “Cosa sono?” #almost_there
            -
    -> bullet_hell_due_afab
    
    === bullet_hell_due_afab ===
   $bullet_hell_afab_due$
    -> atto_afab_tre
    
    === atto_afab_tre ===
    Età adulta<br/>Autunno<br/>Discoteca #title
    
        Guardi tua <f>madre</f> e <f>Chloe</f> parlare al bancone del locale.
        Ancora non ti capaciti di come le cose siano cambiate.
        <f>Mamma</f> ti fa il gesto di raggiungerla.
        “<f>Chloe</f> mi diceva che state pensando di andare in Spagna per, insomma...”
        Guardi tua <f>moglie</f>: questa cosa della <f>maternità</f> l’ha accennata giusto due sere fa.
        Ha già deciso che avrete un figlio, a quanto pare.
            + [Resti in silenzio]
            + “È solo un’idea per ora.”
            + “È un processo lungo[.“] ma sì, ci stiamo ragionando.”
            -
        “Non vedo l’ora di essere <f>nonna</f>.”
        Tua <f>madre</f> è raggiante.
        Si guarda in giro.
        “Forse è il caso che me ne vada ora, ma sono stata felice di darvi una mano, <f>ragazze</f>.”
        Ti abbraccia e se ne esce dal locale.
        “Perché non hai messo il costume che ti avevo preso?”
        Chloe guarda infastidita il tuo felpone largo.
            + “Non ho fatto in tempo[.“]. I preparativi e tutto il resto...”
            -
        Ma non ti risponde perché due <f>donne</f> si avvicinano, vestite da <f>Ellen Degeneres</f> e <f>Portia de Rossi</f>.
        Iniziano a parlare con <f>Chloe</f> di soldi, politica, della <f>figlia</f> dell’assessore.
        Di riqualificazione del quartiere.
            + “Cosa non va nel quartiere?”[] chiedi senza pensarci.
            -
        <f>Chloe</f> ti dà una gomitata.
        Bisbiglia: “Sii gentile, sono loro a finanziarci”.
            + Sorridi [alle due]<f>alle</f> che ti stanno osservando.
            -
        “Avete fatto davvero un gran lavoro, complimenti”, dice la finta <f>Portia</f>.
        “Forse il titolo è un po’ prosaico”, commenta la finta <f>Ellen</f>.
        <f>Chloe</f> difende ridendo il nome della festa, perché ovviamente “Halloween senza <m>uomini</m>” l’ha scelto <f>lei</f>, come il novanta per cento delle cose della serata.
        “Tutto bene?”, Emma interrompe i tuoi pensieri.
            + [Fai sì con la testa]
            + “Detesto questa gente.”
            + Ti tappi le orecchie[], fingendo di urlare disperata.
            -
        <f>Emma</f> infila il braccio sotto al tuo.
        È vestita come se fosse appena uscita dalla doccia, con un gigantesco foulard sui capelli.
        “Posso parlarti?” 
            + Lanci un'occhiata a [Chloe]<f>Chloe</f>, che però è presa a riverire la coppia.
            -
        L’improvvisata discoteca è già piena, centinaia di <f>donne</f> che si agitano e ballano e chiacchierano. #completion_33
        Diverse hanno la spilletta di “<f>Tre lesbiche del cazzo</f>”.
        <f>Chloe</f> sarà felice di tutte queste nuove tesserate.
        Noti che <f>Emma</f> non porta la sua.
        Ti trascina fuori, sul retro del locale.
        Prende fiato, sta un po’ tremando ma la conosci abbastanza da sapere che non è per colpa del freddo.
            + “Tutto ok [Bunny?”]<f>Bunny?</f>"
            -
        <f>Le</f> passi un braccio attorno al collo.
        “Lascio l’associazione.”
        È un colpo freddo, imprevisto.
        L’avete creata voi tre, è nata dagli anni delle occupazioni e dei cortei, dei Pride, delle manifestazioni non autorizzate contro il politico <m>fascio</m> di turno.
        “Non è più il progetto in cui credevamo, <f>Pallina</f>. Questa roba è, è altro, è il sogno bagnato di <f>Chloe</f>."
        Si getta un'occhiata alle spalle.
        "Questa è la gente contro cui abbiamo lottato, che ci fanno quelle due stronze qui?”
            + “Se vogliamo sopravvivere...”
            -
        “Queste sono le parole di Chloe, porca la cacca. Tu sai che ti voglio bene, vero?”
            + [Resti in silenzio]
            + [Fai sì con la testa]
            + “Anche io, [Bunny.”]<f>Bunny</f>."
            -
        Ti prende le mani.
        “Non sei più te stessa, <f>Pallina</f>. Praticamente ubbidisci solo a <f>Chloe</f>, non la metti mai in discussione. Dov’è la <f>Pallina</f> che rispondeva “fanculo!” a ogni cosa? Che cercava di salvare il mondo? Quella il cui divano ha ospitato quintali di <f>ragazze</f> cacciate di casa?”
        C’è un toc freddo da qualche parte nella tua pancia.
        Dove hai messo un sistema di difesa che ultimamente spara contro tutto, in modo indiscriminato, pur di non guardarsi dentro.
            + Entri nel locale[], ma <f>Emma</f> ti ferma sulla soglia.
            + Molli la mano di [Emma]<f>Emma</f>, cerchi una sigaretta nelle tasche strette.
            + “C'è chi ha deciso di crescere, e chi no.”
            Lo dici con cattiveria, ma lei non molla.
            -
        “Tesoro, non stai bene, da molto. Non so cosa stia accadendo, ma sono preoccupata. Voglio aiutarti, ma non so come farlo se...”
        Venite interrotte da delle grida.
            + Ne approfitti per entrare[] e vedere cosa sta succedendo.
            Le parole di <f>Emma</f> ti rimangono incollate addosso.
            -
        “Non è un <m>uomo</m>.”
        La voce cade nel silenzio totale, persino la musica è scomparsa. #completion_50
        “Le regole sono regole e...”, è la voce di <f>Chloe</f>, che trema.
        Sai che è incazzata. Le due <f>iene</f> sono alle sue spalle, in mano due Martini.
            + [Ti avvicini]
            -
        “<f>Laura</f>, non importa, andiamo altrove.” 
        Riconosci le due persone che stanno discutendo con <f>Chloe</f>.
        <f>Laura</f>, la tua <f>vecchia</f> <f>compagna</f> di scuola, vi siete perse dopo i primi anni di liceo.
        E <m>Pallino</m> che, che. Non riesci ad ascoltare i tuoi pensieri, a capire "che" cosa.
        Sai che in teoria è in costume, vestito da biondina, ma ti rendi conto anche che per <f>Pallino</f> quello non è solo un costume.
        Quel toc freddo, di nuovo, nello stomaco.
            + [Vai verso Chloe]
            -
        Ma <f>Emma</f> si mette in mezzo.
        “È questo quello che non deve accadere. Non siamo questa cosa qui.”
        Senti <f>Laura</f> dire qualcosa col tono di chi è stanco di ripetere la stessa frase ancora una volta.
        “Non è un <m>ragazzo</m>, è una persona non binaria, vuole solo stare in un posto tranquillo per la prima volta che esce di casa così."
        Stringe Pallino a sé.
        "Sperava di non venir presә a brutte parole almeno qui, ma a quanto pare.”
        <f>Laura</f> intercetta il tuo sguardo, ti riconosce.
        <f>Chloe</f> si rende conto che la <f>tizia</f> sta guardando altrove.
        Ti vede, e con gli occhi ti supplica di darle soccorso.
            + [Sorridi a Laura] -> Pacificazione
            + [Ti appoggi a Chloe] -> Durezza
            + [Te ne vai a bere] -> al_bancone_Emma

        
            = Pacificazione
                Saluti, convenevoli, spieghi che è una serata particolare, che non c’è desiderio di discriminare nessuno, è solo che vi è stato chiesto di, di cosa, non lo sai manco tu alla fine.
                Più parli più ci sono mormorii, gente che esce dal locale.
                Pallino sorride a Laura.
                “Andiamocene tesoro, non importa.”
                <f>Laura</f> sembra delusa mentre se ne vanno.
                “Conosci queste persone?” ti chiede <f>Chloe</f>.
                A quanto pare non <f>le</f> ha riconosciute.
                Con la coda dell’occhio vedi <f>Emma</f> uscire.
                    + [La insegui]
                    -> pre_terzo_bullet_hell_afab
        
            
            = Durezza
                <f>Chloe</f> continua a parlare, la sua rabbia sempre meno nascosta ora che sei al suo fianco.
                Pallino è davanti a te.
                Ti rendi conto che è a disagio per la situazione, ma è comunque raggiante.
                Il modo in cui le sue dita si muovono, come gli occhi esplorano lo spazio.
                Il sorriso che arriva sulla sua bocca quando si vede nel riflesso della porta.
                Come scosta i <f>capelli lunghi</f>, lasciando che la mano poi rimanga sul <m>petto peloso scoperto</m>.
                Guardi il tuo di <f>petto</f>, che cerchi sempre di dimenticare, di ignorare.
                Non porti più il binder da anni, da quando Chloe ti ha detto: “O quello, o me”.
                    + “Andatevene.”
                    -
                La tua voce è piena di rabbia.
                    + “Non è posto per voi[."]. Non potete andare dove volete, come volete. È una festa privata con le sue regole, c’è poco da sindacare.”
                    -
                Vedi le <f>iene</f> sorridere soddisfatte, <f>Chloe</f> ti prende la mano.
                <f>Laura</f> ti gira le spalle e se ne va.
                Eviti di incrociare lo sguardo di Pallino.
                Assieme a loro se ne vanno diverse persone, alcune sono <f>attiviste</f> del gruppo.
                <f>Chloe</f> ti bacia e ringrazia.
                Emma si avvicina, ti guarda, e in silenzio se ne va.
                    + [La insegui]
                ->  pre_terzo_bullet_hell_afab
            
            
            = pre_terzo_bullet_hell_afab
                Ma <f>la</f> perdi subito in mezzo alla calca. #completion_70
                La strada è piena di persone e voci e odori, ma non <f>Emma</f>.
                Perché <f>la</f> stai inseguendo?
                <f>Chloe</f> urla il tuo nome.
                Non la vuoi tra i piedi ora, non ora.
                    + Acceleri il passo[], la lasci alle spalle.
                    -
                Ripensi alle parole di <f>Emma</f>.
                Hai tradito la persona che eri? E perché?
                Correndo il <f>seno</f> salta, ti ricorda che esiste, riempiendoti di disagio.
                Il tuo <f>corpo</f> ti sembra immenso, esposto.
                Gli sguardi delle altre persone pronti a giudicarlo, sezionarlo.
                A decidere attraverso le sue forme, cosa sei.
                Tutti gli occhi sono quelli di Chloe.
                    + [Ti appoggi a un muro]
                    -
                Ti manca il fiato e quel senso di disagio, di freddo è lì che si crepa, che ti riempie delle parole e dei giudizi, delle promesse e delle velate minacce.
                Di <f>Chloe</f> che vuole che tu sia la sua <f>ragazza</f>, la sua <f>donna</f>, la <f>madre</f> della vostra <f>bambina</f>.
                Ci sono domande che non vuoi ascoltare perché stai pensando a <f>mamma</f>, <f>mamma</f> che c’ha messo trent’anni ad accettare che sei <f>lesbica</f>, e ora vorresti davvero cambiare tutto, di nuovo?
                Rischiare di nuovo di perderla?
                Inizi a piangere, svuotata.
                Chi devi essere, perché tu possa essere felice? #almost_there
            -> bullet_hell_tre_afab
            
            = al_bancone_Emma
                Butti giù due bicchieri di fila. #completion_70
                <f>Emma</f> si avvicina.
                “Non erano nostre <f>compagne</f> di scuola quelle all’ingresso?”
                Vuoi solo startene sola.
                    + Chiudi gli occhi[.], concentrandoti sulla musica.
                    -
                “Non è che se non guardi le cose queste spariscono!”
                    + [Ordini un altro shot]
                    -
                “<f>Pallina</f>!”, <f>Emma</f> ti prende le mani. “Cosa sta accadendo?”
                Ti senti rompere, senti che sta per cedere qualcosa.
                La guardi negli occhi, fai per parlare.
                    + [Ma ordini ancora uno shot]
                    -
                L’alcool arriva tutto in una botta, la nausea ti invade.
                Il chiasso all’ingresso sta allontanando le persone, la musica si è fermata, ma tu ti accorgi solo di <f>Emma</f> che ti guarda preoccupata.
                Ti chiedi se <f>lei</f> possa vederti davvero, vedere cosa sei.
                Perché hai evitato per così tanto di guardarti dentro, e ora non sai più cosa potresti trovarci.
                    + “Non so chi sono, [Bunny.”]<f>Bunny</f>."
                    -
                Ti senti cadere. L’alcool altera tutto.
                La caduta è infinita, accelerata dai commenti di una vita.
                “Devi <f>vestirti da bambina</f>!”
                “Questa non è una cosa da <f>ragazza</f>.”
                “Perché <m>giochi a calcio</m>?”
                “Sono <f>lesbica</f>, per cui tu sei una <f>ragazza</f>, la <f>mia</f> <f>ragazza</f>.”
                “È normale che detesti il tuo <f>seno</f> in una società così sessualizzata.”
                "Ci sono <m>solo due generi</m>."
                "Questo è <m>innaturale</m>!"
                Vomiti, e col vomito si rompe quel pezzo di gelo che avevi nel petto.
                Le parole vengono a getto, ti feriscono, e tu non hai più la forza di reagire. #almost_there
                -> bullet_hell_tre_afab
         

    === bullet_hell_tre_afab ===
        $bullet_hell_afab_tre$
    -> finale_afab
    
    === finale_afab ===
        “<f>Pallina</f>! Ti prego guardami!”
        È la voce di Emma.
            + [Ti sforzi di aprire gli occhi]
            -
        Pesano quintali.
        Sei in ginocchio, e davanti a te c’è la <f>tua</f> migliore <f>amica</f>.
        “Cazzo, quanto mi hai fatto preoccupare!”
        Cerchi qualcosa da dire, e ti rendi conto che c’è un sacco di spazio ora nella tua testa.
        Spazio per nuove parole.
        Il gelo nella pancia è sparito.
            + [“Emma.”]"<f>Emma</f>."
            -
        Ti guarda preoccupata.
            + “Ho paura.”
            -
        Inizi a piangere, non ricordi da quanto non lo facevi.
        Infradici la spalla di <f>Emma</f> che ti stringe, che ti rassicura.
        Che ti dice che andrà tutto bene.
        Pian piano riprendi fiato, ti lasci andare su di <f>lei</f>.
        Non avevi mai realizzato quanto la sua amicizia fosse il tuo posto sicuro.
            + [“Emma, non credo di essere una ragazza."]"<f>Emma</f>, non credo di essere una <f>ragazza</f>.”
            -
        Lei resta in silenzio, toccandoti i capelli.
            + “E nemmeno un [ragazzo."]<m>ragazzo</m>.<> 
            E quando ho visto prima Pallino, quando ho visto quanto fosse felice in quel modo altro, ho pensato che quello è il mio posto. E mi ha fatto paura.”
            -
        “Qual è la cosa peggiore che potrebbe accaderti, se fosse così?”
            +“Perderei [Chloe.”]<f>Chloe</f>."
            -
        “E se continuassi a non cercare una risposta?”
        Resti in silenzio.
        Ti rendi conto che l’alternativa è perdere te.
            +“Avrò bisogno di te, [Emma.”]<f>Emma</f>."
            -
        “Non vado da nessuna parte tesoro, ma non chiamarmi ma più <f>Emma</f> o mi metto a gridare.”
        Indichi il suo foulard sopra la testa, mezzo sfatto dalla serata, dalle corse.
            +“Posso, [Bunny?”]<f>Bunny</f>?"
            -
        Te lo passa, <f>le</f> chiedi di chiudere gli occhi.
        È immenso, lo usi per fasciarti il <m>seno</m> stretto, per farlo sparire.
            +“Ci sbronziamo da qualche parte?”
            -
        <f>Emma</f> ti sorride, ti passa la sua giacca di pelle.
        “Se vuoi, ho ancora due bombolette di stelle filanti spray, e so dov’è parcheggiato il SUV delle due <f>ricche</f> <f>stronze</f>.”
        <f>Le</f> afferri la mano.
        Lei prende il cellulare, pronta per un selfie assieme. #almost_there
            + [Lo schermo mostra il tuo corpo]
            -
        -> bullet_hell_buono

//FINALI INTERMEDI

    === sconfitta_amab_uno ===
        Grida ti fanno tornare in te.
        Vedi <f>Pallina</f> con in mano dei sassi, sangue sulla fronte di <m>Lorenzo</m> che urla cose.
        "Va a piangere da <f>mammina</f>, su!"
        Un bus suona il clacson infastidito, obbligando i <m>ragazzi</m> a levarsi dalla strada.
        Rimanete solo tu e <f>Pallina</f>.
            + Provi a dire qualcosa[], ma biascichi a fatica.
            -
        <f>Pallina</f> cerca il tuo sguardo: "Devi..."
            + "Picchiarli?"[]
            Ripensi a quanto ha detto poco fa <m>Omar</m>.
            -
        "Ignorarli."
        È seria, le mani sui fianchi come la <f>supereroina</f> di un fumetto.
        "Primo, perché sono degli idioti. Secondo, perché sono degli idioti, e terzo, perché sono degli idioti e che te ne frega di loro?"
            + "La fai facile, tu a loro piaci."
            -
        "Non sempre, solo quando si tratta di vincere a pallone."
        Ti tende la mano, un invito ad alzarti.
        "Ascolti sempre quello che dicono la <f>maestra</f> o <f>Marika</f> o gli altri bambini, ma non è che sanno tutto loro e tu no."
        È superseria.
            +["Omar dice che devo essere come loro."]"<m>Omar</m> dice che devo essere come loro."
            -
        "Mica <m>Omar</m> sa tutto. Guardati."
        Ti fa voltare.
        Avete la vetrina di un negozio abbandonato davanti a voi.
        "Tu sei tu, punto. Io sono io. Punto. Loro fanno quel che vogliono, noi facciamo quel che vogliamo."
        Ti guardi nella vetrina, e inizi a vedere qualcosa, qualcosa che prima non c'era, qualcosa che era stato coperto dalle parole di tuo <m>fratello</m> e dei bambini e delle maestre e di tua <f>madre</f>.
        Sai che c'è qualcosa che puoi dire a Pallina, qualcosa che lei può capire. #almost_there
            + ["Pallina, vuoi sapere una cosa bella?"]"<f>Pallina</f>, vuoi sapere una cosa bella?"
            -
        -> bullet_hell_buono


    === sconfitta_amab_due ===
        Quando riapri gli occhi, ti circondano le cose di <f>nonna</f>.
        Sei nel suo letto, voci vengono dal salotto.
        C'è un bicchiere d'acqua sul comodino, ma quando provi ad afferrarlo cade.
        Passi arrivano veloci in stanza.
        <f>Laura</f> ti abbraccia, <m>Omar</m> ti guarda preoccupato.
        "Cazzo hai fatto <m>fratello</m>?"
        Li guardi perplesso.
        "Ad una certa sei svenuto. Ci siamo preoccupati."
        <f>Laura</f> ti stringe una mano.
        "Sei davvero una <f>femminuccia</f> <m>Pal</m>!"
        Omar ti tira un pugno sulla spalla.
            + "Basta."
            -
        Dura, la parola arriva in faccia a <m>Omar</m>, e ti va bene così.
        "Ohi, stavo solo scherzando."
        La tua mente è lucida, le parole chiare.
        Ti alzi dal letto.
            + "Bas-ta."
            -
        "<m>Pal</m>, hai battuto la testa?"
        Fissi Omar negli occhi.
            + "Ne ho abbastanza[!"] dei tuoi <m>frocio</m>, <f>gay</f>, </m>ricchione</m>, <f>femminuccia</f>, <f>lesbiche</f> e via di seguito. Non sei manco originale, e fanno male. Fanno male."
            -
        "Perché sei..."
            + "Perché non sono te[."], e va bene così. Basta. Non devo somigliarti, non voglio nemmeno, perché dovrei?"
            -
        Tuo <m>fratello</m> stringe le labbra e i pugni.
        "È il caso che me ne vada."
            + ["Omar?"]"<m>Omar</m>?"
            -
        Si ferma.
            + "Lasciami essere chi sono[."], se mi vuoi davvero bene."
            -
        "Se lo facessi allora non ti vorrei bene, perché il mondo ti divorerebbe."
        Guardi Laura, le sorridi.
            + "Forse il tuo, di mondo.["] Ma ce ne sono altri dove c'è posto anche per me."
            -
        <m>Omar</m> se ne va.
        <f>Laura</f> ti abbraccia.
        Piange.
        "Ti amo."
        <f>La</f> baci guardandola negli occhi.
        C'è il tuo riflesso nelle sue lacrime e finalmente vedi lə tuə verə te, e lə ami. #almost_there
            + [Sorridi]
            -
        -> bullet_hell_buono
        
        
        
    === sconfitta_afab_uno ===
        Sei a casa con <f>mamma</f>, non ha parlato per tutto il viaggio.
        Avete due cioccolate davanti, ma siete entrambe ferme.
        Non hai idea di cosa stia pensando.
        Poi prende fiato.
        "Sei pronta per un discorso da persone adulte?"
            + Fai subito sì con la testa[], felice che ti abbia rivolto la parola.
            -
        "Non so come si fa a essere una buona <f>mamma</f>, <f>Pallina</f>." sospira. "Di certo non come <f>nonna</f> <f>Melina</f>."
        Ti sorride.
        "Ho fatto un sacco di casini, sai? Sempre di testa mia, e questa cosa <f>la</f> faceva impazzire."
        Ha gli occhi lucidi.
        "Ma sono contenta di averle disubbidito. O non sarei la persona che sono, euna persone che mi piace. E non avrei avuto te, che sei la cosa più bella del mondo per me. Lo sai, vero?"
            + Non sai se e come muoverti[]. Ti sono nuovi questi discorsi.
            -
        "Ti propongo un patto: tu mi dirai di cosa hai bisogno, cosa vuoi fare. Io ti dirò di "no" solo se so che sarà pericoloso."
        Prova a sorriderti, "E dovrai fidarti di me. In cambio, sopporti le suore fino alla fine dell'anno, e poi cambiamo scuola."
        Ti stai guardando le mani, perché non sai cosa dire. È la prima volta che ti trattano da persona adulta.
        E poi ti rendi conto che una cosa la sai.
            + ["Mamma? Vorrei tagliarmi i capelli."]"<f>Mamma</f>? Vorrei tagliarmi i capelli."
            -
        "Questa mi sembra una richiesta facile, tesoro", ti scompiglia i lunghi riccioli.
            +["Li voglio rasati come Lore."]"Li voglio <m>rasati</m> come <m>Lore</m>."
            -
        <f>Mamma</f> fa per dire qualcosa, poi si ferma.
        "Ti va se te li taglio io?"
            + [Le prendi la mano]
            -
        Ti abbraccia.
        Quando si stacca ha gli occhi lucidi.
        Ti accompagna in bagno, e man mano che le ciocche cadono hai l'impressione che una patina sparisca. #almost_there
            + ["Mamma, mi vedo!"]
            -
    -> bullet_hell_buono
    
    
    
    === sconfitta_afab_due ===
        Il risveglio è come uscire da un incubo.
        Fuori c'è il caos: cori, sirene, grida, risate.
        Al tuo fianco non c'è <f>Chloe</f>, ma <f>Emma</f>.
        Sta leggendo qualcosa, e ti sorride quando ti svegli, un sorriso piccolo e triste.
        "<f>Chloe</f> se ne è andata stanotte, mi dispiace."
        Ti fa più male di quanto vorresti.
            + Ti alzi e ti appoggi a [lei]<f>lei</f>, hai bisogno di conforto.
            -
        <f>Lei</f> ti stringe forte, lasciandoti tutto il tempo del mondo.
        Quando ti stacchi, ti dice che il corteo sotto ti aspetta, ma tu hai altro per la testa.
            + ["Bunny, secondo te cosa sono?"]"<f>Bunny</f>, secondo te cosa sono?"
            -
        "In che senso?"
            + "Non mi sento una [ragazza."]<f>ragazza</f>. E nemmeno un <m>ragazzo</m>. O qualcosa nel mezzo. Più una cosa "altra", diversa. Ma ogni volta che ci penso mi manca l'aria, mi sento morire. E per colpa di questa cosa, <f>Chloe</f> se ne andrà."
            -
        "<f>Chloe</f>...", ma poi <f>Emma</f> cambia idea.
        Apre il suo specchietto da trucco, vi guardate assieme.
        "Ho sempre saputo che mi piacevano le <f>ragazze</f>, ma a casa questa cosa non esisteva. Sai quanto sono religiosi i miei."
        Trema un poco.
        "Ho capito che c'erano altre <f>ragazze</f> come me solo quando ho conosciuto te e <f>Chloe</f>."
        Sospira.
        "I miei potevano continuare a dire che certe cose non esistevano, ma ciò che sento e provo sono dati di fatto. Quando ho accettato questa cosa, mi sono vista davvero."
        Gira lo specchietto verso di te.
        "Solo tu puoi sapere chi sei. Fuori possono dire che non esisti, ma è un problema loro. Non è che perché <f>Chloe</f> è <f>lesbica</f> non ha pregiudizi, ma quelli sono problemi suoi. Tu sai chi sei, e hai il diritto di dirlo ad alta voce ogni volta che vuoi."
            + "Come fai ad essere così saggia?"
            -
        Ti guardi nel piccolo specchio.
        Ti sforzi di ignorare i segni del sonno e i capelli sfatti e pian piano il tuo volto emerge, lə tua vera te, e lə ami.#almost_there
            + [Sorridi a Bunny]
            -
    -> bullet_hell_buono