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
        - gender == 1 && atto_afab_due: -> sconfitta_afab_due 
        - gender == 1 && atto_afab_uno: -> sconfitta_afab_uno 
    
        //check AMAB
        - gender == 2 && amab_tre == 2: -> finale_amab_due
        - gender == 2 && amab_tre == 1: -> finale_amab_uno 
        - gender == 2 && atto_amab_due: -> sconfitta_amab_due 
        - gender == 2 && atto_amab_uno: -> sconfitta_amab_uno 
    }  

//STORIA PALLINO
    === intro_amab ===
    ~ gender = 2
    ~ amab_tre = 0
        <f>Mamá</f> en el coche, te acuna de camino a casa. #street
        “Acaba de nacer mi <m>hijo</m> y ya tiene una <f>cara</f> de astuto!”
        <m>Papá</m> está muy emocionado.
        La risa de <f>mamá</f> te despierta.
        Desde la ventana tus ojitos ven un mundo desenfocado, lleno de luces, contornos y siluetas. 
        Es todo nuevo, bellísimo, sientes que puedes ser lo que quieras.
            + [Haces un sonido]
            -
        Quieres compartir tu dicha, pero las voces son altas y te ignoran.
        “¿Crees que quiera aprender la profesión?”
        <m>Papá</m> se gira a la derecha.
        <f>Mamá</f> te observa.
        “¿la mía o la tuya?”
        “La mía! Dios, no quiero un <m>hijo</m> <f>esteticista</f>!”
        Se detiene el auto y se baja.
            + [Vomitas]
            -
        No es que puedas hacer mucho más.
        Pasas de los brazos de <f>mamá</f> a los de la <f>abuela</f>, <f>tías</f> y <m>tíos</m> que te rodean.
        Tu habitación está ya arreglada: una cuna con sábanas <m>azules</m>, <m>azules</m> las cortinas, <m>azules</m> las paredes.
        <m>Azul</m> el armario, la alfombra, el pijama que te ponen.
        Rosadas tus mejillas mientras comentan encima de tu <m>pipicito</m>.
        Sobre un estante una serie de peluches: un <m>auto</m>, un <m>bombero</m>, un osito, un <m>bulldog</m>, una <m>pelota</m> de futbol.
        Tu <m>hermano</m>te pone la <m>pelota</m> entre tus manos y se ríe.
        “Estas son manos de portero, mira cómo la agarra!”
        Te observa lleno de admiración.
            + Tu solo querías algo a que agarrarte[], esta gente dice muchas cosas y te sientes confundido.
            -
        La <f>abuela</f> pregunta a tu <m>hermano</m> si quiere tenerte en brazos, <m>él</m> dice que tiene miedo de romperte.
        “Mira que tener un bebé entres los brazos impacta mucho a las <f>chicas</f>!”
        <f>Mamá</f> exclama: “¡Tiene solo doce años!”
        Todos caminan y hablan, comentan cómo será tu futuro, discuten, ríen, ponen límites. 
        Sus palabras caen en tus ojos.
        Afuera, a lo largo del camino ves menos variedad, formas y colores se mezclan hasta qué no queda más que un paisaje de <m>cuadrados</m> azules y <f>triángulos</f> <f>rosados</f>. #people
        Todo te parece igual.
            + [Lloras]
            -
        -> atto_amab_uno
    
    ===atto_amab_uno===
        Infancia. Verano. Patio de recreo. #title
    
        “Porque eres un <m>macho</m>!”
        El tono de quién dice algo obvio.
            + “¿Entonces?”
            -
        “Entonces no puede ser <f>Ariel</f> porque es una <f>prin</f>-<f>ce</f>-<f>sa</f>. A nosotros nos sirve un <m>príncipe</m>, estás aquí exclusivamente por eso!”
        <f>María</f> tiene los brazos cruzados y te mira cómo si tu fueses la cosa más estúpida del mundo.
        Las otras <f>niñas</f> están aburridas.
        <f>Laura</f> sigue bufando, <f>Pallina</f> lanza piedras a los lagartos.
        El sol está cálido y el parque está lleno de voces felices.
            + “¡Se hace siempre como dices tú!”
            + “Puede hacerlo Pallina.”
            + [La miras con actitud desafiante]
            -
        “Soy la más grande así que mando yo y digo que tú eres <m>Príncipe</m>.”
        <f>María</f> se aleja con sus trencitas que bailan.
        Inician a hablar y a planificar.
        De vez en cuando te hacen preguntas, pero no quieres responder.
        Revisas tu morral con las nuevas ediciones de Ranma ½ y piensas que estabas más feliz leyendo mientras tomabas el sol.
            + Te sientas[] en los escalones y las ignoras.
            + Te esfuerza por seguir la conversación[], pero perdiste algo importante, aparece un <m>dragón</m>, ¿Qué tiene que ver el <m>dragón</m>?
            + “¿No tienen hambre?”[]. <f>Laura</f> te regala su merienda mientras te sonríe. Es siempre amable contigo.
            -
        Al otro lado del parque tu <m>hermano</m> <m>Omar</m> está jugando con <m>otros</m> <m>chicos</m>.
        Aunque sea más grande que tú, siempre trata de jugar contigo. Es un <m>buen</m> <m>hermano</m>.
        "¡<m>Pal</m>-<m>lin</m>-<m>oooooooooooooo</m>!"
        <f>María</f> con voz chillona te llama.
        “¡Vamos a comenzar!”
            + [Te acercas sin muchas ganas].
            -
        “Entonces <f>Laura</f> es la <f>hermana</f> <f>pequeña</f>, <f>Pallina</f> es <f>nuestra</f> <f>madre</f>, pero se ha enfermado y necesitamos la poción que está debajo de la barriga del <m>dragón</m> y solo un <m>héroe</m> valiente puede agarrarla y llamamos…”
        “¿Y quién hará el <m>dragón</m>?” <f>Pallina</f> interrumpe <f>María</f>.
        Las trencitas tiemblan por el fastidio de la interrupción.
        “Ese arbusto será el <m>dragón</m>.”
        "¡Ni de broma! ¡El arbusto es la <f>mamá</f> que igual está enferma así que no se mueve, y yo seré el <m>dragón</m>!"
        Las dos inician a pelear, así que decides que es momento de hacer algo.
            + “¡A la cargaaaaaa!”
            -
       Corres en contra del <m>dragón</m> que quizás sea la <f>madre</f>, cuando lo notas.
        Único, rojo fuego por fuera y amarillo por dentro.
        Bellísimo, gigantesco.
        María te grita algo. #completion_33
            + [La ignoras]
            + Le dices que venga[], pero <f>ella</f> grita de correr hacia el <m>dragón</m> porque no quiere que la <f>madre</f> fallezca y se quede <f>huérfana</f>.
            + Sientes el olor de las flores[], es la mejor cosa del universo incluso mejor que las tortas de la <f>abuela</f>.
            -
        “Alguien ha cortado todas las demás."
        Pallina está a tu lado. Tiene razón, hay cogollos en todas partes en la hierba.
            + “No es justo[."], es extraño y bello.”
            -
        <f>Ella</f> siente el olor.
        Te giras junto a <f>Pallina</f>: <f>María</f> se está yendo, <f>Laura</f> la sigue.
        “¡La próxima vez yo seré el <m>príncipe</m>!”
        La voz de Pallina es firme.
            + “La próxima vez yo me escondo."
            + “¡Y María es el dragón!”
            + “¿Promesa?”[] <f>Ella</f> te responde que sí, y si <f>María</f> comienza a fastidiar la empuja al fango.
            -
        De forma precisa se mete entre ustedes dos.
        Pisa las flores.
        La <m>pelota</m> cae a tierra y se lleva todos los pétalos consigo.
        <f>Pallina</f> se voltea, grita “¡Idiota!” y corre hacia alguien, dejándote ahí.
        Te agachas para recoger los pétalos.
        “Mírenla, la <f>niñita</f>.”
        Risas.
        Te levantas, detrás de ti hay un <m>niño</m>.
        Son un poco más grande que tú, de vez en cuando te persiguen durante el recreo en la escuela, son unos pesados con todos. #completion_50
            + [Aprietas los puños]
            + Te alejas[], alguien grita: “¡Oye <f>mariquita</f>, te estoy hablando a ti!”
            + Respondes a tono[] con la voz más segura que puedes hacer, pero balbuceas un “¿Sé escaparon del zoológico?”
            -
        Te llega a la cabeza un pedazo de tierra con césped, te limpias los ojos y no ves quien te tira a tierra, aplastándote con su peso.
        Pruebas a patear, golpeas a algo, un grito te da la satisfacción de haber dado centro.
            + Tratas de pararte[], pero te aplastan de nuevo a tierra.
            + Pruebas con otra patada[], que falla. 
            + ["¡Deténganse!"]
            -
        Estiras las manos, lanzas lo primero que consigues, pruebas a rasguñar y a morder. 
        Son cosas de <f>mujer</f> opina tu <m>hermano</m>. Los <m>hombres</m> tienen que saber <m>dar puños</m>.
        “¡Mariquita!” te falta el aire.
        <m>Lorenzo</m>, ahora lo reconoces, finge un puño hacia tu nariz, pruebas a devolverle uno de verdad.
        Y <m>Lorenzo</m> inicia a volar.
        La sorpresa te quita las ganas de levantarte.
        Pasos veloces, algunos gritos y después una mano que te ayuda a levantarte, tu hermano.
            + [Agarras su mano]
            -
        Te levanta, te pasa el agua y te limpia la <f>cara</f>.
        “Nada grave”, te dice sonriéndote.
        Se sientan juntos en los escalones, recuperas tu bolso y dos dulces algo aplastados.
            + [Le das una a tu hermano]
            -
        “¿Qué hiciste esta vez?, <m>Pal</m>?”
        Le cuentas la historia de la flor.
        <m>Omar</m> se ríe, te acaricia el cabello.
        “¡Por una flor, joder, rayos! ¡Te dejaste golpear por una flor!” 
            + “¡Era la última!”[]-
            “¿Sabes que es lo hermoso de las flores, <m>Pal</m>? ¡Es que siempre nacen de nuevo, a diferencia de tu <f>pequeña</f> cabeza, si se rompe no crece de nuevo!”
            + “¡No quería que me golpearan!”[].
            <m>Omar</m> suspira. Ves que está buscando las palabras para decir algo.
            -
        “<m>Pal</m>,¿No puedo pasar toda la vida defendiéndote, lo sabes verdad?” #completion_70
        “¡Tampoco quiero que lo hagas!”
        “Pero...” <m>Omar</m> se pierde viendo al vacío, aplasta el envoltorio del dulce.
        “¿Por qué crees que se fijan en ti, <m>Pal</m>?”
        ¿Qué respuesta se espera de ti?
            + “¡Porque son estúpidos!”
            + “¿Por qué no juego con ellos?”
            + [Te quedas en silencio]
            -
        “Estas siempre solo con las <f>chicas</f> o con la <f>abuela</f>. Con los <m>chicos</m> no estas nunca, esto es <f>extraño</f>.”
        Lanza el envoltorio a la basura.
            + “Juego contigo.”
            -
        “Que soy tu hermano, es diferente. Soy grande, un día no estaré cuando hará falta y me preocupa que pueda suceder.”
            + “No quiero que te preocupes por mí.”
            -
        <m>Omar</m> te mira a los ojos, con mucha seriedad.
        “Tienes que aprender cómo se vive en el mundo, <m>hermanito</m>. Juega con tus <m>compañeros/m>, <m>golpéalos/m> cuando te ofenden y aléjate de las <f>niñas</f>. De igual forma verás que dentro de algunos años ya no van a querer jugar contigo.”
        Te sonríe.
            + “¿Por qué?”
            -
        “Porque harán <f>cosas</f> de <f>chicas</f>, y los <m>chicos</m> <m>cosas</m> de <m>chicos</m>. Así es la vida.”
        Quizás la vida es estúpida.
            + “¿Tú siempre serás mi amigo?”
            -
        “Siempre, <m>Pal</m>.”
        Te frota con sus nudillos la cabeza.
        “Pero ahora tengo que ir con mi <m>novia/m>. Otra cosa que un día entenderás.”
        Observas cómo se aleja.
        Agarras tu bolso e inicias el camino a casa.
        La luz tenue, las golondrinas pasean por el cielo.
            + [Cantas una melodía]
            -
        Te das cuenta que tus pantalones están rotos, <f>Mamá</f> se molestará muchísimo.
        Pero después, sientes un grito desde el otro lado de la calle.
        Están todos en fila, como si te esperaran, los <m>chicos</m> de antes.
        Notas que <m>Lorenzo</m> tiene un ojo morado, esperas que sea merito tuyo.
        Te están gritando muchas cosas.
        Que eres una <f>niñita</f>, que no eres <m>niño</m> de verdad.
        Que se te cayó el <m>pipicito</m>, Se lo comió el perro, ¿verdad?
        Con el cabello largo pareces una <f>chica</f>.
        Quisieras que <m>Omar</m> estuviera contigo, pero estás solo.
        Solo.
        ¿Qué eres, <m>lentejuelas</m>?
        ¿Qué eres?
        ¿Qué tipo de <m>niño</m> eres? #almost_there
        -> bullet_hell_amab_uno
    
    === bullet_hell_amab_uno ===
        $bullet_hell_amab_uno$
    -> atto_amab_due
    
    === atto_amab_due ===
        Adolescencia. Invierno. A casa de la Abuela. #title
  
        La casa de la <f>abuela</f> es un cúmulo de flores, niveles y niveles de objetos sobrepuestos.
        El salón está lleno de cuarenta años de revistas de <f>moda</f>, <f>costura</f>, <f>blusas</f>.
            + [Agarras una copia de Burda]
            -
        Estamos aquí para botar todo esto.”
        <m>Omar</m> entra con un montón de cajas en la mano.
        <f>Laura</f> llega detrás y te abraza.
        “¿Estás bien cariño?”
            + Dices “Si” con la cabeza[] y colocas la revista en la mesa.
            + Lanzas la revista a Omar[], evita y te dice “perdedor”.
            + “Me ha enseñado a cocer[.“] Sin que <f>mamá</f> lo supiera, desde que tenía diez años. Pasaba aquí las horas a <f>leer y diseñar</f> las decoraciones que después <f>ella</f> hacía en <f>blusas</f>. Cuando hacia frio nos sentábamos delante de la TV a ver documentarios de dinosaurios e hilábamos kilómetros de lana.”
            -
       “No está muerta”. <m>Omar</m> agarra las revistas y las mete en la caja.
        “La abandonaron en una casa de reposo, es la misma cosa.”
        “<m>Pal</m>, es por su bien.”
        Claro.
            + [Ella no quería ir]
            -

        “¿Por qué no aceptaron <f>nuestra</f> propuesta?” <f>Laura</f> pone sus manos en la cintura y observa a <m>Omar</m>.
        No se llevan muy bien. Cuando empezaron su relación <m>Omar</m> era feliz (“¡Entonces no es un <f>maricón</f>!”), pero <f>Laura</f> está convencida que <m>él</m> sea una influencia pésima para ti.
        “¿Dos <f>chicas</f> de quince años que están detrás de una <f>vieja</f> confundida?”
        Laura quería decir algo, pero la interrumpes.
            + “¡Es tu abuela, joder!”
            + “Al menos hubiese sido feliz”
            + “Así mamá puede vender la casa[."] y hacer dinero.”
                “El dinero sirve para pagar la casa de reposo, idiota.”
            -

        Continúan haciendo cajas sin decir una palabra, solo se escuchan el sonido de los objetos.
        <m>Omar</m> apila las cosas con rabia, cierra las cajas, baja las escaleras pisando con fuerza, regresa, repite.
        Laura te pasa las cosas, cuando vuestras miradas se cruzan te sonríe, de vez en cuando te besa en la mejilla. #completion_33
            + [La abuela adora a Laura]

            -
        La <f>abuela</f> siempre ha pensado que si una regla es <f>errónea</f> es tu deber romperla.
        Después de la muerte del <m>abuelo</m> no uso jamás el negro por el luto, era feliz que ese <m>hombre</m> violento había muerto y no quería fingir lo contrario.
        Cuando inició a <m>cazar</m>, algunos <m>hombres</m> se burlaron de <f>ella</f>, algún <m>hombre</m> trato de acercase a <f>ella</f>.
        “Todos fingen ser <m>duros</m>, pero si les disparas cerca de los pies todos huyen asustados.”
        Y <f>Laura</f> se parece a <f>ella</f>. #completion_50
        “¿Qué piensas?”
            + “Se necesita valor[..."] para romper las reglas.”
            Quisiera ser como <f>ella</f>.”
            + “Se parecen tanto, ustedes dos.[”]
            Sus redes eran de lana y las tuyas de bit, pero ustedes se parecen tanto.” <f>Laura</f> ríe: "¡Woah, no sabía que eras un <m>poeta/m>!"
            + “Mamá jamás la ha entendido[“], para <f>ella</f> lo importante es lo que dicen los demás y basta.”
            -

        “Sabes que <f>ella</f> te quiere muchísimo, ¿verdad? Se ve en sus ojos cada vez que te mira.”
        <f>Laura</f> te sonríe, pasándote un <f>vestido</f>.
        Te toma un tiempo reconocerlo.
            + [Observas con más atención el estampado]
            -
               Flores de Jamaica.
        Un <f>vestido</f> largo que te hizo hace dos años.
        Te peleaste con <f>ella</f> por ese <f>vestido</f>.
        Gritas para esconder el miedo, miedo de cuanto <f>ella</f> pudiera ver de ti. 
        Miedo del <f>placer</f> que has sentido con la idea de usar el <f>vestido</f>, de permanecer con <f>ella</f>, allí con ese largo <f>vestido</f> de verano, <f>cocer</f> y hablar, con la tranquilidad y seguridad de que ningún pelotazo te haría daño.
        Laura te observa con ternura. 
            + [Compartes ese recuerdo]
            -> ricordo
            + [Metes el vestido en la caja]
            -> scatolone
            + [Hablas del clima]
            <f>Laura</f> te besa en la mejilla. "¿Dios, ya somos como esas parejas viejas que no tienen nada nuevo que decirse?"
            -> scatolone
        
        = ricordo
            Poco a poco que hablas sientes como dejas de cargar un peso al que estabas acostumbrado y habías olvidado.
            Afuera el otoño parece cálido, pero la <f>cara</f> de <f>Laura</f> se vuelve fría.
            Su mano cerrada sobre la tuya parece un puño. 
                + “Son cosas de la infancia...”
                -
            Tratas de decir, aunque dos años atrás tenías trece años.
            “No, no te estoy juzgando <m>Pal</m>, de verdad solo quiero entender...”
            “Yo también.” #completion_70
            <m>Omar</m> está cerca.
            “¿Eres <m>gay</m>, <m>lentejuelas</m>? Aunque estés con <f>Laura</f> no quiere decir que seas <m>normal</m>.”
            “¡No!”
            <f>Laura</f> te defiende, aunque está temblando.
            “<m>Omar</m>, ¿Por qué tienes que ser <m>tosco</m> cómo la mierda?”
            “Solo digo lo que pienso.”
            Tu <m>hermano</m> se te acerca.
            “¿Sabéis por qué mama no quiere que estés con la <f>abuela</f>? Porque ha pasado todo el tiempo junto a ti apoyando tus cosas <f>raritas</f> .”
            Omar tiene los puños cerrados y apretados.
                + “¡No son cosas raritas!”
                -

            “Seguramente no son cosas <m>normales</m>. Yo, <m>Pal</m>, Dios mío, te quiero mucho, de verdad.”
            <m>Omar</m> baja la mirada. No te ha hablado en ese modo jamás.
            “Quiero, queremos solo verte feliz. Tu solo quieres ser <m>raro</m>."
            Suspira.
            "Dios, <f>mamá</f> está convencida que <f>Laura</f> es una fase antes de aceptar que eres <m>gay</m>. Contigo el mundo va, al contrario.”
            No sabes cómo te sientes. ¿Qué sientes? ¿Qué puedes hacer?
                + [Piensas a la abuela, su fuerza]
                    “¡Yo amo a <f>Laura</f>, no necesito que tu o <f>mamá</f> digan que tengo o no que hacer!”
                    -> litigio
                + [Miras a tu hermano, tu héroe]
                    Te ha dicho “Te quiero mucho.”
                    -> accomodante
                + [La fatiga te pesa en todos los huesos]
                   Te vas dejándolos solos.
                   -> litigio
            
            = litigio
                Tu <m>hermano</m> alza la voz, te grita mientras te vas...
                <f>Laura</f> inicia una discusión con <m>Omar</m>.
                Hacen una lista de las cosas que te hacen un <m>hombre</m> y las cosas que haces de <f>mujer</f>.
                Cada palabra te cachetea, como una bala.
                Quisieras decir que solo tú puedes decidir, que es tu voz la que tiene que alzarse y no la de ellos.
                ¿Pero que puedes decir ahora?
                No sabes que responder a la voz en tu cabeza que te pregunta constantemente:
                “¿Qué eres, <m>lentejuelas</m>? 
                ¿Un <m>chico</m>? 
                Una <f>chica</f> 
                ¿Qué eres?”  #almost_there
                -> Bullet_hell_amab_due
            
            = accomodante
                Agarras el <f>vestido</f> de las manos de <f>Laura</f>, lo guardas en la caja.
                <m>Omar</m> propone de tomar una pausa para una cerveza.
                <f>Laura</f> te ve a los ojos, quiere decir algo, pero se detiene y simplemente se aleja.
                Observas el <f>vestido</f>, en algún modo ahora es el <f>vestido</f> que te observa a ti, en silencio te exige respuestas:
                “¿Qué eres, <m>lentejuelas</m>? ¿Un <m>chico</m>? ¿Una <f>chica</f>? ¿Qué eres? #almost_there
                -> Bullet_hell_amab_due
    
        
        = scatolone
            <m>Omar</m> se presenta en la entrada de casa con tres cervezas, una oferta de paz.
            “¿Ya te quitaste la mala <f>cara</f>?” Le pregunta <f>Laura</f>, destapando la botella.
            “No tengo mala <f>cara</f>, me molesta que mi <m>hermano</m> me trate cómo un <m>monstruo</m>. Quiero mucho a la <f>abuela</f>, de verdad.”
            Se gira de espaldas, tiene un tono de voz más titubante.
            “No quiero despertarme todos los días con el miedo que no responda el teléfono y que muera sola en casa.”
                + [Apoyas una mano en la espalda de Omar]
                + [Ves a Laura, te agarra la mano]
                + [Tienes la mirada triste al suelo]
            “No eres un <m>monstruo</m>, no quería lastimarte.”
            -
            Lo dices con el corazón, deseas que <m>él</m> lo entienda de verdad.
            <m>Omar</m> juega con la tapa de la cerveza entre sus dedos. #completion_70
            “En algún momento de <f>nuestra</f> vida, alguien decidió que tenía que ser <m>fuerte</m> y <m>práctico</m>, quizás porque tu <m>hermanito</m>...” te observa con ojos llenos de sentimiento.
            Está casi temblando.
            “Siempre has estado en tu proprio mundo, todo tuyo. Te quejas de <f>mamá</f>, pero lo único que hace es preocuparse por ti.”
                + “No necesito su preocupación."
                + “Y no te mira a ti."
                + [No sabes que decir]
            -
            “Sé que soy un <m>tosco</m> y <m>grosero</m> y no soy bueno con las palabras como ustedes dos. Pero la <f>abuela</f> es importante para mí y quiero que sea feliz. También eres importante para mí, quiero que tu seas feliz, <m>lentejuelas</m>. Pero no sé cómo hacerlo.”
                + [Te sientes culpable.] Los ojos bañados de <m>Omar</m> te llenan de culpa.
                -> colpa
                + “No quiero que tu seas perfecto[“], solo quiero que tú me permitas ser yo mismo."
                -> myself
                + [Omar te necesita]
                    Las palabras y las explicaciones están demás, abrazas a <m>Omar</m>
                    -> colpa
        
            = myself
                “¿Y qué entiendes <m>Pal</m>? ¿Qué eres?”
                Te miras las manos, esperando que las palabras aparezcan mágicamente, pero no hay nada, solo el polvo de la casa y de las cajas.
                “<m>Omar</m>, déjalo en paz.”
                <f>Laura</f> trata de defenderte, pero tu <m>hermano</m> la ignora.
                “Es lo que quiero, pero también quiero entender que significa dejarlo en paz, ¿no?"
                <m>Omar</m> se te acerca.
                "¿Qué eres <m>lentejuelas</m>? Porque yo no lo entiendo. Estás con <f>Laura</f> y pienso es un <m>hombre</m>, pero te gustan las cosas de <m>maricón</m> y todas las veces que la <f>abuela</f> te ha <f>vestido</f> con camisas y <f>blusas</f> con <f>lentejuelas</f> y brillantina que ni siquiera <f>mamá</f> habría usado… ¿Qué eres <m>lentejuelas</m>?, dímelo por favor, así puedo ayudarte.”
                Y tú quieres responder, de verdad, conseguir una solución, una respuesta, pero ni siquiera tú lo sabes, ¿Qué eres, <m>lentejuelas</m>?
                ¿Qué eres <m>lentejuelas</m>? #almost_there

                -> Bullet_hell_amab_due
        
            = colpa
                “Está bien así, <m>hermano</m>, de verdad. No podría pedir más.”
                Sonríes mientras se lo dices y <m>él</m> sonríe como respuesta, después te da un puño diciéndote mariquito e inicia de nuevo a meter cosas en las cajas y a contar anécdotas de su última salida con los <m>chicos</m>.
                <f>Laura</f> te mira, con ojos amargos.
                “No puedes hacer felices a todos, <m>Pal</m>. Si sigues así… Desaparecerás.”
                    + “¿Y qué tengo que hacer?”
                    -
                “Di tu verdad, la que sea, dila.”
                    + “¿Sobre qué?”
                    -
                <f>Laura</f> sube los hombros, con un sentido de duda, pero con los ojos firmes y espera una respuesta.
                La <f>única</f> cosa que haces es alejarte.
                Vas a la habitación de la <f>abuela</f>.
                La ventana está apoyada, sus vestidos sobre la mesita al lado de cigarros y medicinas
                Ves una foto tuya, de la <f>abuela</f> y de <m>Omar</m> tantos años atrás, cuando todo era simple, cuando nadie te pedía respuestas a preguntas que no entiendes.
                Pero no puedes regresar al pasado, porque los ojos de <f>Laura</f> te observan y te preguntan todavía.
                ¿Qué eres <m>lentejuelas</m>? ¿Que eres? #almost_there
                -> Bullet_hell_amab_due
        
        
        === Bullet_hell_amab_due ===
            $bullet_hell_amab_due$
        -> atto_amab_tre
        
    === atto_amab_tre===
    Edad adulta. Otoño. Casa de ustedes. #title

        <f>Laura</f> te repite de apurarte.
            + “¡Pero todavía faltan seis horas!”
            -
        “¡No alcanzan! ¡Trae algo de comer!”
        Buscas en todos los muebles de la cocina, consigues chocolate y crema de almendras.
        No quieres ir a esa estúpida fiesta está noche.
            + “¿Y si nos quedamos en casa[?"] ¿Y vemos un film de horror y comemos comida chatarra?”
            + [¡Tu odias a María!] “¿Te he dicho que odio a <f>María</f>?”
            + “¿Desde cuándo te gusta Halloween?”
            -
        Subes las escaleras sin que <f>Laura</f> te responda. La <f>única</f> luz es aquella del pequeño estudio.
        Todavía te sorprendes con la casa, con la vida. Las cosas que han hecho juntos.
        Intentas entrar, pero <f>ella</f> sale a la puerta y rodea tu cuello con sus brazos.
        “Prométeme que, por una vez, solo una vez me dirás que si sin hacer tantas preguntas”
            + ["¿Habrá perros labradores?"] “Solo si hay perros labradores en esa habitación”.
            “¡Hay algo mejor que los labradores!” responde. “¡Imposible, nada es mejor que los labradores!”
            + [Le recuerdas el matrimonio] “La última vez que acepté sin hacer preguntas terminamos casados y todavía no se si fue una buena idea”. 
            <f>Laura</f> te da un puñito en la cabeza.
            + Sientes el olor de una trampa[]. <f>Ella</f> reconoce tu expresión.
            “¿Cuándo he hecho cualquier cosa que pudiera meterte en problemas?”. Haces una lista suficientemente detallada que describe chocolate, leones marinos, un disfraz de Elon Musk y una guillotina. Ah, también aquella vez en el cementerio con la tabla Ouija. <f>Ella</f> te observa con los brazos cruzados, fingiendo seriedad.
            -
        Te lleva al cuarto.
        En la cama ves pedazos de jeans, <f>maquillaje</f>, un sombre horrible y una <f>peluca</f>.
            + “¿Dónde está el cadáver de RuPaul?”
            -
        Te mira, ojos llenos de afecto.
        "De vez en cuando pienso en el <m>niño</m> tímido e inseguro que conocí veinte años atrás y me sorprende ver en quien te convertiste”.
        No sabes que responder, aunque es verdad: a cierto punto, inesperadamente, la edad adulta te regaló una seguridad en ti mismo que no habías jamás imaginado de poder tener.
                <f>Laura</f> cambia discurso. #completion_33
        “¿Te recuerdas el año pasado María dijo que somos los únicos que no hacen disfraces de parejas?”
            + “¿Es un problema?”
            + “Es difícil olvidarlo[!"], lo gritó a los cuatro vientos desde el balcón.”
            + “¿Me recuerdas por qué es tu amiga?”
            Te tira un malvavisco.
            -
        “Este año quiero demostrarle que se equivoca. Y me pregunto: ¿cuál es la pareja más horrible para una fiesta de Halloween?”
        Buscas una respuesta sensata, inútilmente.
        Laura te observa con inquietud.
            + “¿Bonnie y Clyde?”
            + “¿Woody Allen y Soon-Yi?”
            + “¿Mis padres?"
            -
        <f>Laura</f> toma los pantalones de jean.
        “¡<f>Britney</f> y <m>Justin</m> del 2001! Vale, ¿Qué podría ser más incómodo que el falso Jean y Timberlake?”
        Agarra los pedazos de tela con estampado denim.
        “Conseguí dos disfraces, pero no me gustaban mucho y así que los desarmé para hacerlos mejor, pero… Ohm… Yo creo videojuegos, no soy una <f>costurera</f>. ¡Así que pensé que podrías ayudarnos tú, y en cambio yo te <f>maquillo</f>!”
            + “¡No he cocido nada desde que tenía trece años!”
            “Estoy segurísima que es como andar en bicicleta, no se olvida.”
            + “¿Maquillaje?”
            + “¿Podemos ir vestidos normales?”
            <f>Laura</f> te ignora.
            -
        “Y, sorpresa de las sorpresas... ¡Yo seré <m>Justin</m> y tu <f>Britney</f>!”
        Estas por decir algo, pero…
        Pero algo se mueve en tu barriga, un calor crece mientras observas la tela de jeans, <f>peluca</f>, <f>maquillaje</f>. #completion_50
        Te sientas en silencio delante de la máquina de coser, beh: como volver a la bicicleta.
            + Inicias a coser[] los pedazos de tela.
            -
        Es un salto a los recuerdos, pasando de una cosa a la otra.
        Citar la estrella desaparecida de turno hace que empiecen hablar de lo que estaban haciendo ese año, una canción trae consigo una amistad rota, una noche borrachos al mar.
        “¿No se hablan todavía?”
        Habla de <m>Omar</m>, pero eso ya lo sabes.
        No se hablan desde hace dos años, pero de vez en cuando Laura te lo pregunta de nuevo.
            + “No."
            A cierto punto, no soportas más sus insinuaciones.
            -
        La tela pasa velozmente por la máquina de coser.
        <f>Laura</f> se prueba el disfraz: vestida como <m>Justin</m> se ve ridículamente encantadora.
        “¡Ahora siéntate, es mi turno!”
        Su mano ligera mezcla, <f>diseña</f> y pinta tu <f>cara</f>.
        De vez en cuando se aleja para ver el proceso y sonríe satisfecha del progreso.
            + “¿Desde cuándo planificas esto?”
            -
        “Cuando me di cuenta de la idea noté que estuvo en mi mente todo el tiempo. Es algo que quería hacer contigo, algo que solo podría hacer contigo.”
        Te besa en la nuca, te toma la mano para ayudarte a pararte, te acompaña al espejo.
        El <f>vestido</f> es horrible, la <f>peluca</f> es terrible.
        Pero tus ojos se fijan en la imagen adelante, una <f>cara</f> rediseñada con <f>maquillaje</f>, la cintura marcada por la correa, el pecho peludo que se ve del <f>escote</f>. 
        Te sientes mareado.
            + “¿Debería depilarme?”
            -
        Susurras.
        “Solo si no te gusta.”
        <f>Laura</f> aprieta tu mano.
        Te miras al espejo, y te gusta muchísimo como te ves.
        Tienes miedo, te hace falta el aire, sin embargo, estás seguro que lo que estás viendo eres tú verdaderamente.
        Es como si alguien te hubiera quitado una venda de los ojos.
        Cómo si hasta ahora el cuerpo que ves en el espejo fuera de otra persona, una persona que continuabas borrando y reprimiendo, una persona que no querías recordar nunca.
        Pero eres tú, tú de verdad.
        Admiras tus enormes ojos debajo del delineador de ojos, el modo cómo tu boca explota de rojo entre los pelos de la barba.
        Cómo los <m>músculos</m> y los doblajes del <f>vestido</f> se resaltan entre ellos.
        + [...]
        -
        Lloras. #completion_70
        <f>Laura</f> ti abbraccia.
        <f>Laura</f> te abraza.
        “¿Estás bien, cariño?”
            + Reprimes todo lo que sientes[], porque no hay espacio para esto, la sinceridad alejará a <f>Laura</f>, justo como hizo con <m>Omar</m>.
            -> Respingi
            + No puedes decirle la verdad[], no puedes. <f>Laura</f> es magnífica, pero también <m>Omar</m> lo era, ¿Y ahora dónde está? 
        -> Perdere
            + Tratas de conseguir las palabras[] para decirle lo que sientes. 
            -> Sinceramente
        
        = Sinceramente
        ~  amab_tre = 2
        
            Pero no te vienen, es como si estuvieras vacío, te falta una pieza.
            Sonríes, balbuceas que todo es hermoso, pero no te lo esperabas.
            Te hace falta el aliento.
            Te entrevés de nuevo al espejo y sonríes.
            Una voz dentro de ti te grita que das asco.
            Tratas de ignorar esa voz, pero es muy <m>fuerte</m> por todo lo que te han dicho en la vida.
            <m>Omar</m> no te considera un <m>hombre</m> de verdad.
            La <f>vecina</f> bromeando les dice “las <f>lesbianas</f>”.
            Tu <f>mamá</f> que dice que te pareces muchísimo a la <f>abuela</f>.
            <m>Papá</m> que continua a regalarte <m>boletos</m> para el estadio.
            Los prejuicios, las cosas dichas y las no dichas.
            Te miras al espejo y pareces una cosa incompleta, una cosa <f>errónea</f>.
            Un bau bau, una abominación.
            Pero igual te lo preguntas.
            ¿Qué soy?
            ¿Qué eres <m>lentejuelas</m>?
            ¿Qué diablos eres? #almost_there
            -> bullet_hell_amab_tre_bis
        
        = Perdere
        ~  amab_tre = 1
        
            <f>Ella</f> te dice de sentarte a su lado, su olor suave te envuelve.
            Te observa, y lees la preocupación en sus ojos.
            “Lo lamento. cariño”, te dice.
                + “¿Por qué?”
                -
            “Ha sido un tipo de trampa. Lo sabía, aunque he fingido que no lo fuese."
            Respira profundo.
            "Te conozco desde hace tantos años, he visto tantas cosas. Una relación al final te muestra todo lo que se esconde detrás de la cortina, ¿No?
            Esa es la cosa bella e inquietante. Darse cuenta de las cosas que la otra persona no quiere ver.”
                + “Yo quisiera verlas.”
                + “No sé dónde verlas.”
                + "Tengo miedo de las consecuencias."
                -
            “¿Has intentado responder a la pregunta más simple?”
            Tratas de verla a los ojos.
            “¿Eres un <m>hombre</m>, <m>Pal</m>?”
            Te miras las manos.
            La tensión de las últimas horas es demasiada, la voz de <f>Laura</f> desaparece, cubierta de todos los comentarios que has sentido en tu vida.
            <m>Omar</m> te pregunta si eres maricón, los <m>compañeros/m> de la escuela que te llaman <f>niñita</f>.
            El profesor de deporte que te decía que eres <f>muy delicado</f>, aquella profesora de literatura que exaltaba tu <f>sensibilidad femenina</f>.
            Aquel tipo del autobús que te pregunta "¿por qué tienes <f>las uñas tan limpias</f>?"
            Tu colega que te dice que eres <m>rudo como un albañil</m> pero con la <f>cara</f> de una <f>muñeca</f>.
            Todas las voces que toda tu vida te exigen una aclaratoria, que digas a todos que eres.
            Que les debes a todos, les debes una respuesta.
            ¿Qué eres, <m>lentejuelas</m>?
            ¿Qué eres? #almost_there

            -> bullet_hell_amab_tre
        
        = Respingi
            Pero reprimir ya no funciona más.
            Sientes un calor en la barriga, lo que has sentido es muy bello para reprimirlo.
            Te levantas, caminas por la habitación, buscas algo.
            -> Perdere
            
        
    ===bullet_hell_amab_tre ===
        $bullet_hell_amab_tre$
    -> finale_amab_uno
    
    === bullet_hell_amab_tre_bis ===
        $bullet_hell_amab_tre$
    -> finale_amab_due
        
    === finale_amab_uno ===
        Abres de nuevo los ojos y estás entre los brazos de <f>Laura</f>.
        Tienes los ojos rojos y grandes por las lágrimas.
        Afuera fuegos artificiales y ruido de fiesta, <m>niños</m> que gritan.
        Y allí, detrás de todo el caos, con el cuerpo y la mente vacíos, tienes la respuesta.
            + “No soy un [chico.”]<>
            -
            <m>chico</m>. ni una <f>chica</f>. O algo entre los dos, pero algo más de una cosa. Cómo si continúan a preguntarme si esta cosa es amarilla o verde, pero en realidad es violeta, y ni siquiera sabía que existía el violeta.”
            <f>Laura</f> te mira confundida.
            + “¿Te irás?”
        -
        Te golpea en los hombros, seria.
        “Idiota, no, jamás. Te amo.”
        Se quedan en silencio por un momento, te da una cerveza.
        “¿Es una cosa que haremos juntos, conseguir el violeta, ok? No estás solo, sola, lo que sea. Joder. Estoy aquí. Te amo. Diré estupideces y por esto te pido disculpas, pero, o sea.”
        La silencias con un beso.
            + “¿Vamos a mostrar este yo al mundo?”
            + “¿Sabes que rabia sentirá María[?"] Cuando no será la primera en algo?”
            + “¡Ven[!"], antes que me vuelva la <f>Britney</f> del 2007!”
            -
        "Tengo un plan B: una fiesta de <f>chicas</f> <f>lesbianas</f>, un lugar tranquilo donde estar, deberían estar algunas viejas <f>compañeras</f> de la escuela"
        La manera cómo te mira te hace sentir invencible.
        Caminan juntos por la calle, los dedos entrelazados.
        Estás llene de vida #almost_there
        -> bullet_hell_buono
    
    === finale_amab_due ===
        Cuando abres los ojos, <f>Laura</f> está agachada delante de ti, con los ojos fijos en los tuyos.
        “¡Oye, cariño!”
            + [Apoyas la frente con la de Laura]
            -
        “¿Que cosa sucedió en esta cabecita?”
        Respiras.
            + “¿Ya lo sabías?”
            -
        “Me di cuenta de que desde hace tiempo algo te pasaba por la mente. Me pregunté que habría sucedido si no hubiera salido nunca ese algo, y ninguna de las respuestas me gustaba, para nada.”
        Se sienta al lado tuyo, dejas que te apriete.
        “Sé lo que no soy, <f>Laura</f>. No me siento <m>hombre</m>, pero tampoco <f>mujer</f>. Es como si me preguntaran de escoger entre la manzana y la pera, pero en realidad en mi boca solo quiero frutos del bosque.”
        “¡Las manzanas son aburridas!” bromea Laura.
            + “No cocidas [."] con la azúcar y la canela.”
            -
        “Esta metáfora se está volviendo extraña,” te besa, “pero creo que entendí.”
        “¿Y estás bien así?”
        “¡Al menos ahora cuando la <f>vecina</f> <m>fascista</m> nos llame “<f>lesbianas</f>” puedo decirle que es verdad!”
        Se voltea de golpe.
        “¿Pero no es verdad, ¿verdad? Oh Madre mía, ¿Qué tengo que decir ahora? ¿Entonces ahora no soy <m>hetero</m>?”
        Tomas sus manos.
            + ["Tenemos tiempo."] “Creo que tenemos todo el tiempo del mundo para conseguir estas respuestas, no tenemos que hacerlo esta noche, ¿no?”
            -
        <f>Laura</f> se ríe y se relaja.
        “Tienes razón. Lo importante es solo una cosa: las conseguiremos juntos. Conseguiremos las frutas del bosque y mi heterosexualidad o lo que sea.”
            + “¿Te imaginas a María[?"] que no sabe cómo presentarnos a sus amigos?”
            -
        “Hablando del diablo: ¿Tienes ganas de ir a su fiesta?”
        Te miras al espejo.
        Las lágrimas y la tensión dañaron la <f>peluca</f> y el <f>maquillaje</f>.
        Te sientes bellә cómo jamás en toda tu vida, pero la idea de que te vean tus amigos te asusta.
            + [Mueves la cabeza negando]
            -
        <f>Laura</f> te sonríe.
        "Tengo un Plan B: una fiesta de <f>chicas</f> <f>lesbianas</f>, un sitio tranquilo donde podemos estar, también debería estar un viejo grupo de <f>compañeras</f> de la escuela."
        Sientes un poco de miedo igualmente.
        Pero sientes que has pasado mucho tiempo ocultándote, quieres salir, quieres mostrarte al mundo.
        Agarras a <f>Laura</f> de la mano, con coraje y valor, empiezan a caminar por la calle. #almost_there
        -> bullet_hell_buono



//STORIA PALLINA
    === intro_afab ===
   ~ gender = 1
        “No es necesario, de verdad.”
        La voz de <f>mamá</f> te despierta. Está hablando con la <f>abuela</f>, parece fastidiada.
        Acabas de nacer, pero las tensiones las sientes todas.
            + [Gritas]
            -
        Es la <f>única</f> cosa que sabes hacer cuando algo te da fastidio.
        “¡Tiene hambre!” dice la <f>abuela</f>, las manos firmes al volante. #street
        “Le daré de comer cuando lleguemos a casa sino vomitará, falta poco.”
        La abuela gruñe.
            + [Bostezas]
            -
        Tus ojos se esfuerzan para ver desde la ventana.
Ven un mundo desenfocado, lleno de luces, contornos y siluetas que podrían ser cualquier cosa.
        Cómo tú.
        El carro se detiene.
        “¿Quieres que…?”
        “No”, <f>mamá</f> interrumpe a la <f>abuela</f>, “Ya tenemos todo lo que necesitamos, gracias por traernos.”
        “Es el mínimo por mi <f>nieta</f>.”
        Silencio.
        El carro se aleja.
        <f>Mamá</f> abre la casa, hay olor de encierro y comida vencida.
        “Bienvenida, <f>Pallina</f>.”
        El tono de su voz está lleno de orgullo.
            + [Te chupas el dedo]
            -

        <f>Ella</f> sonríe y te muestra el apartamento, es pequeño, de dos habitaciones.
        “¡Lo sé que es pequeño, pero somos solo nosotras dos, cariño! ¡Dos mujeres contra el mundo!”, ríe.
        “Ok, una y la mitad de una por ahora. Pero aquí”, te muestra un ángulo del cuarto, “está tu cunita”, “aquí están los peluches, y mira este móvil solo para ti.” Y hace girar un grupo de animalitos <f>rosados</f> guindados.
        Hay un zorro sin cola.
            + Tratas de agarrarlo[], esperando de salvarlo.
            -
        <f>Mamá</f> sonríe y te aleja, te quejas con los puñitos.
        “¿Tienes hambre?” te pregunta, se sienta en el mueble.
        Te da el seno.
        “¿Sabes una cosa? Serás la mejor en la escuela, así harás que esté orgullosa. Y te compraré un montón de <f>vestidos de flores</f>, porque cuando era <f>pequeña</f> yo también los quería, a todas le gustan los <f>vestidos de flores</f>.”
        Te cambia de posición.
        “Y después te volverás una <f>doctora</f>, si, tienes las manos de <f>doctora</f>. Quizás <f>Obstétrica</f>, así harás feliz también a tantas <f>mamá</f>s. Aunque yo seré siempre la tuya, siempre.”
        Suspira.
            + [El sueño te agarra]
            -
        “Y quizás cuando te cases con un <m>buen</m> <m>hombre</m> me harás vivir con ustedes, así te ayudaré con mis <m>nietos</m>, y tu podrás continuar trabajando. Y si seré todavía <f>bella</f>...”
        Pero ya estas durmiendo.
        En el sueño ves la calle de antes, el viaje que has hecho.
        Pero no hay más colores, formas ni todas las cosas posibles de antes.
        Solo hay cuadros <m>azules</m>
        triángulos <f>rosados</f>
        Y manos enormes que te aplastan y te tiran, tratando de darte una forma. #people
        -> atto_afab_uno
    
    === atto_afab_uno ===
    Infancia. Primavera. Escuela. #title
        
        Con los pies creas un ritmo imaginario golpeando el suelo.
        “¡<f>Pallina</f>, quédate quieta!”
        <f>Mamá</f> sonríe, pero es una estatua, quiere que tú seas una estatua.
        Una <f>bella</f> estatua con el <f>vestido</f> de flores, los zapatos blancos y el <f>cabello amarrado</f>.
        Ha pasado todo el viaje en automóvil diciéndote que deben dar una buena impresión.
        Que el encuentro <m>padres</m>-profesores es un momento en el cual los <m>padres</m> son juzgados severamente.
        Que una <f>madre</f> <m>soltera</m> es siempre culpable, y por esto no se pueden cometer errores.
       Crees que no tiene sentido, pero confías en <f>ella</f>.
            + [Miras afuera]
            -
        Confías, pero esto no borra el aburrimiento.
        Los <m>niños</m> corren, siguiéndose unos a otros.
        Ese bravucón de <m>Lorenzo</m> trajo una <m>pelota</m>, están creando los equipos.
            + “¿Mamá?”
            -
        Te ignora.
        Del otro lado del patio de recreo tus <f>compañeras</f> de clase conversan.
        Reconoces a <f>Laura</f>, <f>María</f>, <f>Chloe</f> y una del cuarto grado, <f>Emma</f>.
            + “¿Puedo ir al baño?”
            -
        “Fuiste hace dos segundos, cariño.”
        Suspira y te agarra la mano.
        El perfume de <f>mamá</f> es tan <m>fuerte</m> que te provoca dolor de cabeza.
        “¿Si te comportas bien luego te compro un helado, ok?”
        Te da un libro de Miguel de Cervantes, que ojeas sin muchas ganas. #completion_33
        “¡Gooool!” Alguien grita.
        La voz de la <f>hermana</f> <f>Adolorada</f> silencia los gritos de tus <m>compañeros/m>.
        Ellos prometen estar más tranquilos, promesa que se rompe apenas se cierra la ventana de la Hermana <f>Adolorada</f>.
        La <f>hermana</f> se asoma desde una puerta <f>pequeña</f>, llama a tu <f>madre</f>.
        “¿Quédate aquí diez minutos, solo diez minutos ok? Después te daré tu helado.”
            + [Asientes con la cabeza]
            -
        ¿Cuánto duran diez minutos? 
        Cuentas seis respiros. Siete. Decides que son suficientes.
        Te levantas.
            + [Vas a dónde los chicos]
            -> gioco
            + [Vas a donde tus compañeras]
            -> compagne
            
        
            = gioco
                <m>Lorenzo</m> te mira fastidiado, pero <m>lentejuelas</m> se acerca sonriendo.
                “¿Quieres tomar mi puesto?”
                No espera una respuesta, te da la <m>pelota</m> y corre donde están las <f>chicas</f>.
                Uno de quinto grado te da los cinco.
                Escuchas las risas idiotas de <f>María</f> y <f>Chloe</f>.
                “Eres aquella de los penaltis, ¿verdad?”
                    + Aceptas con la cabeza[], escondiendo con dificultad el orgullo.
                    -
                “Toda una fortuna”, comenta <m>Lorenzo</m>.
                “¡Probemos!” dice el de quinta.
                “Estas en mi equipo, ¿ok? Marca <m>Lorenzo</m>, así lo molestamos.”
                Eres muy veloz.
                Tus piernas han acumulado tanta energía mientras esperabas en la silla, que ahora corres cómo un guepardo.
                Te toma dos minutos hacer gol.
                Lorenzo reclama un penalti inexistente.
                    + "¡Cierra tu boca de rana!"
                    -
                Otro gol, después asistes al <m>chico</m> de quinto.
                Sientes que vuelas.
                <m>lentejuelas</m> y <f>Laura</f> te están apoyando. #completion_50
                Sonríes, robas la <m>pelota</m> a <m>Lorenzo</m> que te empuja y caes a tierra.
                El chico de quinto dice algo, pero lo ignoras.
                    + [Le tiras un puño a Lorenzo] 
                -
                Todo es un caos.
                Los <m>chicos</m> se burlan de <m>Lorenzo</m> porque se dejó <m>pegar</m> por una <f>chica</f> .
                Escuchas a <f>Chloe</f> a tus espaldas llamar a la Hermana <f>Adolorada</f>.
                Ves a <m>Lorenzo</m> que se aguanta las ganas de llorar y el cansancio.
                Una mano te agarra la espalda, sientes el perfume dulce. 
                    + [Gruñes]
                    -
                Cómo un globo que se desinfla, dejaste de volar. #completion_70
                La mano es aquella de <f>Mamá</f>, su voz grita que se rompió el <f>vestido</f>, el <f>vestido</f> bueno y Dios mío ¡No!, Los zapatos están mugrientos.
                La <f>hermana</f> <f>Adolorada</f> da la culpa al <m>chico</m> de quinto que le grita.
                <f>María</f> te señala y se ríe.
                “¡Las <f>niñas</f> no hacen eso!”
                ¡Que fastidiosa es María!
                    + [Le sacas la lengua]
                    -
                <f>Mamá</f> te da una cachetada.
                Sientes que estas en el medio de un escenario y todos gritan tu nombre.
                Quieres bajar, pero todos te preguntan: ¿Qué eres <f>Pallina</f>?, ¿qué eres?
                ¿Por qué te comportas cómo un <m>niño</m>?
                ¿Por qué <f>no te vistes como debes</f>?
                ¿Por qué dices <m>groserías</m> y <m>golpeas</m>?
                ¿Por qué eres buena al futbol?
                ¿Qué eres <f>Pallina</f>?, ¿Qué eres? #almost_there
                ->bullet_hell_uno_afab
                
            = compagne
                No es exactamente lo que quisieras hacer, pero es lo más sensato: nada de pelotas es igual a nada de problemas lo que es igual a nada de gritos de <f>mamá</f>.
                “¡Qué lindos zapatos!” comenta <f>María</f>.
                Te miras los pies.
                Te aprietan, solo las usaste para la comunión de tu primo.
                    + “¿De qué hablan?”
                    -
                La respuesta es tan aburrida que la ignoras.
                Miras el balón ir y venir de un lado al otro.
                <m>Lorenzo</m> se luce delante de <m>lentejuelas</m>.
                “¿Por qué los <m>hombres</m> son tan idiotas?”
                Dice Chloe.
                    + “Al menos se divierten.”
                    -
                “<f>Nosotras</f> también, estamos jugando a las <f>princesas</f>, nos falta una.”
                Te mira con esperanza.
                    + [Ignoras la indirecta]
                    -
                “¿Quieres jugar?”
                No tienes ganas, pero tienes una idea.
                    + “¿Te gustaría un desafío?["] Si ganas, jugare a las <f>princesas</f> hasta el final de la escuela.”
                    -
                <f>Chloe</f> te mira con dudas.
                Detrás de ella están llegando las demás niñas. #completion_50
                    + “Sobre aquel árbol[..."]”, indicas un viejo olmo con ramas bajas “Está el registro de la <f>hermana</f> <f>Adolorada</f>. Si lo consigues antes que yo, ganas.”
                    -
                “¿Fuiste tú la que lo robó?” <f>Laura</f> se sorprende.
                Te sientes increíble.
                Sin registro, ninguna prueba de las notas disciplinarias que te ha dado la <f>hermana</f> <f>Adolorada</f>.
                Y las de los demás <m>compañeros/m> de clase.
                “¡Qué <m>machito</m>!” <f>María</f> alza la nariz con disgusto. 
                “¡Pero <f>Chloe</f> es una nerd, seguro después se lo da a las <f>hermanas</f>!”
                <f>Laura</f> no se convence.
                “¡No soy una nerd!”
                    + [Miras a Chloe]
                    -
                Se acerca al árbol, apoya su mano y observa hacia arriba.
                “¿Y si pierdo?”
                    + [Sabes lo que quieres] “Tu y <f>María</f> dejan de obligarme a ser la princesa cada día, y me dejan ser el <m>cazador</m>, o el <m>dragón</m>.”
                    -
                No te espera y empieza a escalar el árbol.
                Te lanzas sobre la rama más baja.
                Es más rápida de lo que habías pensado.
                Astuta, usa los ramos más estrechos y de ese modo no puedes superarla.
                Otros <m>niños</m> están apoyando.
                Los niños gritan tu nombre.
                    + [Saltas sobre un ramo inestable]
                    -
                Lo logras, pero <f>Chloe</f> se recupera de la desventaja. 
                Su <f>vestido</f> se rompe, pero lo ignora.
                Quizás <f>Chloe</f> te está simpática.
                En conjunto con los gritos de los demás <m>niños</m> se unen los gritos de los adultos. #completion_70
                “¡Bajen, inmediatamente!”
                <f>María</f> tiene la mano de <f>hermana</f> <f>Adolorada</f>, y las señala.
                Mamá está furiosa, pero ahora no es momento de detenerte, no quieres perder.
                    + “Ríndete[!"], soy mucho más rápida que tú!”
                    -
                <f>Chloe</f> no te responde.
                Las <f>hermanas</f> y tu <f>mamá</f> están debajo del árbol.
                Chloe grita: tiene el registro en mano.
                    + Te escapa una grosería[]. <f>María</f> se escandaliza.
                    -
                Y después sin aviso, <f>Chloe</f> cae.
                Un momento de silencio comienza a llorar.
                Bajas del árbol a toda velocidad.
                Se ve que se rompió el brazo.
                Y tu <f>mamá</f> parece una bestia de cuanto está molesta.
                Delante de todos te agarra y te lleva con <f>ella</f>.
                Su voz hace eco con la de <f>María</f>.
                Te dice que <f>ella</f> no tiene una <f>hija</f> sino un <m>monstruo</m>, un <m>chico</m>, que solo la avergüenzas, que el <f>vestido</f> está hecho un desastre.
                Te lo dice <f>María</f>, lo dicen las <f>hermanas</f>.
                Te preguntas que eres, <f>Pallina</f>.
                No eres una <f>chica</f>, <f>Pallina</f>. ¿Qué eres?
                ¿Qué eres? #almost_there
                ->bullet_hell_uno_afab
    
    ===bullet_hell_uno_afab===
    $bullet_hell_afab_uno$
    -> atto_afab_due
    
    === atto_afab_due ===
    Adolescencia. Invierno. Liceo. #title
    
        Desde planta baja cualquier risa.
        Hay un silencio extraño: nadie tiene sueño, sin embargo, no hay más nada que decir.
            + “¡Lo logramos!”
            -
        Sentada sobre la mesa pasas el cigarro a <f>Chloe</f>, con una sonrisa tensa.
        Afuera la ciudad está dormida, la plaza está vacía.
        Mañana estará llena de camionetas de la policía, de profesores, cualquier <m>hijo</m> de <m>papá</m>.
        Quizás cualquier periodista aburrido.
        Pero por ahora la plaza está vacía.
        “Tanto problema por “<f>tres lesbianas del coño</f>!”, ¿verdad?”
        Emma se esfuerza de parecer tranquila, pero está temblando.
            + “Estoy orgullosa de ti, Bunny.”
            -
        Y es verdad, porque, aunque con ansiedad y miedo <f>Emma</f>-<f>SuperfandeSailorMoon</f>-<f>Bunny</f> no las ha abandonado jamás, ni siquiera cuando mitad del consejo estudiantil las ha insultado delante de todos.
        Tres <f>lesbianas</f> de mierda.
        Sin embargo, lo lograron, consiguieron más de treinta estudiantes disponibles (que de <m>chicos</m> quedaron solo un par), y la ocupación política de la escuela inició.
        “¿Crees que pueda ayudar a <f>María</f>, todo esto?”
        Chloe te regresa el cigarro.
            + “Al menos sabrá que no está sola.”
            -
        “No podemos hacer más, lamentablemente.”
        <f>Emma</f> mira fuera de la ventana.
        María: suspendida después que el director de la escuela la molestara sexualmente.
            + “¡Mañana el Guagliotti comerá mierda!”
            -
        “Quien sabe si el eterno <m>presidente</m> del Instituto <m>Lorenzo</m> Carademierda Guagliotti admitirá que quizás se deba organizar una autogestión.”
        “Nah, dirá cualquier cosa sobre la legalidad que se debe respetar.”
        Chloe se apoya sobre tu brazo.
            + “Con su legalidad nos golpean[."]. Se la puede meter en el culo.”
            -
        <f>Chloe</f> te mira sonriendo, orgullosa y enamorada.
        <f>Emma</f> lee algo en su mirada.
        No les ha preguntado nunca nada, pero lo sabe.
        “Bajo con las <f>gemelas</f>, trato de dormir un poco.”
        La abrazas.
            + “¡Cuida a las nuevas!”
            + “¡Te quiero mucho, Bunny!”
            + “Si no quieres[...], nadie te juzga.”
            <f>Ella</f> te sonríe, cansado: “Iniciamos <f>juntas</f>, terminamos <f>juntas</f>”.
            -
        “¿Cómo haces para ser tan <f>única</f>?”  #completion_33
        Cuando la puerta se cierra, Chloe te besa.
            + “Me alimenta la rabia del Guagliotti.”[]
            Te besa de nuevo. “Esperaba que fuera merito mío.”
            + “Robo la belleza de las vírgenes.”[]
            “Entonces estoy salvada”, te responde con picardía.
            + “Ignoro mis sentimientos[."], así se marchitan, se vuelven fertilizante y alimentan mis células.”
            “Idiota”, finge de darte una cachetada.
            -
        “¿Qué dirá tu <f>mamá</f>?”
        Te pregunta mientras abre su saco de dormir, tan pequeño que te preguntas si tu cuerpo entra.
            + [Imitas tu madre]
            -
        “¡Porqué yo <f>señorita</f> no te he educado para ser una delincuente! ¡Tengo dos trabajos y uno es solo para pagar los daños que haces, joder!”
        Bromeas, pero quisieras que entendiera que las cosas que haces las haces también por <f>ella</f>, para evitar que historias como la tuya o la de <f>María</f> se sigan repitiendo.
        Pero <f>ella</f> solo quiere que estudies y seas <f>voluntaria</f> en la iglesia. En el futuro quiere que te consigas un <f>marido bueno</f>, ingeniero, tengas <f>dos hijos</f> y un apartamento debajo del suyo.
        Te imaginas que está en casa, sola, preocupada por ti, se te rompe el corazón.
        “Me refería a nosotras.” #completion_50
        La voz de Chloe ahora tiene un tono bajo.
            + “Uh.”
            -
        Bajas del escritorio.
        “¿Qué respuesta es “uh”?”
            + “Todavía no le he dicho de nosotras.”
            -
        “Pero no creo que sea un problema para <f>ella</f>, ¿no? ¡Tiene una foto del Pride del año pasado!”
            + “Es que no estoy segura.”
            -
        “¿De nosotras?”
            + “De mí.”
            -
        <f>Chloe</f> te mira, se detiene mientras se estaba desvistiendo.
        La luz resalta una <f>vieja</f> cicatriz en el brazo y la mirada de una persona lastimada.
        Sabes que hay algo, hay algo que tienes que entender, pero las palabras desaparecen cuando tratas de atrapar esa cosa y hablarla.
            + “Te amo[.“], es lo único que sé.”
            -
        Chloe se acuesta en silencio.
            + “Pero no es suficiente para ti.”
            -
        Te acuestas a su lado. 
        Miras el techo sucio; marcas de zapatos, telarañas, chicles, restos de grasa, un soporte del que cae polvo.
        “La escuela es el lugar del futuro para nuestros jóvenes, un templo de seguridad” Ha gritado el director ayer. Mínimo, todo ese polvo es amianto. #completion_70
        “Es que no entiendo.”
        La voz de <f>Chloe</f> corta el silencio de la habitación.
        “Siempre llega un momento en el que alzas un muro y no me dejas entrar.”
            + ["No quiero decir tonterías."]“Te tengo fuera solo de aquello que no entiendo de mí misma, para no equivocarme y decir estupideces. Necesito tiempo, <f>Chloe</f>.”
            -
        “¿Y esto es un escudo en mi contra?”
        Te lanza la <m>faja del pecho</m>.
        Después de todo un día es una tortura, la espalda está hecha pedazos, pero no te lo quieres quitar.
        Sus dedos entran por debajo, sientes que te mueres.
            + [Tratas de resistir] Tu cuerpo se vuelve de piedra.
            “¿Estas aguantando la respiración?” <f>Chloe</f> te mira impresionada.
            + [Quitas su mano]
            -
        <f>Ella</f> se levanta. Va a la ventana.
        Odias cuando trata de hacerte sentir culpable, peor aun cuando lo logra.
        Te acercas a <f>ella</f>.
        “Todavía con esta historia. No eres un <m>hombre</m>, <f>Pallina</f>. Lo sabría. Me da alergia si los toco. Tu fuerza es de una <f>mujer</f>, tus gemidos...”
        Te acaricia.
            + “No eres tú quien debe decidir que soy.”
            -
        Te sale más <m>fuerte</m> de lo que querías.
        Das la culpa al cansancio, pero sabes que no puedes más. Todo esto te está lastimando.
        Continua a decirte que te ama, pero después actúa como si quisiera algo que no eres.
        “Tienes razón. Pero esto es difícil también para mí.”
        El cuerpo de Chloe regresa a tu lado. Te abraza, pero es como si estuviera años luz de distancia de ti.
            + [La tienes entres tus brazos]
            -
        Cómo un rayo, te llega esta idea, pensamiento, pensamiento que es una certeza.
        Si terminas tu relación con <f>ella</f>, nadie te amará nunca.
        Tienes que tomar una decisión, o entender que tienes que aprender a reconsiderar ciertas cosas.
        Aprender a ignorar.
        ¿Quizás no sea tan importante? ¿No?
        Cuando Chloe inicia a roncar todavía estás allí, los ojos abiertos como dos ventanas y el cerebro blocado en una pregunta, solo una pregunta que se repite una y otra vez.
            + “¿Qué soy?” #almost_there
            -

    -> bullet_hell_due_afab
    
    === bullet_hell_due_afab ===
   $bullet_hell_afab_due$
    -> atto_afab_tre
    
    === atto_afab_tre ===
    Edad adulta. Otoño. Discoteca. #title
    
        Miras a tu <f>madre</f> y <f>Chloe</f> hablan en el balcón del local.
        Todavía no internalizas como las cosas han cambiado.
        <f>Mamá</f> te invita a acompañarla.
        “<f>Chloe</f> me decía que están pensando de ir a España por, o sea...”
        Miras a tu <f>esposa</f>: esta cosa de la <f>maternidad</f> lo ha dicho solo dos noches atrás.
        Ya decidió que tendrán un hijo. aparentemente.
            + [Te quedas en silencio]
            + “Es solo una idea por ahora.”
            + “Es un proceso largo[.“] pero lo estamos pensando.”
            -
        “No veo el momento de ser <f>abuela</f>.”
        Tu <f>mamá</f> está radiante.
        Se mira alrededor.
        “Quizás es momento de que me vaya, pero estoy muy feliz de haberlas ayudado, <f>chicas</f>.”
        Te abraza y se va del local.
        “¿Por qué no te pusiste el <f>vestido</f> que te compré?”
        Chloe mira con fastidio tu suéter negro.
            + “No tuve tiempo[.“]. Los preparativos y todo lo demás...”
            -
        Pero no te responde porque dos mujeres se acercan, vestidas cómo Ellen Degeneres e Portia de Rossi.
        Comienzan a hablar con Chloe de dinero, política, de la hija del asesor, de los trabajos para mejorar el barrio.
            + “¿Cuál es el problema del barrio?”[]. Preguntas sin pensar.
            -
        Chloe te golpea con el codo y te susurra: “Sé gentil, son ellas las que nos financian”.
            + Sonríes a las dos[.] que te miran.
            -
        “Hicieron un <m>buen</m> trabajo, felicitaciones”, dice la falsa Portia.
        “Quizás el título es un poco impersonal”, comenta la falsa Ellen.
        <f>Chloe</f> defiende riendo el nombre de la fiesta, porque obviamente “Halloween sin <m>hombres</m>” lo escogió <f>ella</f>, como el noventa por ciento de las cosas de la fiesta.
        “¿Todo bien?”, Emma interrumpe tus pensamientos.
            + [Aceptas con la cabeza]
            + “Detesto toda esta gente.”
            + Te tapas los oídos[], fingiendo de gritar desesperada.
            -
        <f>Emma</f> mete su brazo debajo del tuyo.
        Está vestida cómo si fuera apenas salida de la ducha, con un gigantesco foulard/toalla en el cabello.
        “¿Puedo hablarte?” 
            + Lanzas una mirada a Chloe[], que está ocupada reverenciando a la pareja.
            -
        La discoteca improvisada ya está llena, cientos de mujeres que celebran, bailan y hablan. #completion_33
Algunas tienen un pin de “Tres <f>lesbianas del coño</f>”.
        <f>Chloe</f> será feliz de todas estas nuevas inscritas.
        Notas que <f>Emma</f> no lleva la suya.
        Te lleva afuera del local, en la parte de atrás.
        Respira profundo, está casi temblando, pero la conoces lo suficiente para saber que no es culpa del frio.
            + “¿Está todo bien Bunny?”
            -
        Pasas tu brazo por detrás de su cuello.
        “Dejaré la asociación.”
        Un golpe frio, imprevisto.
        Ha sido creada por ustedes tres, nacida en los años de protestas, ocupaciones y desfiles, Los Pride, manifestaciones no autorizadas contra el político <m>fascista</m> de turno.
        “Ha dejado de ser el proyecto en el que creíamos, <f>Pallina</f>.
        Esta cosa, es diferente, es el sueño húmedo de <f>Chloe</f>.
        Esta es la gente contra la que hemos luchado, ¿Qué hacen esas dos idiotas aquí?”
            + “Si queremos sobrevivir…”
            -
        “Estas son las palabras de Chloe, joder, mierda. Sabes que te quiero muchísimo, ¿verdad?”
            + [Te quedas en silencio]
            + [Aceptas con la cabeza]
            + “Yo también, Bunny.”
            -
        Te agarra las manos.
        “No eres tú misma, <f>Pallina</f>. Prácticamente obedeces solo a <f>Chloe</f>, no la cuestionas nunca. ¿Dónde está la <f>Pallina</f> que respondía “a la mierda” a todo? ¿Qué trataba de salvar el mundo? ¿Aquella que ha recibido en su mueble millones de <f>chicas</f> botadas de casa?”
        Hay una presión fría en la boca del estómago.
        Has creado un sistema de defensa que últimamente dispara contra todo el mundo, en modo indiscriminado, solo para no ver dentro de ti.
            + Entras en el local[], pero <f>Emma</f> te detiene justo antes de entrar.
            + Dejas la mano de Emma[], buscas un cigarro en tus bolsillos apretados.
            + “Existe quien decide crecer y quien no.”
            Lo dices con malicia, pero <f>ella</f> no suelta.
            -
        “Cariño, no estás bien, desde hace tanto. No sé qué te sucede, sonríes siempre menos, estoy preocupada por ti. Quiero ayudarte, pero no sé cómo hacerlo…”
        En medio de la conversación las detiene el sonido de gritos….
            + Aprovechas para entrar[] y ver que está sucediendo.
            Pero las palabras de <f>Emma</f> se te quedan en la piel.
            -
        “No es un <m>hombre</m>.”
        La voz se silencia de golpe, hasta la música desaparece. #completion_50
        “Las reglas son reglas y…”, es la voz de <f>Chloe</f>, que tiembla.
        Sabes que está molesta. Las dos hienas están detrás, en mano dos martines.
            + [Te acercas]
            -
        “<f>Laura</f>, no importa, vámonos a otro lado.” 
        Reconoces rápidamente las dos personas que están discutiendo con <f>Chloe</f>.
        <f>Laura</f>, tu <f>vieja</f> <f>compañera</f> de escuela, no la habías visto después de los primeros años de liceo.
        Y <m>lentejuelas</m> que, que. No puede leerte la mente, para entender “que” cosa.
        Sabes que en teoría es un disfraz, <f>vestido</f> de rubia, pero te das cuenta que para <m>lentejuelas</m> no es un disfraz.
        Sientes algo frio, de nuevo, en la barriga.
        + [Te acercas a Chloe]
        -
        Pero <f>Emma</f> se mete en el medio.
        “Esto es lo que no debe suceder. Nosotros no somos “esa” cosa.”
        Escuchas <f>Laura</f> decir algo con el tono de quien está cansado de repetir la misma cosa una y otra vez.
        “No es un <m>chico</m>, es una persona no binaria, quiere estar en un sitio tranquilo por la primera vez que sale de casa cómo se siente de verdad, esperaba que no le atacaran con estas palabras aquí, pero parece que no…”
        <f>Laura</f> intercepta tu mirada, te reconoce.
        <f>Chloe</f> se da cuenta que <f>Laura</f> está mirando hacia otro lado.
        Te observa, y con los ojos te suplica que la ayudes.
            + [Sonríes a Laura] -> Pacificazione
            + [Te apoyas a Chloe] -> Durezza
            + [Te vas a tomar algo] -> al_bancone_emma

        
            = Pacificazione
                Saludas, cortésmente, explicas que es un evento particular, que no hay ninguna intención de discriminar a ninguno, que les han pedido solo una cosa, una cosa, que al final ni siquiera tú sabes.
                Más hablas, más se acentúan los murmullos de la gente que habla, gente que se va del local.
                <m>lentejuelas</m> sonríe a <f>Laura</f>.
                “Vámonos cariño, no importa.”
                <f>Laura</f> parece desilusionada mientras se están yendo.
                “¿Conoces a estas personas?” te pregunta <f>Chloe</f>.
                Parece que no las ha reconocido.
                Con el rabillo del ojo ves a Emma que se está saliendo.
                    + [La sigues]
                    -> pre_terzo_bullet_hell_afab
        
            
            = Durezza
                <f>Chloe</f> continua hablando, su rabia siempre más evidente ahora que estás a su lado.
                <m>lentejuelas</m> está delante de ti.
                Te das cuenta que está incomodo por la situación, pero igualmente radiante.
                La manera como mueve los dedos, como sus ojos exploran el espacio.
                La sonrisa que tiene en la boca se ve en el reflejo de la puerta.
                Cómo mueve su cabello largo, dejando a la mano en reposo en su pecho descubierto.
                Ves tu pecho, que tratas siempre de olvidar, de ignorar.
                No usas la <m>faja del pecho</m>, desde que <f>Chloe</f> te ha dicho “O eso, o yo”.
                    + “Váyanse.”
                    -
                Tu voz está llena de rabia.
                    + “No es un puesto para ustedes[."]. No pueden ir a donde quieran, cuando quieran. Es una fiesta privada con reglas claras, nada de que quejarse.”
                    -
                Ves las hienas sonreír satisfechas, <f>Chloe</f> te agarra la mano.
                <f>Laura</f> se gira dándote la espalda y se va.
                Evitas de cruzar miradas con <m>lentejuelas</m>.
                Junto a ellos se van algunas personas, algunas de ellas activistas del grupo.
                <f>Chloe</f> te besa y te agradece.
                Emma se acerca, te mira, y en silencio se va.
                    + [La sigues]
                ->  pre_terzo_bullet_hell_afab
            
            
            = pre_terzo_bullet_hell_afab
            La pierdes rápido entre tantas personas. #completion_70
                La calle está llena de personas y voces, sonidos y colores, pero no está <f>Emma</f>.
                ¿Por qué la estas siguiendo?
                Chloe grita tu nombre.
                    + Aceleras el paso[], la dejas detrás dándole la espalda.
                    -
                Piensas en las palabras de <f>Emma</f>.
                ¿Has traicionado a la persona que eras? ¿Por qué?
                Corriendo tus <f>senos</f> saltan, te recuerda que existen, te sientes incomoda.
                Tu cuerpo te parece enorme, al descubierto.
                Las miradas de las personas siempre listas para observar tu cuerpo, juzgarlo y seccionarlo.
                Decidiendo a través de tu forma, que cosa eres.
                Todos los ojos son aquellos de <f>Chloe</f>.
                    + [Te apoyas sobre un muro]
                    -
                Te hace falta el aire, te sientes incomoda, el frio en el estómago se intensifica, te llena de palabras y juicios, de promesas y amenazas sutiles.
                De <f>Chloe</f> que quiere que tu seas su <f>chica</f>, su <f>mujer</f>, la <f>madre</f> de la <f>hija</f> que quiere tener contigo.
                Hay preguntas que no quieres escuchar porque estás pensando en tu <f>mamá</f>, tu <f>mamá</f> que se tomó treinta años en aceptar que eres <f>lesbiana</f>, ¿Y ahora quieres cambiar todo de nuevo?
                ¿Arriesgando a perderla de nuevo?
                Comienzas a llorar, hasta vaciarte.
                ¿Quién debes ser, para que puedas ser feliz? #almost_there
            -> bullet_hell_tre_afab
            
            = al_bancone_emma
                Te bebes dos shots seguidos. #completion_70
                <f>Emma</f> se acerca.
                “¿No eran nuestras compañeras de escuela aquellas al ingreso?”
                    + Cierras los ojos[.], concentrándote en la música.
                    -
                “¡No es que si no ves las cosas estas desaparecen!”
                    + [Pides otro shot]
                    -
                “<f>Pallina</f>!”, <f>Emma</f> te agarra la mano. “¿Qué sucede?”
                Sientes que te estás rompiendo, sientes que está por ceder algo dentro de ti en cualquier momento.
                Miras a sus ojos, cómo si fueras a decir algo.
                    + [Pero ordenas otro shot]
                    -
                El alcohol llega en un solo golpe, te sientes confundida y nauseabunda.
                El problema al ingreso está alejando a las personas, la música se detuvo, pero tú te das cuenta solo de <f>Emma</f> que te mira con tanta preocupación.
                Te preguntas si <f>ella</f> pueda verte de verdad, ver que eres.
                Porque lo has negado por tanto tiempo y ahora no tienes más respuestas fáciles para darte. 
                    + “No sé quién soy, Bunny.”
                    -
                Te sientes caer, el alcohol altera todo.
                La caída es infinita, alentada por todos los comentarios que has escuchado en tu vida.
                “Debes <f>vestirte de niña</f>!”
                “Esta no es una cosa de <f>chicas</f>.”
                “¿Por qué <m>juegas futbol</m>?”
                “Soy <f>lesbiana</f>, porque tú eres una <f>chica</f>.”
                “Es <m>normal</m> que odies tus <f>senos</f> en una sociedad tan sexualizada.”
                "Solo hay <m>dos géneros</m>."
                "Esto es <m>innatural</m>!"
                Vomitas, con el vómito se rompe ese pedazo de hielo que tenías en el estómago y en el pecho.
                Inicias a lanzar palabras a propulsión, te lastiman, y no tienes la fuerza para reaccionar. #almost_there
                -> bullet_hell_tre_afab
         

    === bullet_hell_tre_afab ===
        $bullet_hell_afab_tre$
    -> finale_afab
    
    === finale_afab ===
        “¡<f>Pallina</f>! ¡Te suplico mírame!”
        Es la voz de Bunny.
            + [Te esfuerzas por abrir los ojos]
            -
        Pesan tanto.
        Estás de rodillas, delante de ti está <f>Emma</f>.
        “¡Joder, me has hecho preocupar un montón!”
        Buscas algo que decir, te das cuenta que hay mucho espacio en tu cabeza.
        Espacio para nuevas palabras.
        El hielo del estómago desapareció.
            + “Bunny.”
            -
        Tu amiga te mira con preocupación.
            + “Tengo miedo.”
            -
        Inicias a llorar, no recuerdas desde cuando no lo hacías.
        Bañas la espalda de <f>Emma</f>, que te abraza con tanta fuerza y te asegura…
        Te asegura que todo estará bien.
        Muy lentamente recuperas tu respiración. Te abres a <f>ella</f>.
        No te habías dado cuenta cuanto tu amistad es tu lugar seguro.
            + “Bunny, no creo ser una [chica."]<f>chica</f>.”
            -
        <f>Ella</f> permanece en silencio, tocándote el cabello.
            + “Y tampoco un [chico."]<m>chico</m>.<>
            Y cuando vi a <m>lentejuelas</m> antes, cuando vi cuanto era feliz en ese momento diferente, he pensado que ese es mi lugar. Y me ha dado miedo.”
            -
        “¿Qué es lo peor que podría ocurrirte si así fuera?”
            + “Perderé a Chloe.”
            -
        “¿Y si dejaras de buscar una respuesta a esta pregunta?”
        Quedas en silencio.
        Te das cuenta que la otra opción es perderte.
            + “Te necesitaré, Emma.”
            -
        “No iré a ninguna parte, pero no me llames más nunca <f>Emma</f> o comienzo a gritar desesperada” 
        Indicas el megafoulard de su vestido, un poco deshecho por la noche ya pasada, por las carreras.
            + “¿Puedo?”
            -
        Te lo pasa, le pides de cerrar los ojos.
        Es inmenso, lo usas para cubrir tus <m>senos</m> apretado, para hacer que desaparezca.
        Agarras el teléfono, ignoras llamadas y mensajes de <f>Chloe</f> y te miras a través de la cámara frontal.
        Es un inicio, pero amas lo que ves.
            + “¿Nos emborrachamos en cualquier sitio?”
            -
        <f>Emma</f> te sonríe, te pasa su chaqueta de cuero.
        “Si quieres, todavía tengo dos latas completas de spray de serpentinas, y se dónde aparcaron el SUV las dos idiotas ricas.”
        Le tomas su mano.
        No te has sentido jamás así de vive cómo ahora. #almost_there
        -> bullet_hell_buono

//FINALI INTERMEDI

    === sconfitta_amab_uno ===
        Gritos te hacen regresar en ti.
        Ves a <f>Pallina</f> con piedras en las manos, sangre en la frente de <m>Lorenzo</m> que grita cosas.
        "¡Ve a llorar con tu mamita!"
        Un autobús fastidiado toca la corneta, obligando a los <m>chicos</m> a moverse de la calle.
        Quedan solo tu y Pallina.
            + Tratas de decir algo[], pero balbuceas con mucha fatiga.
            -
        Pallina busca tu mirada: "Debes..."
            + "¿Golpearlos?"
            Piensas todo lo dicho por <m>Omar</m> recientemente.
            -
        "Ignorarlos."
        Es seria, sus manos en sus caderas como la <f>superheroína</f> de un comic.
        "Primero, porque son unos idiotas. Segundo, porque son unos idiotas y tercero, porque son unos idiotas. ¿Qué te importa que digan ellos?"
            + "Lo pones fácil, tú les gustas a ellos."
            -
        "No siempre, solo cuando quieren jugar."
        Te da la mano, te invita a alzarte.
        "Escuchas siempre lo que dicen la <f>maestra</f> o <f>María</f> o los demás <m>niños</m>, pero no es que ellos sepan más que tú."
            +"Omar dice que tengo que ser como ellos."
            -
        "Ni siquiera <m>Omar</m> lo sabe todo. Mírate.”
        Hace que te gires.
        Tienen una vitrina de un negocio abandonado delante de ustedes.
        "Tú eres tú, punto. Yo soy yo. Punto. Ellos hacen lo que quieren, nosotros hacemos lo que queremos."
        Te miras en la vitrina, y comienzas a ver algo, algo que antes no estaba, algo que estaba cubierto de las palabras de tu <m>hermano</m>, de los <m>niños</m>, de la <f>maestra</f> y de tu <f>madre</f>.
        Sonríes a <f>Pallina</f>, y <f>ella</f> te toma de la mano.
        Te ves a ti misme, le verdadere tú, y le amas. #almost_there
        -> bullet_hell_buono


    === sconfitta_amab_due ===
        Cuando reabres los ojos, te rodean las cosas de la <f>abuela</f>.
        Estás en su cama, voces vienen de la sala.
        Hay un vaso de agua en la mesita de noche, pero cuando tratas de cogerlo se te cae.
        Pasos veloces se acercan al cuarto.
        <f>Laura</f> te abraza, <m>Omar</m> te mira preocupado.
        "¿Qué coño hiciste <m>hermano</m>?"
        Los observas perplejo.
        "Improvisamente te desmayaste. Nos preocupamos."
        <f>Laura</f> te aprieta una mano.
        "Eres de verdad una <f>niñita</f>, <m>Pal</m>!"
        Omar te da un puño en la espalda.
            + "Basta."
            -
        Dura, la palabra llega directo a la <f>cara</f> de <m>Omar</m>, y te parece bien que así sea.
        "Oye, estaba bromeando."
        Estás lucido, palabras claras.
        Te levantas de la cama.
            + "Bas-ta."
            -
        "<m>Pal</m>, ¿Te golpeaste la cabeza?"
        Miras directamente a Omar a los ojos.
            + "Me cansé Omar[."] de tus <m>maricón</m>, <m>gay</m>, <f>mariquita</f>, <f>niñita</f>, <f>lesbianas</f> y demás. Ni siquiera eres original y lastiman. Lastiman mucho."
            -
        "Porque eres..."
            + "Porque no soy tu[."], y está bien. Basta. No tengo que imitarte, no quiero tampoco, ¿Por qué debería?"
            -
        Tu <m>hermano</m> aprieta los labios y los puños.
        "Es momento que me vaya."
            + "¿Omar?"
            -
        Tu hermano se detiene.
            + "Déjame ser quien soy[."], si de verdad me quieres."
            -
        "Si lo hiciera seria como no quererte, porque el mundo te devoraría."
        Miras a Laura, le sonríes.
            + "Quizás tu mundo[]. Pero existen otros mundos donde hay lugar para mí."
            -
        <m>Omar</m> se va.
        <f>Laura</f> te abraza.
        Llora.
        "Te amo."
        La besas mirándole a los ojos.
        Ves tu reflejo en sus lágrimas y finalmente te ves a ti misme y te amas.
        Te amas. #almost_there
        -> bullet_hell_buono
        
        
        
    === sconfitta_afab_uno ===
        Estás en casa con <f>mamá</f>, no ha dicho una palabra en todo el viaje.
        Delante de ustedes hay dos tazas de chocolate caliente, pero nadie se mueve.
        No tienes idea de que estará pensando.
        <f>Mamá</f> respira profundo.
        "¿Estás lista para una discusión entre personas adultas?"
            + Aceptas con la cabeza[], feliz que te había dirigido la palabra.
            -
        "No sé cómo se logra ser una buena <f>madre</f>, <f>Pallina</f>." Suspira. "Seguramente no como la <f>abuela</f> <f>Melina</f>."
        Sonríes.
        "Era bastante rebelde, me metía en un montón de problema, ¿Sabes? Siempre hacia lo que quería, esto la volvía <f>loca</f>."
        Tienes los ojos lucidos.
        "Pero estoy feliz de haberla desobedecido. Diversamente, no sería la persona que soy, y me gusta quien soy. Y no te tendría a ti en mi vida. Sabes que soy feliz de ser tu <f>mamá</f>, ¿verdad?"
            + No sabes si moverte y cómo hacerlo[]. Todos estos discursos son nuevos.
            -
        "Te propongo un acuerdo: tú me dirás que necesitas, que quieres hacer. Yo te diré "no" solo si sé que será peligroso, y tendrás que confiar en mí. En cambio, soportas a las Hermanas hasta el final del año, después cambiamos de escuela."
        Te miras las manos, no sabes que decir. Es la primera vez que te tratan de persona adulta.
        Y te das cuenta que una cosa la sabes.
            + "¿Mamá? Quisiera cortarme el cabello."
            -
        "Esta me parece una petición fácil, tesoro", te mueve tus largos rulos con la mano.
            +"Los quiero cortos cómo Lore."
            -
        <f>Mamá</f> intenta decir algo, pero se detiene.
        "¿Puedo cortártelos yo?"
            + [La coges de la mano]
            -
        Te abraza.
        Cuando se separa tiene los ojos lucidos.
        Te acompaña al baño, y poco a poco empiezan a caer <f>los bucles de cabello</f> y tienes la impresión que una capa empieza a caer.
        Por primera vez tu verdadere ser aparece, y le amas.  #almost_there
    -> bullet_hell_buono
    
    
    
    === sconfitta_afab_due ===
        El despertar es como salir de una pesadilla.
        Afuera hay caos: coros, sirenas, gritos y risas.
        A tu lado está <f>Emma</f>.
        Está leyendo algo, te sonríe cuando te ve despierta, una sonrisa <f>pequeña</f> y triste.
        "<f>Chloe</f> se fue anoche, lo lamento."
        Te lastima más de lo que esperabas.
            + Te alzas y te apoyas a ella[],
            <> Necesitas conforto.
            -
        <f>Ella</f> te aprieta fuertemente, dejándote todo el tiempo del mundo.
        Cuando te separas, te dice que el corteo abajo te espera.
            + "Bunny, ¿Qué crees que soy?"
            -
        "¿En qué sentido?"
            + "No me siento como una [chica."]<f>chica</f>. Y tampoco un <m>chico</m>. O cualquier cosa en el medio. Mas que todo “otra” cosa, diferente. Pero cada vez que lo pienso me hace falta el aire y siento de morir. Y por culpa de esto, <f>Chloe</f> se irá."
            -
        "<f>Chloe</f>...", pero después <f>Emma</f> cambia idea.
        Abre su espejo de <f>maquillaje</f>, ambas se reflejan.
        "Siempre he sabido que me gustan las <f>chicas</f>, pero en casa esta cosa no existía, sabes cuanto son religiosos mis <m>padres</m>. Entendí que había otras <f>chicas</f> como yo solo cuando conocí a <f>Chloe</f> y a ti."
        Suspira.
        "Mis <m>padres</m> podían continuar diciendo que algunas cosas no existían, Pero lo que yo siento y vivo es un hecho. Cuando acepté esto, me vi realmente como soy."
        Gira el espejo hacia ti.
        "Solo tú puedes saber quién eres. Afuera pueden decir que tu no existes, pero es un problema de ellos. No porque <f>Chloe</f> es <f>lesbiana</f> no puede tener prejuicios, pero son problemas de <f>ella</f>. Tú sabes quién eres, y tienes el derecho de decirlo en voz alta, cada que vez que quieras."
            + "¿Cómo eres tan sabia?"
            -
        Sonríes viéndote en el pequeño espejo.
        Te esfuerzas por ignorar las señales del sueño y el cabello desordenado y poco a poco tu <f>cara</f> aparece, tu verdadere <f>cara</f>, le tú de verdad, y le amas.
        Te amas.
        Tu pecho se relaja, si llena de calor.
        De felicidad.
        Eres un núcleo de vida. #almost_there   
        -> bullet_hell_buono

    -> bullet_hell_buono