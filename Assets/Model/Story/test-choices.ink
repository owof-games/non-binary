//Gender: se 1 = AFAB, se 2 = AMAB

VAR gender = 1
-> random

=== random ===
~ gender = RANDOM (1,2)

    {
    - gender == 1:
    -> intro_afab
    - gender == 2: 
    -> intro_amab
    }

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

=== intro_afab ===
Questo è l'intro AFAB
-> resto_della_storia

=== intro_amab ===
Questo è l'intro AMAB
-> resto_della_storia

=== resto_della_storia ===

Infanzia. Estate. Parcogiochi. #title

// -> test_lotta_tags ->

Finalmente ti vedi. #people

$bullet_hell_afab_due$

// Che razza di bambino sei? #almost_there #people

// $bullet_hell_afab_uno$

// E adesso un altro bullet hell

// $bullet_hell_amab_uno$

// Età adulta, autunno, casa vostra #title

// Adolescenza, inverno, da nonna #title

// Frase dopo il bullet hell uno.

->DONE

=== test_scelte ===
Adesso una scelta.

Una scelta.
    + una scelta
    -

Due scelte.
    + scelta uno
    + scelta due con davvero molto testo da scrivere
    -

Tre scelte
    + scelta
    + scelta due con davvero molto testo da scrivere
    + scelta tre
    -

->->

=== test_testi ===
Questo è un testo breve.

Questo è invece un testo bello lungo. Questo è invece un testo bello lungo. Questo è invece un testo bello lungo. Questo è invece un testo bello lungo. Questo è invece un testo bello lungo. Questo è invece un testo bello lungo. Questo è invece un testo bello lungo. Questo è invece un testo bello lungo. Questo è invece un testo bello lungo. Questo è invece un testo bello lungo. 

->->

=== test_lotta_tags ===
<m>furbetto</m> <m>figlio</m> <m>coperte azzurre</m> <m>auto</m> <m>pompiere</m> <m>bulldog</m> <m>pallone</m> <m>principe</m> <m>pal-lin-noooo!</m> <m>uomini</m> <m>fare a pugni</m> <m>menali</m> <m>ragazzino</m> <m>pisellino</m>
<f>estetista</f> <f>principessa</f> <f>femminuccia</f> <f>da donna</f> <f>frocetto</f> <f>feminuccia</f> <f>sembri una ragazza</f>. #people

->->

=== purgatorio ===
Sei arrivato al purgatorio!

$character_creation$

$bullet_hell_finale$

->DONE