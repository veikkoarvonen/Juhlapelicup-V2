//
//  DatesFI.swift
//  Juomapeli
//
//  Created by Valeria Rehokainen on 16.11.2025.
//

import Foundation

struct DateTasksFI {
    
    func instuctions(startingPlayer: String) -> String {
        let string = "Kysykää vuorotellen toisiltanne kysymys, jonka sovellus arpoo. Kysymyksen jälkeen antakaa puhelin pelaajalle, joka vastasi. \(startingPlayer) aloittaa!"
        return string
    }
    
    static let tasks = [
        
    Task(
    template:"{player1}, kerro jokin red flag itsestäsi",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kerro jokin red flag vastakkaisessa sukupuolessa",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kerro jokin green flag vastakkaisessa sukupuolessa",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, tee jokin olettamus pelaajasta {player2}",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "Laittakaa huulenne vastakkain 3 sekunniksi, mutta älkää suudelko",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kerro itsestäsi 2 totuutta ja yksi valhe. Jos {player2} arvaa valheen, ottaa 3 rankaisevaa",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kerro salaisuus",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kuvaile itseäsi 3 sanalla",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kuvaile pelaajaa {player2} 3 sanalla",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, uskotko johonkin yliluonnolliseen?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on suosikki elokuvasi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä oli lapsuuden haaveammattisi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, ketä julkisuuden henkilöä ihailet?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kerro jokin nolo muisto",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on pahin pelkosi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, raha vai rakkaus?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on mielestäsi paras piirre itsessäsi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, pidätkö itseäsi outona?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on suosikki urheilulajisi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on suurin unelmasi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, milloin viimeksi olet lukenut kirjan?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, uskallatko näyttää puhelimesi kuvagallerian pelaajalle {player2}?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, sano joku biisi jota inhoat",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, sulje silmäsi. Minkä väriset silmät pelaajalla {player2} on? Jos arvaat väärin, ota 3 rankaisevaa",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, jos sinun olisi pakko tatuoida jotain otsaasi, mitä se olisi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, onko sinulla yhtäkään fobiaa?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, onko sinulla fetissejä? Jos kyllä, uskallatko kertoa pelaajalle {player2} niistä?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, demonstroi asento jossa yleensä nukut",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, jos olisitte kävelyllä ja {player2} yhtäkkiä liukastuisi, nauraisitko vai olisitko huolissasi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, miten reagoisit, jos {player2} kosisi sinua nyt?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kuuluuko ananas pizzaan?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on spontaanein asia, jonka olet tehnyt?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, näytä jokin uniikki taito jonka osaat. Jos et osaa mitään, ota 3 rankaisevaa",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on/oli suosikki oppiaineesi koulussa?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on/oli inhokki oppiaineesi koulussa?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kerro jokin mielipiteesi, josta valtaosa on eri mieltä",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, uskotko taikuuteen?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, uskotko rakkauteen ensisilmäyksellä?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä oli ensivaikutelmasi pelaajasta {player2}?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, oletko ikinä ollut rakastunut?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, ovatko ensitreffit yleensä hauskoja vai stressaavia mielestäsi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mitä haet parisuhteelta?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kumpi maksaa ensitreffit?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on parasta sinkkuna olemisessa?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on parasta parisuhteessa olemisessa?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, jos voisit, haluaisitko elää ikuisesti?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on mielestäsi viehättävin piirre vastakkaisessa sukupuolessa?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, miten flirttailet yleensä?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä epäseksuaalinen piirre on sellainen, jota itse pidät viehättävänä?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mitä haluaisit tehdä pelaajan {player2} kanssa yhdessä?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, hiero pelaajan {player2} hartioita 30 sekuntia tai ota 4 rankaisevaa",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on paras iskureplasi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, jos olisit peruna, tulisitko mielummin kuorituksi vai keitetyksi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, onko sinulla luurankoja kaapissa? Mitä ne ovat?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kauanko sinulla menee, että voit olla parisuhteessa täysin oma itsesi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, oletko mieluummin iso lusikka vai pikkulusikka?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, oletko mieluummin alla vai päällä?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, eskimosuutele pelaajaa {player2}",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kenen julkkiksen kanssa menisit naimisiin?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mistä pidät eniten kehossasi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, jos sinulla olisi 24 tuntia aikaa tuhlata miljoona euroa, mihin käyttäisit ne?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, tulisitko mieluummin petetyksi vai pettäisitkö itse?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä koettelemus on vahvistanut sinua ihmisenä?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mitä päihteitä käytät/olet kokeillut?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, uskotko kohtaloon?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, missä haluaisit olla 10 vuoden päästä?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, laita tärkeysjärjestykseen: raha, rakkaus, terveys, vapaus, turvallisuus",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, millaisia piirteitä arvostat kumppanissa eniten?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, miten käsittelet riitatilanteita parisuhteessa?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, miten osoitat rakkauttasi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, jos haluaisit karata näiltä treffeiltä ovelasti, miten tekisit sen olematta töykeä?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä biisi on soinut päässäsi viime aikoina?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on kaikkien aikojen lempikappaleesi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä adjektiivi kuvailisi sinua kaikista eniten?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kerro minulle jokin sisäpiirivitsisi kertomatta kontekstia",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, minkä vuosikymmenen/ajanjakson musiikki on mielestäsi parasta?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, jos saisit valita, mihin maahan lentäisimme yhdessä heti huomenna?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, uskotko horoskooppeihin?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, uskotko Jumalaan?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on paras neuvo, joka sinulle on annettu?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, onko tärkeämpää omistaa 50 kaveria vai 2 hyvää ystävää?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on jokin ärsyttävä piirre itsessäsi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on mieleenpainuvin kehu, jonka olet saanut?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, miksi olet yhä sinkku?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, jos voisit kertoa 10-vuotiaalle itsellesi jonkun neuvon, mikä se olisi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kohtaisitko metsässä mieluummin miehen vai karhun?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, oletko ikinä pissannut julkiseen uima-altaaseen?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mitä biisiä kuuntelet, kun olet surullinen?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, oletko kateellinen kenellekään? Jos olet, kenelle ja miksi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, miten määrittelisit menestymisen?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on mielestäsi paras tapa viettää laatuaikaa kahdestaan?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kuinka tärkeää seksi on sinulle?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on parasta seksissä?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on oudoin asia, jonka olet kokenut petipuuhissa?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, oletko koskaan jättänyt tahallasi avaamatta toisen viestiä, jotta vaikuttaisit kiireiseltä?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mitä mieltä olet yhden illan jutuista?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, mikä on suosikki seksiasentosi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, kuunteletko enemmän sydäntäsi vai päätäsi?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, haluatko perustaa perheen joskus?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, uskotko sielunkumppanuuteen?",
    pointsToScore: 1,
    baselinePenalty: 3
    )
    ]


}
