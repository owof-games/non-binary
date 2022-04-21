//VARIABILI

//Gender: se 1 = AFAB, se 2 = AMAB

VAR gender = 1

//Finali amab: se 1 = perdere, se 2 = sinceramente
VAR amab_tre = 1

VAR activate_shortcuts = 0


//FUNZIONI
    -> random
    === random ===
    ~ gender = RANDOM (1,2)
    //~ gender = 2
    
       {
        - gender == 1:
        -> intro_afab
        - gender == 2: 
        -> intro_amab
        }
    
    === bullet_hell_buono ===
    $character_creation$
    $bullet_hell_finale$
    -> END
    
=== swap_and_restart ===
xxx
{
    - gender == 1:
        ~ gender = 2
        -> intro_amab
    - gender == 2:
        ~ gender = 1
        -> intro_afab
}

=== restart ===
xxx
    {
    - gender == 1:
    -> intro_afab
    - gender == 2: 
    -> intro_amab
    }

  === outro === 

    {
    - gender == 1: -> outro_afab
    - gender == 2: -> outro_amab
     }   
    
    = outro_afab
     + [Vivi la vita di Pallino]
        -> intro_amab
        + [Rivivi la vita di Pallinə]
        -> intro_afab
        + [Voglio uscire]
        -> END
    = outro_amab
    + [Vivi la vita di Pallina]
        -> intro_afab
        + [Rivivi la vita di Pallinə]
        -> intro_amab
        + [Voglio uscire]
        -> END
    
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
        {
            - activate_shortcuts == 1: -> atto_amab_uno
        }
        “Appena <m>nato</m> e ha già la faccia da <m>furbetto</m>!”
        Papà è su di giri.
        La risata di mamma ti scuote dal dormiveglia.
        Fuori dal finestrino i tuoi occhietti vedono un mondo sfocato fatto di luci e contorni, sagome e bagliori. 
        È tutto nuovo, bellissimo. Senti di poter essere qualunque cosa.
            + [Fai un versetto]
            -
        Vuoi condividere la tua gioia, ma le voci sono alte e ti ignorano.
        “Secondo te avrà voglia di imparare il mestiere?”
        Papà svolta a destra.
        Mamma ti guarda.
        “Il mio o il tuo?”
        “Il mio! Dio, non voglio un <m>figlio</m> <f>estetista</f>!”
        Scendete dall’auto.
            + [Rigurgiti]
            -
        Non è che tu possa fare molto di più.
        Passi dalle braccia di mamma a quelle di nonna, zie e zii che ti corrono attorno.
        La tua cameretta è già piena: un lettino con coperte <m>azzurre</m>, <m>azzurre</m> le tendine, <m>azzurre</m> le pareti.
        <m>Azzurro</m> l'armadio, il tappeto, il pigiamino che ti mettono.
        Rosa le tue guance mentre fanno commenti sul tuo pisellino.
        Su una mensola una serie di peluches: un’<m>auto</m>, un <m>pompiere</m>, un orsacchiotto, un <m>bulldog</m>, un <m>pallone da calcio</m>.
        Tuo fratello ti mette il <m>pallone</m> tra le mani, se la ride.
        “Queste sono mani da <m>portiere</m>, guarda che aggancio!”
        Ti guarda pieno di ammirazione.
            + Tu volevi solo qualcosa a cui aggrapparti[], questa gente dice troppe cose e ti gira la testa.
            -
        Nonna chiede a tuo fratello se ti vuole tenere in braccio, lui dice che ha paura di romperti.
        “Guarda che con un bimbo in braccio fai strage di ragazzine!”
        “Mamma, ha solo dodici anni!”
        Camminano e parlano, tutti. Si dicono come sarà il tuo futuro, discutono, ridono, tracciano confini. 
        Le loro parole si posano sui tuoi occhi.
        Fuori, lungo la strada vedi sempre meno varietà, forme e colori si sfumano fino a quando non rimane che una distesa di <m>quadrati azzurri</m> e <f>triangoli rosa</f>. #people
        Tutto ti sembra uguale. 
            + [Piangi]
            -
        -> atto_amab_uno
    
    ===atto_amab_uno===
    Infanzia. Estate. Parcogiochi. #title
    
        “Perché sei un <m>maschio</m>!”
        {
            - activate_shortcuts == 1: -> bullet_hell_amab_uno
        }
        Il tono di chi dice qualcosa di ovvio.
            + “E quindi?”
            -
        “E quindi non puoi fare Ariel perché è una <f>prin-ci-pes-sa</f>. A noi ci serve un <m>principe</m>, sei qui solo per questo!”
        Marika ha le braccia strette al petto e ti guarda come se tu fossi la cosa più stupida al mondo.
        Le altre bimbe sono annoiate.
        Laura continua a sbuffare, Pallina lancia sassi alle lucertole.
        Il sole è caldo e il parco è pieno di grida festose.
            + “Si fa sempre come vuoi te!”
            + “Può farlo Pallina.”
            + [La guardi con aria di sfida]
            -
        “Sono la più grande quindi decido io e quindi tu sei il <m>Principe</m>.”
        Marika si allontana con le treccine che ballonzolano.
        Iniziano a chiacchierare, a pianificare.
        Ogni tanto ti fanno qualche domanda ma a te non va proprio di rispondere ora.
        Guardi il tuo zaino con i nuovi numeri di Ranma 1/2, e pensi che eri così felice di startene a leggere al sole.
            + [Ti siedi e le ignori].
            + Ti sforzi di seguire il discorso[], <>
            	ma hai perso qualcosa di importante, è comparso un drago, cosa c'entra un drago?
            + “Non avete fame?”[]. <>
            	Laura ti passa la sua merendina sorridendoti. È sempre così gentile con te.	
            -
        In fondo al parco tuo fratello Omar sta giocando con altri ragazzi.
        Anche se è molto più grande di te, cerca sempre di giocare assieme. È un bravo fratellone.
        "<m>Pal-lin-oooooooooooooo</m>!"
        Marika stridula ti chiama.
        “È ora di iniziare!”
            + [Ti avvicini controvoglia].
            -
        “Quindi Laura è la mia sorella piccola Pallina è la nostra mamma ma si è ammalata e ci serve la pozione ma ce l’ha il drago sotto la pancia e serve un eroe e stiamo chiamando...”
        “E chi fa il drago?” Pallina interrompe Marika.
        Le treccine tremano dal fastidio.
        “Quella siepe è il drago.”
        "Col cavolo! Il cespuglio è la mamma che tanto se è malata mica si muove, e io faccio il drago!"
        Le due iniziano a litigare, decidi che è il caso di fare qualcosa.
            + “Caricaaaa!”
            -
        Corri contro il drago che forse è la mamma, quando lo noti.
        Unico, rosso fuoco fuori e giallo dentro.
        Bellissimo, gigantesco.
        Marika ti urla qualcosa. #completion_33
            + [La ignori]
            + Le dici di venire[], <>
            	ma lei urla di correre contro il drago e non vuole che mamma muore e rimane orfana.
            + Annusi il fiore[], <>
            	ed è tipo la cosa più buona dell’universo, più buona anche delle torte di nonna.
            -
        “Qualcuno ha strappato tutti gli altri."
        Pallina è al tuo fianco. Ha ragione, ci sono boccioli ovunque tra l'erba.
            + “Non è giusto[."], è così strano e bello.”
            -
        Lei lo annusa.
        Vi girate: Marika se ne sta andando, Laura la insegue.
        “La prossima volta lo faccio io il principe!” La voce di Pallina è risoluta.
            + “La prossima volta mi nascondo."
            + “E Marika è il drago!”
            + “Promesso?”[] <>
            	E lei ti risponde sì, e se Marika rompe le scatole la butta nel fango.
            -
        E poi arriva una pallonata.
        Netta si infila tra voi due.
        Colpisce il fiore.
        La palla cade a terra e porta tutti i petali con sé.
        Pallina si gira, urla un “Cretino!” e corre contro a qualcuno, lasciandoti lì.
        Ti chini per raccogliere i petali.
        “Guardatela, la <f>femminuccia</f>.”
        Risate.
        Ti alzi, alle tue spalle qualche bambino.
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
        Tutte cose <f>da donna</f> secondo tuo fratello. Gli <m>uomini</m> devono sapere <m>fare a pugni</m>.
        “<f>Frocetto</f>!” ti manca l’aria.
        Lorenzo, ora lo riconosci, abbozza un pugno per finta sul tuo naso, provi a mollargliene uno vero.
        E Lorenzo inizia a volare.
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
        Gli racconti la storia del fiore.
        Omar ride, ti passa la manona tra i capelli.
        “Per un fiore, caz, capperi! Ti sei fatto menare per un fiore!” 
            + “Era l’ultimo!”
            ”Lo sai qual è la cosa bella dei fiori, Pal? È che ricrescono, a differenza della tua testolina che se te la rompi non ricresce più!”
            + “Non volevo mica farmi picchiare!”
            Omar sospira. Vedi che sta cercando le parole per dire qualcosa.
            -
        “<m>Pal</m>, non posso passare la vita a difenderti, lo sai vero?” #completion_70
        “Ma mica lo voglio!”
        “Però...” Omar guarda davanti a sé, tortura con le mani la cartaccia della merendina.
        “Secondo te perché ce l’hanno con te, <m>Pal</m>?”
        Che risposta si aspetta da te?
            + “Perché sono stupidi!”
            + “Perché non gioco con loro?”
            + [Resti in silenzio]
            -
        “Sei sempre da solo o con le </f>bambine</f> o con la </f>nonna</f>. Coi <m>bambini</m> non ci stai mai, e questo è <m>strano</m>.”
        Lancia la cartaccia nel cestino.
            + “Gioco con te.”
            -
        “Che sono tuo fratello, ed è diverso. E sono grande, e un giorno non ci sarò quando servirà e questi mi preoccupa.”
            + “Non voglio che ti preoccupi per me.”
            -
        Omar ti guarda negli occhi, serio.
        “Devi imparare come si sta al mondo, fratellino. Gioca coi tuoi <m>compagni</m>, <m>menali</m> quando ti offendono, e lascia stare le bambine. Tanto vedrai che tra un paio d’anni non vorranno più giocare con te.”
        Ti sorride.
            + “Perché?”
            -
        “Perché vorranno fare <f>cose da ragazze</f>, e i ragazzi <m>cose da ragazzi</m>. Così va la vita.”
        Forse la vita è stupida.
            + “Tu sarai per sempre mio amico?”
            -
        “Sempre, <m>Pal</m>.”
        Ti strofina una nocca sulla testa.
        “Ma ora devo andare dalla morosa. Un’altra cosa che un giorno capirai.”
        Lo osservi allontanarsi.
        Prendi lo zaino e ti avvii verso casa.
        La luce è bassa, le rondini corrono nel cielo.
            + [Canticchi qualcosa]
            -
        Ti rendi conto che i pantaloni sono rotti, mamma si incazzerà a manetta.
        Ma poi, grida dall’altra parte della strada.
        Sono tutti lì in fila, i ragazzi di prima.
        Noti che Lorenzo ha un occhio gonfio, speri sia merito tuo.
        Ti stanno urlando contro.
        Che sei una <f>femminuccia</f>, che non sei un <m>ragazzino</m>.
        Che ti è caduto il <m>pisellino</m>, te l’ha mangiato il cane vero?
        Che coi capelli lunghi <f>sembri una ragazza</f>.
        Vorresti che Omar fosse con te, ma sei solo.
        Solo.
        Che cosa sei, <m>Pallino</m>?
        Cosa sei?
        Che razza di bambino sei? #almost_there
        -> bullet_hell_amab_uno
    
    === bullet_hell_amab_uno ===
        $bullet_hell_amab_uno$
    -> atto_amab_due
    
    === atto_amab_due ===
    Adolescenza. Inverno. Da nonna. #title
  
        Casa di nonna è come un cumulo di foglie, strati su strati di oggetti.
        {
            - activate_shortcuts == 1: -> Bullet_hell_amab_due
        }
        Il salotto è invaso da quarant’anni di riviste di <f>moda</f>, <f>cucito</f>, <f>maglia</f>.
            + [Prendi una copia di Burda]
            -
        “Siamo qui per gettarla via ‘sta roba.”
        Omar entra con in mano una marea di scatoloni.
        Laura arriva da dietro e ti abbraccia.
        “Tutto ok tesoro?”
            + Fai sì con la testa[] e appoggi la rivista.
            + Lanci la rivista contro Omar[], che si scansa e ti dà della schiappa.
            + “Mi ha insegnato a cucire[.“] <>
            di nascosto da mamma, da quando avevo dieci anni. Passavo qui le ore a leggere e a disegnare le decorazioni che poi lei faceva a maglia. Quando faceva freddo stavamo davanti alla TV a guardare documentari sui dinosauri e macinavamo chilometri di lana.”
                ++ [Era bello]
            -
        
        “Non è mica morta”. Omar prende le altre riviste e le inscatola.
        “L’avete chiusa in una casa di riposo, è la stessa cosa.”
        “<m>Pal</m>, è per il suo bene.”
        Certo.
            + "Lei non ci voleva andare"[].
            -
        “Perché non avete accettato la nostra proposta?” Laura ha le mani sui fianchi e fissa Omar.
        Non vanno molto d’accordo. Quando vi siete messi assieme Omar era contento (“Quindi non sei frocio!”), ma Laura è convinta che abbia una pessima influenza su di te.
        “<f>Due ragazzine</f> di quindici anni a stare dietro a una vecchia rincoglionita?”
        Laura fa per dire qualcosa ma la interrompi.
            + “È tua nonna, cazzo!”
            + “Almeno sarebbe stata felice.”
            + “Così mamma può vendere la casa[."] e farci i soldi.”
                “I soldi servono per pagare la casa di riposo, idiota.”
            -
        
        Continuate a inscatolare in silenzio, l’unico rumore è lo spostarsi degli oggetti.
        Omar impila le cose con rabbia, chiude gli scatoloni, scende le scale pestando i piedi, torna, ripete.
        Laura ti passa le cose, quando i vostri sguardi si incrociano ti sorride, ogni tanto ti dà un bacio sulla guancia. #completion_33
            + Nonna adora Laura[].
            -
        È sempre stata dell’idea che se una regola è sbagliata è tuo dovere infrangerla.
        Dopo la morte di nonno non ha mai indossato il lutto, era contenta che quel violento fosse morto e non voleva fingere il contrario.
        Quando ha iniziato ad andare a caccia qualche uomo l’ha presa in giro, qualcuno ha provato ad avvicinarsi troppo.
        “Fanno tanto i grossi, ma se gli spari vicino ai piedi vedi come scappano.”
        E Laura è un po’ come lei. #completion_50
        “A che pensi?”
        
            + “Ci vuole coraggio[..."] a rompere le regole.”
            <> Vorrei essere come lei.”
            + “Vi somigliate tanto, voi due.[”]
            <> Le sue reti erano di lana e le tue di bit, ma avete tanto in comune.” Laura ride: "Woah, non sapevo fossi un poeta!"
            + “Mamma non l’ha mai capita[“]
            <>, per lei l’importante è quello che pensano gli altri e basta.”
            -
        
        “Sai che ti vuole un sacco bene, vero? Si vede nei suoi occhi ogni volta che ti guarda.”
        Laura ti sorride, passandoti un vestito.
        Ci metti un attimo a riconoscerlo.
            + [Osservi meglio la fantasia]
            -
        Fiori di ibisco.
        Un <f>vestito lungo</f> che ti aveva fatto due anni fa.
        Hai litigato con lei per quel <f>vestito</f>.
        Hai urlato per nascondere la paura, paura di quanto lei avesse visto in te. 
        Paura del <f>piacere</f> che hai provato all’idea di indossarlo, di restare con lei lì con quel <f>lungo vestito</f> estivo a cucire e parlare, con la sicurezza che nessuna pallonata ti avrebbe distrutto.
        Laura ti guarda con tenerezza. 
            + [Condividi quel ricordo]
            -> ricordo
            + [Infili il vestito nello scatolone]
            -> scatolone
            + [Parli del meteo]
            Laura ti bacia sulla guancia. "Dio, siamo già come quelle vecchie coppie che non hanno più nulla da dirsi?"
            -> scatolone
        
        = ricordo
            Man mano che parli senti sparire un peso a cui avevi fatto l'abitudine fino a dimenticartene.
            Fuori l’autunno sembra caldo, ma il volto di Laura si fa freddo.
            La sua mano stretta nella tua sembra un pugno. 
                + “Son cose dell’infanzia...”[]  <>
                -
            provi a dire, anche se due anni fa ne avevi tredici di anni.
            “Non, non ti giudico <m>Pal</m>, davvero. vorrei solo capire...”
            “Anche io.” #completion_70
            Omar è sulla soglia.
            “Sei <f>gay</f>, <m>Pallino</m>? Anche se sei con Laura non vuol dire che tu sia <m>normale</m>.”
            “No!”
            Laura prende le tue difese, pur tentennando.
            “Omar, perché devi essere grezzo come la merda?”
            “Dico solo quello che penso.”
            Tuo fratello ti si avvicina.
            “Sai perché mamma non ti vuole con nonna? Perché ha passato il tempo ad assecondare le tue <m>stranezze</m>.”
            Ha i pugni stretti.
                + “Non sono stranezze!”
                -
            “Di certo non sono cose <m>normali</m>. Io, <m>Pal</m>, Cristo, ti voglio bene, davvero.”
            Omar sta guardando il pavimento. Non ti ha mai detto una cosa del genere.
            “Voglio, vogliamo solo vederti felice. Invece tu vuoi solo essere strano."
            Sospira.
            "Cristo, mamma è convinta che Laura sia una fase prima che tu ci dica di essere <m>gay</m>. Con te il mondo va al contrario.”
            Non sai capire come ti senti. Cosa provi ora? Cosa ha senso fare?
                + [Pensi a nonna, alla sua forza]
                    “Amo Laura, e non serve che siate tu o mamma a dirmi cosa fare o non fare!”
                    -> litigio
                + [Guardi tuo fratello, il tuo eroe]
                    Ti ha detto “Ti voglio bene.”
                    -> accomodante
                + [La stanchezza ti macina le ossa]
                    Li lasci lì e te ne vai.
                    -> litigio
            
            = litigio
                Tuo fratello alza la voce, ti urla dietro.
                Laura inizia a litigare con lui.
                Fanno una lista delle cose che fanno di te un </m>uomo</m> e delle cose che fai <f>da donna</f>.
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
                Prendi il <f>vestito</f> dalle mani di Laura, e lo metti nello scatolone.
                Omar propone di fare una pausa per una birra.
                Laura ti guarda negli occhi, fa per dire qualcosa, ma poi si allontana.
                Il vestito ti osserva dallo scatolone e silenzioso ti accusa:
                “Cosa sei, <m>Pallino</m>? <m>Un ragazzo</m>? Una <f>ragazza</f>? Cosa sei?” #almost_there
                -> Bullet_hell_amab_due
    
        
        = scatolone
            Omar si presenta sulla soglia con tre birre in mano, un gesto di pace.
            “Hai smesso di tenerci il muso?” gli chiede Laura, stappando la bottiglia.
            “Non vi tengo il muso, ma mi girano che mio fratello mi tratta come un mostro. Voglio bene anche io a nonna, davvero.”
            Vi volta le spalle, il tono della voce è più tremulo.
            “Non voglio svegliarmi ogni mattina con il timore che non risponda al telefono e sia morta in casa.”
                + [Appoggi una mano sulla spalla di Omar]
                + [Guardi Laura, che ti prende la mano]
                + [Osservi i tuoi piedi]
            “Non sei un mostro, non volevo ferirti.”
            -
            Glielo dici col cuore, speri che lo capisca davvero.
            Omar si rigira tra le dita il tappo della bottiglia. #completion_70
            “C’è stato un momento nella nostra vita in cui qualcuno ha deciso che dovevo essere quello <m>forte</m> e <m>pratico</m>, forse perché tu fratellino...” ti guarda.
            Quasi trema.
            “Sei sempre stato in un mondo tutto tuo. Ti lamenti di mamma, ma alla fine non fa altro che preoccuparsi per te.”
                + “Non mi serve la sua preoccupazione."
                + “E non vede te."
                +  [Resti in silenzio]
            -
            “So di essere un grezzone e di non essere bravo come voi con le parole. Ma tengo a nonna, e voglio che sia felice. E tengo a te, e voglio che tu sia felice. Ma non so come farlo.”
                + [Senti solo senso di colpa.] Gli occhi lucidi di Omar ti riempiono di senso di colpa.
                -> colpa
                + “Non pretendo tu sia perfetto[“], solo che tu mi permetta di essere me stesso."
                -> myself
                + [Omar ha bisogno di te]
                Metti da parte parole e spiegazioni e lo abbracci.
                -> colpa
        
            = myself
                “E che vuol dire Pal? Che cosa sei?”
                Ti guardi le mani, sperando che qualcuno ci abbia scritto le parole per dirlo, ma non trovi che lo sporco della casa e degli scatoloni.
                “Omar, lascialo in pace.”
                Laura cerca di difenderti, ma tuo fratello  la ignora.
                “È quello che voglio ma devo anche capire che vuol dire, no, lasciarlo in pace?"
                Omar ti si avvicina.
                "Cosa sei <m>Pallino</m>? Perché io mica lo capisco. Stai con Laura e mi dico che <m>sei un uomo</m>, ti piacciono però le cose da <f>frocio</f> e quante volte nonna ti ha riempito di <f>maglie coi brillantini</f> che manco mamma avrebbe messo? Cosa sei <m>Pallino</m>, dimmelo ti prego, così posso aiutarti.”
                E tu vorresti davvero dare una risposta, trovare una soluzione ma non lo sai <m>Pallino</m> cosa sei?
                Cosa sei <m>Pallino</m>? #almost_there
                -> Bullet_hell_amab_due
        
            = colpa
                “Vai bene così, fratellone, davvero. Non potrei chiedere di meglio.”
                Sorridi mentre glielo dici e lui risponde al sorriso per poi darti un pugno chiamandoti <m>ricchione</m>, e riprende a inscatolare roba, a raccontare anedotti sull'ultima serata fatta coi ragazzi.
                Laura ti guarda e c’è qualcosa di amaro nel suo sguardo.
                “Non puoi fare felici tutti, Pal. A forza di farlo finirai per sparire.”
                    + “E che dovrei fare?”
                    -
                “Dire la tua verità, quella che sia.”
                    + “Su cosa?”
                    -
                Laura alza le spalle, ma gli occhi sono lì tesi ad aspettarsi una risposta.
                L’unica cosa che fai è allontanarti.
                Vai in camera di nonna.
                La finestra è socchiusa, la sua vestaglia stesa sul tavolino accanto a sigarette e medicine.
                A una foto di te, lei e Omar tanti anni fa, quando tutto sembrava semplice, quando nessuno pretendeva da te risposte.
                Ma è impossibile tornare a quel momento, perché gli occhi di Laura te lo stanno chiedendo ancora.
                Cosa sei <m>Pallino</m>? Cosa sei? #almost_there
                -> Bullet_hell_amab_due
        
        
        === Bullet_hell_amab_due ===
            $bullet_hell_amab_due$
        -> atto_amab_tre
        
    === atto_amab_tre===
    Età adulta. Autunno. Casa vostra. #title

        Laura ti ripete di sbrigarti
            + “Ma mancano almeno sei ore!”
            -
        {
            - activate_shortcuts == 1: -> bullet_hell_amab_tre
        }
        “E non bastano! Porta qualcosa da sgranocchiare.”
        Ravani tra i mobili della vostra cucina, recuperi cioccolata e burro d’arachidi.
        Non hai voglia di andare a quella stupida festa stasera.
            + “Ma se rimanessimo a casa[?"] a guardare horror e mangiare schifezze?”
            + [Tu detesti Marika!]“Ti ho già detto che odio Marika?”
            + “Ma da quando ti piace Halloween?”
            -
        Sali le scale senza che Laura ti risponda. L’unica luce è quella dello studiolo.
        Continua a stupirti questa casa, questa vita. Le cose che avete fatto assieme.
        Fai per entrare ma lei si fionda sulla soglia, ti cinge il collo con le braccia.
        “Promettimi che per una volta, una sola volta mi dirai di sì senza fare domande.”
            + ["Ci sono dei labrador?"]“Solo se ci sono dei labrador in quella stanza”.
            “C’è qualcosa di meglio dei labrador!” risponde. “Impossibile, niente è meglio dei labrador!”
            + [Le ricordi il matrimonio]“L’ultima volta che ho accettato ci siamo sposati, e devo ancora capire se sia stata una buona idea.”
            Laura ti dà un pugnetto in testa ridendo.
            + [Senti odore di trappola] Lei riconosce la tua espressione.
            “Quando mai ho fatto qualcosa che ti ha messo nei guai?”. Fai una lista abbastanza dettagliata che contiene cioccolata, leoni marini, un costume da Elon Musk e una ghigliottina. Ah, sì, e quella volta al cimitero con la tavola Oujia. Lei ti osserva con le braccia incrociate, fintamente seria.
            -
        Ti porta nella stanza.
        Ci sono pezzi di jeans, trucchi, un capello osceno e una parrucca.
            + “Dov'è il cadavere di RuPaul?”
            -
        Ti guarda, gli occhi pieni di affetto.
        "Ogni tanto penso a quel ragazzino timido e insicuro che ho conosciuto vent'anni fa, e mi stupisce vedere chi sei diventato."
        Non sai cosa rispondere, anche se è vero: ad un certo punto, inaspettatamente, l'età adulta ti ha regalato una sicurezza che non avresti mai immaginato di poter avere.
        Laura cambia discorso. #completion_33
        “Ti ricordi che l’anno scorso Marika ha detto che siamo gli unici a non fare costumi di coppia?”
            + “Ed è un problema?”
            + “È difficile dimenticarlo[!"], visto che l’ha urlato ubriaca dal balcone.”
            + “Mi ricordi perché è tua amica?”
            Ti lancia addosso un marshmallow.
            -
        “Quest’anno voglio dimostrarle che si sbaglia. E mi sono chiesta: qual è la coppia più spaventosa da portare ad una festa di Halloween?”
        Cerchi inutilmente una risposta sensata.
        Laura ti guarda con trepidazione.
            + “Bonnie e Clyde?”
            + “Woody Allen e Soon-Yi?”
            + “I miei?"
            -
        Laura solleva i pezzi di jeans.
        “Britney e Justin nel 2001! Dai, cosa c’è di più cringe del finto denim e di Timberlake?”
        Afferra i pezzi di tessuto con stampa denim.
        “Ho trovato due costumi ma non mi piacevano molto e così li ho smontati per rifarli meglio ma ehm, creo videogiochi, non sono una sarta. E ho pensato che potresti aiutarci tu, e in cambio ti trucco!”
            + “Non cucio da quando avevo tredici anni!”
            “Sono sicura che sia come andare in bicicletta.”
            + “Trucco?”
            + “Possiamo vestirci da noi?”
            Laura ti ignora.
            -
        “E, sorpresa delle sorprese... io farò Justin e tu <f>Britney</f>!”
        Fai per dire qualcosa, ma.
        Ma qualcosa si muove nella pancia, un calore che si alimenta mentre osservi il tessuto di jeans, la </m>parrucca</m>, i <f>trucchi</f>. #completion_50
        Ti siedi in silenzio davanti alla macchina da cucire e, beh: è come tornare in bicicletta.
            + Inizi a cucire[] i pezzi di stoffa.
            -
        È un saltellare di ricordi questo pomeriggio, passate da una cosa all’altra.
        Citare la starlet scomparsa di turno vi fa parlare di cosa stavate facendo quell’anno, un brano riporta un’amicizia rotta, una nottata ubriachi al mare.
        “Non vi siete più sentiti?”
        Sai che parla di Omar.
        Non vi parlate da due anni ormai, ma ogni tanto Laura te lo richiede.
            + “No."
            A un certo punto, non hai più sopportato le sue insinuazioni.
            -
        Il tessuto scorre veloce sotto la macchina.
        Laura prova il vestito: conciata da Justin è ridicolmente uno schianto.
        “E ora siediti, è il mio turno!”
        La sua mano leggera mescola, traccia, spennella la tua faccia.
        Ogni volta che si allontana sorride soddisfatta.
            + “Da quando l'avevi progettato?”
            -
        “Quando ho avuto l’idea mi sono accorta che in realtà era lì da sempre. Che era qualcosa che volevo fare con te, che potevo fare solo con te.”
        Ti bacia sulla nuca, ti afferra la mano per farti alzare, ti porta allo specchio.
        Il <f>vestito</f> è orribile, la <f>parrucca</f> è tremenda.
        Ma i tuoi occhi si riempiono di ciò che vedono, del volto ridisegnato dal trucco, della vita tracciata dalla cintura, del petto peloso che esce dalla <m>scollatura</m>. 
        Ti gira la testa.
            + “Dovrei rasarmi?”
            -
        Lo mormori.
        “Solo se non ti piaci così.”
        Laura stringe la tua mano.
        Ti guardi, e così ti piaci tantissimo.
        Hai paura, ti manca l’aria, eppure hai la certezza che per la prima volta ti stai vedendo veramente.
        È come se qualcuno avesse tolto una patina dai tuoi occhi.
        Come se fino ad ora il corpo che vedevi allo specchio fosse quello di un’altra persona, qualcosa che continuavi a cancellare, che non volevi mai ricordare.
        Ma ora sei davvero tu.
        Ammiri i tuoi occhi enormi sotto l’eyeliner, e il modo in cui le labbra esplodano di rosso tra i peli della barba.
        Come i muscoli e le pieghe del vestito si esaltino a vicenda.
            + [...]
            -
        ...
            + [...]
            -
        ... ...
        
            + [...]
            -
        ... ... ...
        Piangi. #completion_70
        Laura ti abbraccia.
        “Tutto ok, tesoro?”
            + Respingi tutto quello che provi[], perché non può esserci spazio per questo. La sincerità la allontanerà come ha allontanato Omar.
            -> Respingi
            + Non puoi dirle la verità[], non puoi. Laura è magnifica, ma lo era anche Omar, e dov'è ora?
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
            Omar che non ti ritiene un <m>vero uomo</m>.
            La vicina che scherzando vi chiama “<f>lesbiche</f>”.
            Tua madre che ti dice che somigli troppo a <f>nonna</f>.
            Tuo padre che continua a regalarti <m>biglietti per lo stadio</m>.
            I giudizi, le cose dette e non dette.
            Ti guardi allo specchio e sembri una cosa a metà, una <m>cosa sbagliata</m>.
            Un bau bau, un abominio.
            Te lo chiedi però.
            Cosa sono?
            Cosa sei <m>Pallino</m>?
            Cosa diavolo fottutamente sei? #almost_there
            -> bullet_hell_amab_tre_bis
        
        = Perdere
        ~  amab_tre = 1
        
            Lei ti fa sedere vicino a sé, il suo odore morbido che ti riempie.
            Ti guarda, e leggi nei suoi occhi la preoccupazione.
            “Mi spiace, tesoro”, ti dice.
                + “Per cosa?”
                -
            “È stata, è stata una specie di trappola. Ne ero consapevole, anche se ho fatto finta di no."
            Prende fiato.
            "Ti conosco da così tanti anni, e tante cose si vedono. Una relazione alla fine ti mostra sempre tutto ciò che sta tra le pieghe, no? È quella la cosa bella e spaventosa. Notare cose che magari l’altra persona non vuole vedere.”
                + “Io vorrei vederle.”
                + “Non so dove guardare.”
                + "Ho paura delle conseguenze."
                -
            “Hai provato a rispondere alla domanda più semplice?”
            Provi a guardarla negli occhi.
            “<m>Sei un ragazzo, <m>Pal</m>?”
            Ti guardi le mani.
            La tensione delle ultime ore è troppa, la voce di Laura sparisce, sommersa da tutti i commenti della tua vita.
            Da Omar che ti chiede se sei </m>frocio</m>, dai compagni di scuola che ti chiamano <f>femminuccia</f>.
            Dal prof di ginnastica che ti diceva che sei <f>troppo delicato</f>, da quella di letteratura che esaltava la tua <f>sensibilità femminile</f>.
            Quel tizio sul bus e "perché hai le <f>unghie così curate</f>?"
            Il tuo collega che dice che sei </m>grezzo come un muratore</m> ma hai il <f>faccino da bambola</f>.
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
        Riapri gli occhi e sei tra le braccia di Laura.
        Ha gli occhi rigati dalle lacrime.
        Fuori fuochi e rumori di festa, bimbi che gridano.
        E lì, in fondo a tutto, col corpo e la testa svuotati, hai la risposta.
            + “Non sono un [ragazzo.”]<>
            -
            <m>ragazzo</m>. né una <f>ragazza</f>. O qualcosa a metà, ma più qualcosa d’altro. Come se continuassero a chiedermi se questa cosa è verde o gialla quando è viola, e non sapevo nemmeno che esistesse il viola.”
            Laura ti guarda confusa.
            + “Te ne andrai?”
        -
        Ti tira un pugno sulla spalla, seria.
        “Idiota, no, mai. Ti amo.”
        Rimanete in silenzio per un attimo, poi ti passa della birra.
        “È una cosa che faremo assieme questa cosa del trovare il viola, ok? Non sei solo, sola, quel che è. Cazzo. Ci sono. Ti amo. Dirò delle cazzate e per questo ti chiedo già scusa ma insomma.”
        La zittisci con un bacio.
            + “Andiamo a mostrare questә me al mondo?”
            + “Sai che rabbia proverà Marika[?"] quando non sarà la prima in qualcosa per una volta?”
            + “Vieni[!"], prima che divenga la Britney del 2007!”
            -
        "Ho un piano B: una festa di ragazze <f>lesbiche</f>, un posto tranquillo dove stare, dovrebbero esserci anche un paio di vecchie compagne di scuola!"
        Il modo in cui ti guarda ti fa sentire invincibile.
        Scendete assieme in strada, le dita intrecciate.
        Sei pienә di vita. #almost_there
        -> bullet_hell_buono
    
    === finale_amab_due ===
        Quando apri gli occhi, Laura è accovacciata davanti a te, gli occhi fissi nei tuoi.
        “Ehi, dolcezza!”
            + [Appoggi la fronte alla sua]
            -
        “Cos’è successo in quella testolina?”
        Prendi un respiro.
            + “Avevi già capito?”
            -
        “Mi ero accorta da tempo che c’è qualcosa che ti gira dentro da un po’. Mi sono chiesta cosa sarebbe successo se non fosse mai uscita quella cosa, e ogni risposta non mi piaceva, per nulla.”
        Si siede accanto a te, lasci che ti stringa.
        “So cosa non sono, Laura. Non mi sento un <m>uomo</m>, ma nemmeno una <f>donna</f>. È come se mi venisse chiesto di scegliere solo tra mangiare una mela o una pera, quando la mia bocca è piena del gusto di ogni frutto di bosco.”
        “Le mele sono noiose!” scherza Laura.
            + “Non cotte[."] con lo zucchero e la cannella.”
            -
        “Questa metafora sta diventando creepy,” ti bacia, “ma credo di aver capito.”
        “E a te va bene?”
        “Almeno ora quando la vicina fascia ci chiama “<f>lesbiche</f>” posso dirle che è vero!”
        Si gira di colpo.
        “Ma non è vero, vero? Oh mamma, cosa devo dire ora? Ma quindi non sono più <f>etero</f>?”
        Le afferri le mani.
            + ["Abbiamo tempo."]“Direi che abbiamo tutto il tempo del mondo per trovare queste risposte, non serve per forza farlo stasera, no?”
            -
        Lei si rilassa, sorride.
        “Hai ragione. L’importante è solo una cosa: le troveremo assieme. Ritroveremo i frutti di bosco e la mia eterosessualità o qualsiasi cosa sia.”
            + “Te la immagini Marika[?"] che non sa più come presentarci ai suoi amici?”
            -
        “A proposito di Marika: te la senti di andare a quella festa?”
        Ti guardi allo specchio.
        I pianti e le tensioni hanno incasinato <f>parrucca</f> e <m>trucco</m>.
        Ti senti bellә come non è mai successo in tutta la tua vita, ma l'idea di farti vedere dai tuoi amici così, ti spaventa.
            + [Fai di no con la testa]
            -
        Laura ti sorride.
        "Ho un piano B: una festa di ragazze lesbiche, un posto tranquillo dove stare, dovrebbero esserci anche un paio di vecchie compagne di scuola."
        Un po' di paura rimane.
        Ma senti di esser rimastә troppo a lungo nascostә, hai voglia di uscire, di mostrarti.
        Le afferri la mano e, facendoti coraggio, vi incamminate assieme lungo la strada. #almost_there
        -> bullet_hell_buono



//STORIA PALLINA
    === intro_afab ===
   ~ gender = 1
        “Non serve, davvero.”
        La voce di mamma ti sveglia. Sta parlando con nonna, sembra infastidita.
        Sei appena nata, ma le tensioni le senti tutte.
            + [Gridi]
            -
        È l’unica cosa che sai fare se qualcosa ti dà fastidio.
        “Ha fame!” dice nonna, le mani strette sul volante.  #street
        “Le do da mangiare a casa sennò ora vomita, tanto manca poco.”
        Nonna sbuffa, mamma pure.
            + [Sbadigli].
            -
        I tuoi occhi si sforzano di guardare fuori dal finestrino. 
        Mezzi ciechi riconoscono giusto aloni, figure, contorni che sembrano poter essere qualsiasi cosa.
        Come te.
        La macchina si ferma.
        “Vuoi che?”
        “No”, mamma interrompe nonna, “abbiamo già tutto. Grazie per il passaggio.”
        “È il minimo per <f> mia nipote</f>.”
        Silenzio.
        La macchina si allontana.
        Mamma apre casa, c’è odore di chiuso e cibo andato a male.
        “Benvenuta, <f>Pallina</f>.”
        Il tono della sua voce è pieno di orgoglio.
            + [Ti ciucci il dito]
            -
        Lei sorride e ti mostra il bilocale.
        “Lo so che è piccolo, ma siamo solo noi, tesoro. Due <f>donne</f> contro il mondo!”, ride.
        “Ok, una e mezzo per ora. Però qui”, ti mostra un angolo della camera, “c’è il tuo lettino, qui i peluches e poi guarda questa giostrina!” e fa girare un gruppo di animaletti <f>rosa</f> impiccati.
        C'è una volpe senza coda.
            + Provi ad afferrarla[], sperando di salvarla.
            -
        Mamma sorride e ti allontana, e tu protesti coi pugnetti.
        “Hai fame?” chiede, e si accascia sul divano.
        Ti porta al seno.
        “Sai una cosa? Sarai la più brava della scuola, così mi renderai orgogliosa. E ti prenderò un sacco di <f>vestiti a fiori</f>, perché da piccola li volevo anche io, a tutte piacciono i <f>vestiti a fiori</f>.”
        Ti cambia posizione.
        “E poi diventerai una <f>dottoressa</f>, sì, hai le mani da <f>dottoressa</f>. Magari <f>ostetrica</f>, così farai felice tante altre <f>mamme</f>. Anche se io sarò la tua, sempre.”
        Sospira.
            + [Il sonno  ti afferra]
            -
        “E magari quando ti sposerai con un brav’<m>uomo</m> mi farai vivere con voi, così ti aiuterò coi nipotini, e tu potrai continuare a lavorare. E se sarò ancora <f>bella</f>...”
        Ma stai già dormendo.
        Nel sogno vedi la strada di prima, il viaggio che hai fatto.
        Ma non ci sono più colori e forme e tutte le cose possibili.
        Ci sono solo <m>quadratini azzurri</m>
        <f>triangoli rosa</f>
        e mani enormi che ti schiacciano e strappano, cercando di darti una forma. #people
        -> atto_afab_uno
    
    === atto_afab_uno ===
    Infanzia. Primavera. Scuola. #title
        
        Coi piedi batti un ritmo immaginario sul pavimento.
        “<f>Pallina</f>, stai ferma!”
        Mamma sorride ma è una statua, vuole che tu sia una statua.
        Una bella statuina col <f>vestito a fiori</f>, le <f>scarpe bianche</f> e i <f>capelli raccolti</f>.
        Ha passato tutto il viaggio in auto a dirti che dovete fare una buona impressione.
        Che l'incontro genitori/insegnanti è un momento in cui i genitori vengono giudicati severamente.
        Che un genitore solo è sempre colpevole, e per questo non dovete fare nessun errore.
        Pensi che non abbia molto senso, ma ti fidi di lei.
            + [Guardi fuori]
            -
        Ti fidi, ma questo non cancella la noia.
        Dei ragazzi si rincorrono.
        Quello sbruffone di Lorenzo ha portato un pallone, stanno facendo le squadre.
            + “Mamma?”
            -
        Ti ignora.
        Dall’altro lato del giardino le tue compagne di classe chiacchierano.
        Riconosci Laura, Marika, Chloe e una di quarta, Emma.
            + “Posso andare in bagno?”
            -
        “Ci sei stata due secondi fa, tesoro.”
        Sospira e ti prende una mano.
        Il profumo di mamma è così forte che ti fa venire il mal di testa.
        “Se fai la brava poi ti prendo un gelato, ok?”
        Ti passa un libro di Geronimo Stilton, che sfogli controvoglia. #completion_33
        “Goool!” qualcuno urla da fuori.
        Il vocione di suor Addolorata spegne le grida dei tuoi compagni.
        Loro fanno promesse, rotte nel momento stesso in cui la finestra viene richiusa.
        La suora si affaccia da una porticina, chiama tua madre.
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
                Lorenzo ti guarda infastidito, ma Pallino ti raggiunge sorridente.
                “Vuoi prendere il mio posto?”
                Non aspetta una risposta, ti passa il <m>pallone</m> e corre dalle ragazze.
                Uno della quinta ti batte il cinque.
                Senti i risolini idioti di Marika e Chloe.
                “Sei quella dei rigori, vero?”
                    + Fai sì con la testa[], nascondendo a fatica l’orgoglio.
                    -
                “Tutta fortuna”, commenta Lorenzo.
                “Proviamo!” dice quello di quinta.
                “Stai in squadra con me, ok? Marca Lorenzo, così lo facciamo innervosire.”
                Sei una scheggia.
                Le tue gambette hanno accumulato così tanta energia mentre aspettavi sulla sedia, che ora corri come una molla.
                Ci metti due minuti a segnare.
                Lorenzo chiama un rigore inesistente.
                    + "Chiudi quella bocca da rana!"
                    -
                Un gol ancora, poi un assist al ragazzo di quinta.
                Ti sembra di volare.
                Pallino e Laura fanno il tifo per te. #completion_50
                Sorridi, rubi la palla a Lorenzo che ti sbatte a terra.
                Il ragazzo di quinta dice qualcosa ma lo ignori.
                    + [Tiri un pugno a Lorenzo]
                    -
                È il caos.
                I ragazzini prendono in giro Lorenzo perché si è fatto <m>picchiare da una bambina</m>.
                Senti Chloe alle tue spalle chiamare suor Addolorata.
                Guardi Lorenzo che trattiene a fatica le lacrime.
                Una mano ti afferra la spalla, ti investe un profumo dolcissimo. 
                    + [Sbuffi]
                    -
                Come un palloncino che si sgonfia, hai smesso di volare. #completion_70
                La mano è quella di mamma, la sua voce urla che il vestito è strappato, il <f>vestito buono</f> e Cristo, no! Le scarpe bianche sono lerce!
                Suor Addolorata se la prende col ragazzino di quinta, che urla contro di lei.
                Marika ti indica e ride.
                “<f>Non è una cosa da bambine</f>!”
                Quanto è noiosa Marika!
                    + [Le fai la linguaccia]
                    -
                Mamma ti tira una sberla.
                Ti senti al centro di un palco, e tutti urlano il tuo nome.
                Vorresti scendere, ma tutti ti chiedono: cosa sei <f>Pallina</f>, cosa sei?
                Perché ti comporti <m>come un bambino</m>?
                Perché <f>non ti vesti a dovere</f>?
                Perché usi le <m>parolacce</m> e <m>picchi</m>?
                Perché sei <m>brava a calcio</m>?
                Cosa sei <f>Pallina</f>, cosa sei? #almost_there
                ->bullet_hell_uno_afab
                
            = compagne
                Non esattamente la tua prima scelta ma quella più sensata: niente pallone uguale niente pasticci uguale niente sgridate di mamma.
                “Belle scarpe!” commenta Marika.
                Ti guardi i piedi.
                Ti stanno strette, le hai messe solo per la comunione di tuo cugino.
                    + “Di cosa parlate?”
                    -
                La risposta è così noiosa che il tuo cervello la ignora.
                Guardi il pallone correre da una parte all’altra.
                Lorenzo che fa il gradasso con Pallino.
                “Perché i maschi sono così idioti?”
                È Chloe a parlarti.
                    + “Almeno si divertono.”
                    -
                “Anche noi. Stiamo giocando alle <f>principesse</f>, ce ne manca una.”
                Ti guarda speranzosa.
                    + [Ignori il sottotesto]
                    -
                “Vieni?”
                Non ne hai voglia, ma hai un’idea.
                    + “Ti va una sfida?["] Se vinci, gioco alle <f>principesse</f> fino a fine della scuola.”
                    -
                Lo sguardo di Chloe è dubbioso.
                Alle sue spalle sono arrivate le altre. #completion_50
                    + “Su quell’albero[..."]”, indichi un vecchio olmo dai rami bassi “c’è il registro di suor Addolorata. Se lo prendi prima di me, hai vinto.”
                    -
                “Sei stata tu quindi a rubarlo?” Laura è sorpresa.
                Ti senti orgogliosa.
                Niente registro, niente prova delle decine di note che hai preso.
                E di quelle di molti compagni di classe.
                “Che <m>maschiaccio</m>!” Marika solleva il naso a punta. 
                “Ma Chloe è una secchiona, poi lo porta sicuro alle suore!”
                Laura non è convinta.
                “Non sono secchiona!”
                    + [Osservi Chloe]
                    -
                Si avvicina all’albero, appoggia la mano e guarda verso l’alto.
                “E se perdo?”
                    + [Sai cosa vuoi.]“Tu e Marika la smettete di farmi fare la <f>principessa</f> ogni giorno, e mi lasciate fare il <m>cacciatore</m>, o il <m>drago</m>.”
                    -
                Non ti aspetta, e inizia a salire.
                Ti tuffi sul ramo più basso.
                È più veloce di quanto pensassi.
                Furba, fa in modo di occupare i rami più stretti, così che tu non possa superarla.
                Ci sono persone che fanno il tifo.
                I ragazzi urlano il tuo nome.
                    + [Salti su un ramo instabile]
                    -
                Ce la fai, lei però recupera lo svantaggio. 
                Il suo vestito si strappa e lo ignora.
                Forse ora Chloe ti sta simpatica.
                Alle urla dei bambini però ora ci sono quelle degli adulti. #completion_70
                “Scendete, subito!”
                Marika tiene la mano di suor Addolorata, e vi indica.
                Tua madre è livida, ma non puoi fermarti ora, non vuoi perdere.
                    + “Arrenditi[!"], sono più veloce di te!”
                    -
                Chloe non ti risponde.
                Le suore e tua madre sono sotto all’albero.
                Chloe grida: ha afferrato il registro.
                    + Ti scappa una parolaccia[]. Marika si scandalizza.
                    -
                E poi Chloe cade.
                Un attimo di silenzio e inizia a piangere.
                Scendi di fretta.
                Si capisce subito che il braccio è rotto.
                E tua madre è una furia.
                Davanti a tutti ti porta via di peso.
                La sua voce fa eco a quella di Marika.
                Ti dice che non ha una <f>figlia</f> ma un <m>mostro</m>, un <m>ragazzo</m>, che è una vergogna, che il vestito è un disastro.
                Te lo dice Marika, lo dicono le suore.
                Ti chiedono cosa tu sia, <f>Pallina</f>.
                Non sei una bambina, <f>Pallina</f>. Cosa sei?
                Cosa sei? #almost_there
                ->bullet_hell_uno_afab
    
    ===bullet_hell_uno_afab===
    $bullet_hell_afab_uno$
    -> atto_afab_due
    
    === atto_afab_due ===
    Adolescenza. Inverno. Liceo.  #title
    
        Dal piano di sotto solo qualche risata.
        C’è un silenzio strano: nessuno ha sonno, eppure le parole sembrano finite.
            + “Ce l’abbiamo fatta!”
            -
        Seduta sulla cattedra passi la sigaretta a Chloe, con un sorriso teso.
        Fuori la città dorme, il piazzale è vuoto.
        Domattina sarà riempito dalle camionette della pula, dai prof, da qualche figlio di papà.
        Forse un paio di giornalisti annoiati.
        Ora però il piazzale riposa.
        “Tanta roba per “<f>tre lesbiche del cazzo</f>!”, vero?”
        Emma si sforza di sembrare serena, ma sta tremando.
            + “Sono orgogliosa di te, Bunny.”
            -
        Ed è vero, perché nonostante ansie e paure Emma-SuperfandiSailorMoon-Bunny non vi ha mai smollate, manco quando mezzo consiglio studentesco vi ha insultate davanti a tutti.
        Tre <f>lesbiche</f> di merda.
        Eppure avete avuto l’ok, avete trovato più di trenta studentesse disponibili (che di ragazzi ne son rimasti un paio), e l’occupazione è iniziata.
        “Pensi possa davvero servire a Marika, tutto questo?”
        Chloe ti ripassa la sigaretta.
            + “Almeno saprà di non essere sola.”
            -
        “Non possiamo fare di più, temo.”
        Emma guarda fuori dalla finestra.
        Marika: sospesa dopo essere stata molestata dal preside.
            + “Domani il Guagliotti mangerà merda!”
            -
        “Chissà se l'eterno rappresentante d'istituto Lorenzo Facciadimerda Guagliotti ammetterà che era il caso di organizzare almeno un’autogestione.”
        “Naa, dirà qualcosa sulla legalità da rispettare.”
        Chloe si abbarbica sul tuo braccio.
            + “Con la sua legalità ci menano[."]. Se la può ficcare nel culo.”
            -
        Chloe ti fissa sorridendo, orgogliosa e innamorata.
        Emma legge qualcosa nel suo sguardo.
        Non vi ha mai chiesto niente, ma sa.
        “Scendo dalle gemelle, provo a dormire un po'.”
        La abbracci.
            + “Prenditi cura delle primine!”
            + “Ti voglio bene, Bunny!”
            + “Se non te la senti[...], nessuno ti giudica.”
            Lei ti sorride, stanca: “Abbiamo iniziato assieme, finiamo assieme”.
            -
        “Come fai ad essere tanto <f>figa</f>?”  #completion_33
         Come la porta si chiude, Chloe ti bacia.
            + “Divoro la rabbia del Guagliotti.”[]
            Ti dà un altro bacio. “Speravo fosse un po’ merito mio.”
            + “Rubo la bellezza delle vergini.”[]
            “Allora sono salva”, ti risponde con malizia.
            + “Ignoro i miei sentimenti[."], così marciscono, diventano compost e alimentano le mie cellule.”
            “Idiota”, finge di darti una sberla.
            -
        “Cosa dirà tua madre?”
        Te lo chiede stendendo un piccolo sacco a pelo, così piccolo che ti chiedi come ci starà il tuo corpicione lì dentro.
            + [Imiti tua madre] 
        -
        “Perché io signorina non ti ho mica cresciuta da sola per vederti poi diventare <f>una teppista</f>! Faccio due lavori e uno è per pagare i tuoi danni, acciderbolina!”
        Ci scherzi sopra, ma vorresti capisse che queste cose le fai anche per lei, perché storie come la sua o quella di Marika non si ripetano più.
        Ma lei ti vorrebbe solo a studiare e fare volontariato in chiesa. Più avanti un <f>bravo marito</f> ingegnere, <f>due figli</f> e un appartamento sotto al suo.
        Te la immagini sola, a casa, preoccupata, e ti si spezza il cuore.
        “Intendevo di noi.” #completion_50
        La voce di Chloe si è fatta bassa.
            + “Uh.”
            -
        Scendi dalla cattedra.
        “Che risposta è “uh”?”
            + “Non le ho ancora detto niente.”
            -
        “Ma non sarà un problema per lei, no? Ha anche visto le foto dello scorso Pride!”
            + “È che non sono sicura.”
            -
        “Di noi?”
            + “Di me.”
            -
        Chloe ti guarda, ferma a metà nel gesto di spogliarsi.
        La luce mette in evidenza una vecchia cicatrice sul braccio e lo sguardo ferito.
        Sai che c’è qualcosa, qualcosa che devi capire, ma le parole se ne vanno quando provi ad afferrarla quella cosa e a parlarne.
            + “Ti amo[.“], ed è tutto quel che so.”
            -
        Chloe si stende in silenzio.
            + “Ma non ti basta.”
            -
        Ti sdrai accanto a lei. 
        Guardi il soffitto lercio: segni di scarpe, ragnatele, gomme da masticare, tracce di unto. Una trave esposta da cui cade polvere.
        “La scuola è il posto del futuro per i nostri giovani, un tempio di sicurezza” ha sbraitato ieri il preside. Minimo, quella polvere è amianto. #completion_70
        “È che non capisco.”
        La voce di Chloe taglia il silenzio della stanza.
        “Arriva sempre un momento in cui alzi una barriera e mi tieni fuori.”
            + ["Non voglio dirti cazzate."]“Ti tengo fuori solo da quello che non capisco di me, per non dire cazzate. Ho bisogno di tempo, Chloe.”
            -
        “E questo è uno scudo contro di me?”
        Ti tira il <m>binder</m>.
        Dopo un’intera giornata è una tortura, la schiena è a pezzi ma non vuoi levartelo.
        Le sue dita si infilano sotto, ti senti morire.
            + Provi a resistere[]. Il tuo corpo si irrigidisce.
            “Stai trattenendo il respiro?” Chloe ti guarda perplessa.
            + [Levi la mano]
            -
        Lei si alza, va alla finestra.
        Detesti quando cerca di farti sentire in colpa, detesti che ci riesca sempre.
        Ti avvicini a lei.
        “Ancora questa storia. Non sei un <m>uomo</m>, <f>Pallina</f>. Lo saprei. Mi fanno venire tipo l’orticaria se li tocco. La tua forza è quella di una <f>donna</f>, i tuoi gemiti...”
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
        Se finisce la storia con lei, nessuna ti amerà più.
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
    Età adulta. Autunno. Discoteca. #title
    
        Guardi tua madre e Chloe parlare al bancone del locale.
        Ancora non ti capaciti di come le cose siano cambiate.
        Mamma ti fa il gesto di raggiungerla.
        “Chloe mi diceva che state pensando di andare in Spagna per, insomma...”
        Guardi tua moglie: questa cosa della <f>maternità</f> l’ha accennata giusto due sere fa.
        Ha già deciso che avrete un figlio, a quanto pare.
            + [Resti in silenzio]
            + “È solo un’idea per ora.”
            + “È un processo lungo[.“] ma sì, ci stiamo ragionando.”
            -
        “Non vedo l’ora di essere <f>nonna</f>.”
        Tua madre è raggiante.
        Si guarda in giro.
        “Forse è il caso che me ne vada ora, ma sono stata felice di darvi una mano, <f>ragazze</f>.”
        Ti abbraccia e se ne esce dal locale.
        “Perché non hai messo il costume che ti avevo preso?”
        Chloe guarda infastidita il tuo felpone largo.
            +“Non ho fatto in tempo[.“]. I preparativi e tutto il resto...”
            -
        Ma non ti risponde perché due donne si avvicinano, vestite da Ellen Degeneres e Portia de Rossi.
        Iniziano a parlare con Chloe di soldi, politica, della figlia dell’assessore, di riqualificazione del quartiere.
            +“Cosa non va nel quartiere?”[] chiedi senza pensarci.
            -
        Chloe ti dà una gomitata e bisbiglia: “Sii gentile, sono loro a finanziarci”.
            +Sorridi alle due[.] che ti stanno osservando.
            -
        “Avete fatto davvero un gran lavoro, complimenti”, dice la finta Portia.
        “Forse il titolo è un po’ prosaico”, commenta la finta Ellen.
        Chloe difende ridendo il nome della festa, perché ovviamente “Halloween senza uomini” l’ha scelto lei, come il novanta per cento delle cose della serata.
        “Tutto bene?”, Emma interrompe i tuoi pensieri.
            + [Fai sì con la testa]
            + “Detesto questa gente.”
            + Ti tappi le orecchie[], fingendo di urlare disperata.
            -
        Emma infila il braccio sotto al tuo.
        È vestita come se fosse appena uscita dalla doccia, con un gigantesco foulard/asciugamano sui capelli.
        “Posso parlarti?” 
            + Lanci un'occhiata a Chloe[], che però è presa a riverire la coppia.
            -
        L’improvvisata discoteca è già piena, centinaia di donne che si agitano e ballano e chiacchierano. #completion_33
        Diverse hanno la spilletta di “<f>Tre lesbiche del cazzo</f>”.
        Chloe sarà felice di tutte queste nuove tesserate.
        Noti che Emma non porta la sua.
        Ti trascina fuori, sul retro del locale.
        Prende fiato, sta un po’ tremando ma la conosci abbastanza da sapere che non è per colpa del freddo.
            + “Tutto ok Bunny?”
            -
        Le passi un braccio attorno al collo.
        “Lascio l’associazione.”
        È un colpo freddo, imprevisto.
        L’avete creata voi tre, è nata dagli anni delle occupazioni e dei cortei, dei Pride, delle manifestazioni non autorizzate contro il politico fascio di turno.
        “Non è più il progetto in cui credevamo, <f>Pallina</f>. Questa roba è, è altro, è il sogno bagnato di Chloe. Questa è la gente contro cui abbiamo lottato, che ci fanno quelle due stronze qui?”
            + “Se vogliamo sopravvivere...”
            -
        “Queste sono le parole di Chloe, porca la cacca. Tu sai che ti voglio bene, vero?”
            + [Resti in silenzio]
            + [Fai sì con la testa].
            + “Anche io, Bunny.”
            -
        Ti prende le mani.
        “Non sei più te stessa, <f>Pallina</f>. Praticamente ubbidisci solo a Chloe, non la metti mai in discussione. Dov’è la <f>Pallina</f> che rispondeva “fanculo!” a ogni cosa? Che cercava di salvare il mondo? Quella il cui divano ha ospitato quintali di ragazze cacciate di casa?”
        C’è un toc freddo da qualche parte nella tua pancia.
        Dove hai messo un sistema di difesa che ultimamente spara contro tutto, in modo indiscriminato, pur di non guardarsi dentro.
            + Entri nel locale[], ma Emma ti ferma sulla soglia.
            + Molli la mano di Emma[], cerchi una sigaretta nelle tasche strette.
            + “C'è chi ha deciso di crescere, e chi no.”
            Lo dici con cattiveria, ma lei non molla.
            -
        “Tesoro, non stai bene, da molto. Non so cosa stia accadendo, ma sorridi sempre meno, e sono preoccupata. Voglio aiutarti, ma non so come farlo se...”
        Venite interrotte da delle grida.
            + Ne approfitti per entrare[] e vedere cosa sta succedendo.
            Le parole di Emma ti rimangono incollate addosso.
            -
        “Non è un uomo.”
        La voce cade nel silenzio totale, persino la musica è scomparsa. #completion_50
        “Le regole sono regole e...”, è la voce di Chloe, che trema.
        Sai che è incazzata. Le due iene sono alle sue spalle, in mano due Martini.
            + [Ti avvicini]
            -
        “Laura, non importa, andiamo altrove.” 
        Riconosci di colpo le due persone che stanno discutendo con Chloe.
        Laura, la tua vecchia compagna di scuola, vi siete perse dopo i primi anni di liceo.
        E Pallino che, che. Non riesci ad ascoltare i tuoi pensieri, a capire "che" cosa.
        Sai che in teoria è in costume, vestito da biondina, ma ti rendi conto anche che per Pallino quello non è solo un costume.
        Quel toc freddo, di nuovo, nello stomaco.
            + [Vai verso Chloe]
            -
        Ma Emma si mette in mezzo.
        “È questo quello che non deve accadere. Non siamo questa cosa qui.”
        Senti Laura dire qualcosa col tono di chi è stanco di ripetere la stessa frase ancora una volta.
        “Non è un ragazzo, è una persona non binaria, vuole solo stare in un posto tranquillo per la prima volta che esce di casa così. Sperava di non venir presә a brutte parole almeno qui, ma a quanto pare.”
        Laura intercetta il tuo sguardo, ti riconosce.
        Chloe si rende conto che la tizia sta guardando altrove.
        Ti vede, e con gli occhi ti supplica di darle soccorso.
            + [Sorridi a Laura] -> Pacificazione
            + [Ti appoggi a Chloe] -> Durezza
            + [Te ne vai a bere] -> al_bancone_emma

        
            = Pacificazione
                Saluti, convenevoli, spieghi che è una serata particolare, che non c’è desiderio di discriminare nessuno, è solo che vi è stato chiesto di, di cosa, non lo sai manco tu alla fine.
                Più parli più ci sono mormorii, gente che esce dal locale.
                Pallino sorride a Laura.
                “Andiamocene tesoro, non importa.”
                Laura sembra delusa mentre se ne vanno.
                “Conosci queste persone?” ti chiede Chloe.
                A quanto pare non le ha riconosciute.
                Con la coda dell’occhio vedi Emma uscire.
                    + [La insegui]
                    -> pre_terzo_bullet_hell_afab
        
            
            = Durezza
                Chloe continua a parlare, la sua rabbia sempre meno nascosta ora che sei al suo fianco.
                Pallino è davanti a te.
                Ti rendi conto che è a disagio per la situazione, ma è comunque raggiante.
                Il modo in cui le sue dita si muovono, come gli occhi esplorano lo spazio.
                Il sorriso che arriva sulla sua bocca quando si vede nel riflesso della porta.
                Come scosta i capelli lunghi, lasciando che la mano poi rimanga sul petto scoperto.
                Guardi il tuo di petto, che cerchi sempre di dimenticare, di ignorare.
                Non porti più il binder da anni, da quando Chloe ti ha detto: “O quello, o me”.
                    + “Andatevene.”
                    -
                La tua voce è piena di rabbia.
                    + “Non è posto per voi[."]. Non potete andare dove volete, come volete. È una festa privata con le sue regole, c’è poco da sindacare.”
                    -
                Vedi le iene sorridere soddisfatte, Chloe ti prende la mano.
                Laura ti gira le spalle e se ne va.
                Eviti di incrociare lo sguardo di Pallino.
                Assieme a loro se ne vanno diverse persone, alcune sono attiviste del gruppo.
                Chloe ti bacia e ringrazia.
                Emma si avvicina, ti guarda, e in silenzio se ne va.
                    + [La insegui]
                ->  pre_terzo_bullet_hell_afab
            
            
            = pre_terzo_bullet_hell_afab
                Ma la perdi subito in mezzo alla calca. #completion_70
                La strada è piena di persone e voci e odori, ma non Emma.
                Perché la stai inseguendo?
                Chloe urla il tuo nome.
                    + Acceleri il passo[], la lasci alle spalle.
                    -
                Ripensi alle parole di Emma.
                Hai tradito la persona che eri? E perché?
                Correndo il <f>seno</f> salta, ti ricorda che esiste, riempiendoti di disagio.
                Il tuo <f>corpo</f> ti sembra immenso, esposto.
                Gli sguardi delle altre persone pronti a giudicarlo, sezionarlo.
                A decidere attraverso le sue forme, cosa sei.
                Tutti gli occhi sono quelli di Chloe.
                    + [Ti appoggi a un muro]
                    -
                Ti manca il fiato e quel senso di disagio, di freddo è lì che si crepa, che ti riempie delle parole e dei giudizi, delle promesse e delle velate minacce.
                Di Chloe che vuole che tu sia la sua <f>ragazza</f>, la sua <f>donna</f>, la <f>madre</f> della vostra bambina.
                Ci sono domande che non vuoi ascoltare perché stai pensando a tua mamma, tua mamma che c’ha messo trent’anni ad accettare che sei <f>lesbica</f>, e ora vorresti davvero cambiare tutto, di nuovo?
                Rischiare di nuovo di perderla?
                Inizi a piangere, svuotata.
                Chi devi essere, perché tu possa essere felice? #almost_there
            -> bullet_hell_tre_afab
            
            = al_bancone_emma
                Butti giù due bicchieri di fila. #completion_70
                Emma si avvicina.
                “Non erano nostre compagne di scuola quelle all’ingresso?”
                    + Chiudi gli occhi[.], concentrandoti sulla musica.
                    -
                “Non è che se non guardi le cose queste spariscono!”
                    + [Ordini un altro shot]
                    -
                “<f>Pallina</f>!”, Emma ti prende le mani. “Cosa sta accadendo?”
                Ti senti rompere, senti che sta per cedere qualcosa.
                La guardi negli occhi, fai per parlare.
                    + [Ma ordini ancora uno shot]
                    -
                L’alcool arriva tutto in una botta, ti senti stordita e nauseata.
                Il chiasso all’ingresso sta allontanando le persone, la musica si è fermata, ma tu ti accorgi solo di Emma che ti guarda preoccupata.
                Ti chiedi se lei possa vederti davvero, vedere cosa sei.
                Perché te lo sei negata da tanto, e tu ora non hai più risposte.
                    + “Non so chi sono, Bunny.”
                    -
                Ti senti cadere. L’alcool altera tutto.
                La caduta è infinita, rallentata dai commenti di una vita.
                “Devi <f>vestirti da bambina</f>!”
                “Questa <m>non è una cosa da ragazza</m>.”
                “Perché <m>giochi a calcio</m>?”
                “Sono <f>lesbica</f>, per cui tu sei una <f>ragazza</f>.”
                “È normale che detesti il tuo <f>seno</f> in una società così sessualizzata.”
                "Ci sono <f>solo due generi</f>."
                "Questo è <m>innaturale</m>!"
                Vomiti, e col vomito si rompe quel pezzo di gelo che avevi nel petto.
                Le parole vengono a getto, ti feriscono, e tu non hai più la forza di reagire. #almost_there
                -> bullet_hell_tre_afab
         

    === bullet_hell_tre_afab ===
        $bullet_hell_afab_tre$
    -> finale_afab
    
    === finale_afab ===
        “<f>Pallina</f>! Ti prego guardami!”
        È la voce di Bunny.
            + [Ti sforzi di aprire gli occhi]
            -
        Pesano quintali.
        Sei in ginocchio, e davanti a te c’è Emma.
        “Cazzo, quanto mi hai fatto preoccupare!”
        Cerchi qualcosa da dire, e ti rendi conto che c’è un sacco di spazio ora nella tua testa.
        Spazio per nuove parole.
        Il gelo nella pancia è sparito.
            + “Bunny.”
            -
        La tua amica ti guarda preoccupata.
            + “Ho paura.”
            -
        Inizi a piangere, non ricordi da quanto non lo facevi.
        Infradici la spalla di Emma che ti stringe, che ti rassicura.
        Che ti dice che andrà tutto bene.
        Pian piano riprendi fiato, ti lasci andare su di lei.
        Non avevi mai realizzato quanto la sua amicizia fosse il tuo posto sicuro.
            + “Bunny, non credo di essere una [ragazza."]<f>ragazza</f>.”
            -
        Lei resta in silenzio, toccandoti i capelli.
            + “E nemmeno un [ragazzo."]<m>ragazzo</m>.<>
            E quando ho visto prima Pallino, quando ho visto quanto fosse felice in quel modo altro, ho pensato che quello è il mio posto. E mi ha fatto paura.”
            -
        “Qual è la cosa peggiore che potrebbe accaderti, se fosse così?”
            +“Perderei Chloe.”
            -
        “E se continuassi a non cercare una risposta a questa domanda?”
        Resti in silenzio.
        Ti rendi conto che l’alternativa è perdere te.
            +“Avrò bisogno di te, Emma.”
            -
        “Non vado da nessuna parte tesoro, ma non chiamarmi ma più Emma o mi metto a gridare.”
        Indichi il suo megafoulard del costume, mezzo sfatto dalla serata, dalle corse.
            +“Posso?”
            -
        Te lo passa, le chiedi di chiudere gli occhi.
        È immenso, lo usi per fasciarti il <m>seno</m> stretto, per farlo sparire.
        Prendi il cellulare, ignori chiamate e messaggi di Chloe e ti guardi nella fotocamera.
        È un inizio, ma ami quel che vedi.
            +“Ci sbronziamo da qualche parte?”
            -
        Emma ti sorride, ti passa la sua giacca di pelle.
        “Se vuoi, ho ancora due bombolette di stelle filanti spray, e so dov’è parcheggiato il SUV delle due ricche stronze.”
        Le afferri la mano.
        Non ti sei mai sentitə così vivə. #almost_there
        -> bullet_hell_buono

//FINALI INTERMEDI

    === sconfitta_amab_uno ===
        Grida ti fanno tornare in te.
        Vedi Pallina con in mano dei sassi, sangue sulla fronte di Lorenzo che urla cose.
        "Va a piangere da mammina, su!"
        Un bus suona il clacson infastidito, obbligando i ragazzi a levarsi dalla strada.
        Rimanete solo tu e Pallina.
            + Provi a dire qualcosa[], ma biascichi a fatica.
            -
        Pallina cerca il tuo sguardo: "Devi..."
            + "Picchiarli?"[]
            Ripensi a quanto ha detto poco fa Omar.
            -
        "Ignorarli."
        È seria, le mani sui fianchi come la supereroina di un fumetto.
        "Primo, perché sono degli idioti. Secondo, perché sono degli idioti, e terzo, perché sono degli idioti e che te ne frega di loro?"
            + "La fai facile, tu a loro piaci."
            -
        "Non sempre, solo quando si tratta di giocare."
        Ti tende la mano, un invito ad alzarti.
        "Ascolti sempre quello che dicono la maestra o Marika o gli altri bambini, ma non è che sanno tutto loro e tu no."
            +"Omar dice che devo essere come loro."
            -
        "Mica Omar sa tutto. Guardati."
        Ti fa voltare.
        Avete la vetrina di un negozio abbandonato davanti a voi.
        "Tu sei tu, punto. Io sono io. Punto. Loro fanno quel che vogliono, noi facciamo quel che vogliamo."
        Ti guardi nella vetrina, e inizi a vedere qualcosa, qualcosa che prima non c'era, qualcosa che era stato coperto dalle parole di tuo fratello e dei bambini e delle maestre e di tua madre.
        Sorridi a Pallina, e lei ti afferra la mano.
        Vedi lə tua vera te, e lə ami. #almost_there
        -> bullet_hell_buono


    === sconfitta_amab_due ===
        Quando riapri gli occhi, ti circondano le cose di nonna.
        Sei nel suo letto, voci vengono dal salotto.
        C'è un bicchiere d'acqua sul comodino, ma quando provi ad afferrarlo cade.
        Passi arrivano veloci in stanza.
        Laura ti abbraccia, Omar ti guarda preoccupato.
        "Cazzo hai fatto <m>fratello</m>?"
        Li guardi perplesso.
        "Ad una certa sei svenuto. Ci siamo preoccupati."
        Laura ti stringe una mano.
        "Sei davvero una <f>femminuccia</f>, <m>Pal</m>!"
        Omar ti tira un pugno sulla spalla.
            + "Basta."
            -
        Dura, la parola arriva in faccia a Omar, e ti va bene così.
        "Ohi, stavo solo scherzando."
        La tua mente è lucida, le parole chiare.
        Ti alzi dal letto.
            + "Bas-ta."
            -
        "<m>Pal</m>, hai battuto la testa?"
        Fissi Omar negli occhi.
            + "Ne ho abbastanza Omar[."] dei tuoi <m>frocio</m>, <f>gay</f>, </m>ricchione</m>, <f>femminuccia</f>, <f>lesbiche</f> e via di seguito. Non sei manco originale, e fanno male. Fanno male."
            -
        "Perché sei..."
            + "Perché non sono te[."], e va bene così. Basta. Non devo somigliarti, non voglio nemmeno, perché dovrei?"
            -
        Tuo fratello stringe le labbra e i pugni.
        "È il caso che me ne vada."
            + "Omar?"
            -
        Tuo fratello si ferma.
            + "Lasciami essere chi sono[."], se mi vuoi davvero bene."
            -
        "Se lo facessi allora non ti vorrei bene, perché il mondo ti divorerebbe."
        Guardi Laura, le sorridi.
            + "Forse il tuo, di mondo[]. Ma ce ne sono altri dove c'è posto anche per me."
            -
        Omar se ne va.
        Laura ti abbraccia.
        Piange.
        "Ti amo."
        La baci guardandola negli occhi.
        C'è il tuo riflesso nelle sue lacrime e finalmente vedi lə tua vera te, e lə ami.
        Ti ami. #almost_there
        -> bullet_hell_buono
        
        
        
    === sconfitta_afab_uno ===
        Sei a casa con mamma, non ha parlato per tutto il viaggio.
        Ora avete due cioccolate davanti, ma siete entrambe ferme.
        Non hai idea di cosa stia pensando.
        Poi prende fiato.
        "Sei pronta per un discorso da persone adulte?"
            + Fai subito sì con la testa[], felice che ti abbia rivolto la parola.
            -
        "Non so come si fa a essere una buona mamma, <f>Pallina</f>." sospira. "Di certo non come nonna Melina."
        Ti sorride.
        "Ho fatto un sacco di casini, sai? Sempre di testa mia, e questa cosa la faceva impazzire."
        Ha gli occhi lucidi.
        "Ma sono contenta di averle disubbidito. Diversamente, non sarei la persona che sono, e mi piaccio. E non avrei avuto te. Sai che son felice di averti, vero?"
            + Non sai se e come muoverti[]. Ti sono nuovi questi discorsi.
            -
        "Ti propongo un patto: tu mi dirai di cosa hai bisogno, cosa vuoi fare. Io ti dirò di "no" solo se so che sarà pericoloso, e dovrai fidarti di me. In cambio, sopporti le suore fino alla fine dell'anno, e poi cambiamo scuola."
        Ti stai guardando le mani, perché non sai cosa dire. È la prima volta che ti trattano da persona adulta.
        E poi ti rendi conto che una cosa la sai.
            + "Mamma? Vorrei tagliarmi i capelli."
            -
        "Questa mi sembra una richiesta facile, tesoro", ti scompiglia i lunghi riccioli.
            +"Li voglio rasati come Lore."
            -
        Mamma fa per dire qualcosa, poi si ferma.
        "Ti va se te li taglio io?"
            + [Le prendi la mano]
            -
        Ti abbraccia.
        Quando si stacca ha gli occhi lucidi.
        Ti accompagna in bagno, e man mano che le ciocche cadono hai l'impressione che una patina sparisca.
        Per la prima volta vedi lə tua vera te, e lə ami.  #almost_there
    -> bullet_hell_buono
    
    
    
    === sconfitta_afab_due ===
        Il risveglio è come uscire da un incubo.
        Fuori c'è il caos: cori, sirene, grida, risate.
        Al tuo fianco non c'è Chloe ma Emma.
        Sta leggendo qualcosa, e ti sorride quando ti svegli, un sorriso piccolo e triste.
        "Chloe se ne è andata stanotte, mi dispiace."
        Ti fa più male di quanto vorresti.
            + Ti alzi e ti appoggi a lei[],
            <> hai bisogno di conforto.
            -
        Lei ti stringe forte, lasciandoti tutto il tempo del mondo.
        Quando ti stacchi, ti dice che il corteo sotto ti aspetta.
            + "Bunny, secondo te cosa sono?"
            -
        "In che senso?"
            + "Non mi sento una [ragazza."]<f>ragazza</f>. E nemmeno <m>un ragazzo</m>. O qualcosa nel mezzo. Più una cosa "altra", diversa. Ma ogni volta che ci penso mi manca l'aria, mi sento morire. E per colpa di questa cosa, Chloe se ne andrà."
            -
        "Chloe...", ma poi Emma cambia idea.
        Apre il suo specchietto da trucco, vi guardate assieme.
        "Ho sempre saputo che mi piacevano le ragazze, ma a casa questa cosa non esisteva, sai quanto sono religiosi i miei. Ho capito che c'erano altre ragazze come me solo quando ho conosciuto te e Chloe."
        Sospira.
        "I miei potevano continuare a dire che certe cose non esistevano, ma ciò che sento e provo sono dati di fatto. Quando ho accettato questa cosa, mi sono vista davvero."
        Gira lo specchietto verso di te.
        "Solo tu puoi sapere chi sei. Fuori possono dire che non esisti, ma è un problema loro. Non è che perché Chloe è lesbica non possa avere pregiudizi, ma quelli sono problemi suoi. Tu sai chi sei, e hai il diritto di dirlo ad alta voce ogni volta che vuoi."
            + "Come fai ad essere così saggia?"
            -
        Sorridi guardandoti nel piccolo specchio.
        Ti sforzi di ignorare i segni del sonno e i capelli sfatti e pian piano il tuo volto emerge, lə tua vera te, e lə ami.
        Ti ami.
        Il petto si rilassa, si riempie di calore.
        Di gioia.
        Sei un concentrato di vita. #almost_there
    -> bullet_hell_buono