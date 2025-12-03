//
//  TeamsFI.swift
//  Juomapeli
//
//  Created by Valeria Rehokainen on 18.11.2025.
//

import Foundation

struct TeamsFITasks {
    
    static let testTemplate = Task(
        template:         "{team} tämä tehtävä on teille. {player1}, olet tässä tiimissä. {player2}, olet vastatiimissä. {penalties} rankaisevaa!",
        pointsToScore: 1,
        baselinePenalty: 3
    )
    
    static let tasks = [
        Task(
            template:         "Pelaaja1 vs. pelaaja2 kädenväännössä! Häviäjän tiimi ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 3
        ),
        Task(
            template:         "Pelaaja1 vs. pelaaja2 tuijotuskilpailussa! Häviäjän tiimi ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 3
        ),
        Task(
            template:         "Se tiimi, joka tekee yhteensä enemmän punnerruksia, voittaa! Häviäjät ottavat {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Se tiimi, joka saa vastustajat ensimmäisenä nauramaan, voittaa! Häviäjät ottavat {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 ja pelaaja1, jos suutelette, vastatiimin jäsenet ottavat {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 ja pelaaja2, jos suutelette, vastatiimin jäsenet ottavat {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Tiimi, jonka kaikki jäsenet koskettavat ensimmäisenä kattoa, voittaa! Häviäjäjoukkue ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs. pelaaja2! Se pelaaja, kumpi suutelee ensimmäisenä joukkuetoveriaan huulille, voittaa! Häviäjät ottavat {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs. pelaaja2, kivi-sakset-paperi! Häviäjän joukkue ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs. pelaaja2! Molemmat ottavat valitsemansa tiimikaverin reppuselkään ja tekevät mahdollisimman monta jalkakyykkyä. Enemmän toistoja tehnyt voittaa. Häviäjän tiimi vetää {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Tiimi1 vs. tiimi2, hiljaa! Ensimmäinen tiimi, jonka jäsen päästää pienenkään äänen, häviää ja ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs. pelaaja2, molemmat seisomaan yhdellä jalalla! Pelaaja, jonka tasapaino pettää  Häviäjän joukkue ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs. pelaaja2, menkää lankkuasentoon! Pidempään lankussa pysyvän joukke voittaa, häviäjän tiimi ottaa{penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs. pelaaja2, peukalopaini! Häviäjän tiimi ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1, sinulla on 30 sekuntia aikaa saada joku vastustajista nauramaan. Jos onnistut, tiiminne voittaa. Häviäjän joukkue ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Tiimi1, laulakaa sana kerrallaan Petri Nygårdin kappaleen “Selvä päivä” kertosäkeistö virheettömästi. Jos onnistutte, vastustajajoukkue ottaa {penalties} rankaisevaa. Epäonnistuessanne otatte itse",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Tiimi1, laulakaa sana kerrallaan Pate Mustajärven kappaleen “Ukkometso” kertosäkeistö virheettömästi. Jos onnistutte, vastustajajoukkue ottaa {penalties} rankaisevaa. Epäonnistuessanne otatte itse",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Tiimi1, laulakaa sana kerrallaan Käärijän kappaleen Cha Cha Cha” kertosäkeistö virheettömästi. Jos onnistutte, vastustajajoukkue ottaa {penalties} rankaisevaa. Epäonnistuessanne otatte itse",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Tiimi1, laulakaa sana kerrallaan JVG:n kappaleen Hehkuu” kertosäkeistö virheettömästi. Jos onnistutte, vastustajajoukkue ottaa {penalties} rankaisevaa. Epäonnistuessanne otatte itse",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Tiimi1, laulakaa sana kerrallaan Cheekin kappaleen “Sokka irti” kertosäkeistö virheettömästi. Jos onnistutte, vastustajajoukkue ottaa {penalties} rankaisevaa. Epäonnistuessanne otatte itse",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:    "Pelaaja1 ja pelaaja2, suudelkaa! Se pelaaja, kumpi lopettaa suutelemisen ensimmäisenä, häviää. Häviäjän tiimi ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs. pelaaja2! Jatkakaa yhdyssanaa mahdollisimman pitkään vuorotellen (esim. Lumipallo, pallomeri, meritähti). Pelaaja, joka jäätyy ensimmäisenä, häviää. Häviäjän joukkue ottaa {penalties} rankaisevaa. Pelaaja1 aloittaa sanalla ‘lasi’",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Tiimi1, telepatiahaaste! Yrittäkää sanoa samaan aikaan sama sana, joka teille tulee mieleen kategoriasta: Päihteet. Jos onnistutte, vastustajajoukkue ottaa {penalties} rankaisevaa. Epäonnistuessanne otatte itse",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Tiimi1, teillä on 20 sekuntia aikaa sanoa 10 elokuvaa, jossa on puhuvia eläimiä. Jos onnistutte, vastustajajoukkue ottaa {penalties} rankaisevaa. Epäonnistuessanne otatte itse",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Tiimi1, teillä on 30 sekuntia aikaa mennä päällekkäin niin, että alin pelaaja on nelinkontin. Jos onnistutte, vastustajajoukkue ottaa {penalties} rankaisevaa. Epäonnistuessanne otatte itse",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Joukkue, jossa on lyhimmät hiukset omaava pelaaja, voittaa! Häviäjätiimi ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Joukkue, jossa on rumimmat varpaat omaava pelaaja, voittaa! Häviäjätiimi ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Joukkue, jonka yhteenlaskettu bodycount on suurin, voittaa! Häviäjätiimi ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Joukkue, jossa on pienimmän käden omaava pelaaja, voittaa! Häviäjätiimi ottaa {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs pelaaja2, olutmerkkejä! Se kumpi jäätyy ensimmäisenä, häviää. Häviäjän tiimi ottaa {penalties} rankaisevaa. Pelaaja1 aloittaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs pelaaja2, S-kirjaimella alkavia maita! Se kumpi jäätyy ensimmäisenä, häviää. Häviäjän tiimi ottaa {penalties} rankaisevaa. Pelaaja1 aloittaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs pelaaja2, energiajuomamerkkejä! Se kumpi jäätyy ensimmäisenä, häviää. Häviäjän tiimi ottaa {penalties} rankaisevaa. Pelaaja1 aloittaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja, matikkaa! Sinulla on 5 sekuntia aikaa suorittaa seuraava laskutoimitus. Jos vastauksesi on oikein, voitatte kierroksen ja säästytte {penalties} rankaisevalta. Mitä on: xxx + xxx",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs pelaaja2, alkuaineita! Se kumpi jäätyy ensimmäisenä, häviää. Häviäjän tiimi ottaa {penalties} rankaisevaa. Pelaaja1 aloittaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs pelaaja2, suomalaisia presidenttejä! Se kumpi jäätyy ensimmäisenä, häviää. Häviäjän tiimi ottaa {penalties} rankaisevaa. Pelaaja1 aloittaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template:         "Pelaaja1 vs pelaaja2, olutmerkkejä! Se kumpi jäätyy ensimmäisenä, häviää. Häviäjän tiimi ottaa {penalties} rankaisevaa. Pelaaja1 aloittaa",
            pointsToScore: 1,
            baselinePenalty: 4
            )
    ]
    
}
