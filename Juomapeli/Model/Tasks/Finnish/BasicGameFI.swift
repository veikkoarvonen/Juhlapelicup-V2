//
//  BasicGame.swift
//  Juomapeli
//
//  Created by Valeria Rehokainen on 15.11.2025.
//

import Foundation

struct BasicGameTasksFI {
    static let tasks: [Task] = [
        Task(
            template: "{player1}, haista pelaajan {player2} kainaloa tai ota {penalties} rankaisevaa",
            pointsToScore: 3,
            baselinePenalty: 4
        ),
        Task(
            template: "{player1}, totuus vai tehtävä? {player2} kysyy kysymyksen tai antaa tehtävän vastauksesi perusteella",
            pointsToScore: 2,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, ota rankaiseva ilman käsiä. Jos epäonnistut, ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 2
        ),
        Task(
            template: "{player1}, kerro vitsi. Jos muut pelaajat eivät naura, ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, demonstroi suosikki seksiasentosi pelaajan {player2} kanssa",
            pointsToScore: 4,
            baselinePenalty: 5
        ),
        Task(
            template: "{player1}, Telepatiahaaste! Yrittäkää sanoa pelaajan {player2} kanssa sama sana samaan aikaan. Jos epäonnistutte otatte molemmat {penalties} rankaisevaa. Kategoria: väri",
            pointsToScore: 0,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, aina kun kiroilet, ota rankaiseva loppupelin ajan",
            pointsToScore: 0,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, yritä saada pelaaja {player2} nauramaan 30 sekunnin aikana. Jos epäonnistut, ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, ota paita pois loppupelin ajaksi tai ota {penalties} rankaisevaa",
            pointsToScore: 2,
            baselinePenalty: 4
        ),
        Task(
            template: "{player1}, puhu kolmen kierroksen ajan ilman, että huulesi koskettavat. Jos epäonnistut, ota {penalties} rankaisevaa",
            pointsToScore: 0,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, yritä saada muut pelaajat nauramaan puhumatta. Jos epäonnistut, ota {penalties} rankaisevaa",
            pointsToScore: 2,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, anna paras Hessu Hopo -imitaatiosi tai ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 2
        ),
        Task(
            template: "{player1}, jos sinun pitäisi harrastaa roolileikkiä pelaajan {player2} kanssa, miksi pukeutuisitte? Vastaa tai ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, ota {penalties} rankaisevaa tai poskiläimäisy pelaajalta {player2}",
            pointsToScore: 3,
            baselinePenalty: 4
        ),
        Task(
            template: "{player1}, oletko omasta mielestäsi hyvä sängyssä? Vastaa tai ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, kuiskaa salaisuus pelaajalle {player2}. Jos hän ei reagoi mitenkään, ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 3
        ),
        Task(
            template: "Kertokaa tarina sana kerrallaan, se joka jäätyy ekana ottaa {penalties} rankaisevaa",
            pointsToScore: 0,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, sano 5 kertaa putkeen 'Floridan broileri ja reilu litra maitoa' ilman että kieli menee solmuun, tai ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template: "{player1}, ota rangaistus pelaajan {player2} navasta",
            pointsToScore: 2,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, seuraavan 3 kierroksen ajan, saat puhua vain suu kiinni. Jos epäonnistut, ota {penalties} rankaisevaa",
            pointsToScore: 0,
            baselinePenalty: 4
        ),
        Task(
            template: "{player1}, ota housut pois loppupelin ajaksi tai {penalties} rankaisevaa",
            pointsToScore: 4,
            baselinePenalty: 5
        ),
        Task(
            template: "{player1}, suutele edessäsi olevaa pelaajaa tai ota {penalties} rankaisevaa",
            pointsToScore: 3,
            baselinePenalty: 5
        ),
        Task(
            template: "{player1}, kuvaile viimeisintä katsomaasi aikuisviihdevideota tai ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template: "{player1} ja {player2}, tuijotuskilpailu! Häviäjä ottaa {penalties} rankaisevaa",
            pointsToScore: 0,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, ota pelaaja {player2} reppuselkään ja tee 3 kyykkyä, tai ota {penalties} rankaisevaa",
            pointsToScore: 3,
            baselinePenalty: 5
        ),
        Task(
            template: "{player1}, esitä känniläistä 15 sekuntia tai ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template: "{player1}, näytä seksikkäin ilme jonka osaat tehdä tai ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 4
        ),
        Task(
            template: "{player1}, mikä on mielestäsi epäviehättävin kehonosa vastakkaisella sukupuolella? Vastaa tai ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, tee 10 punnerrusta tai ota {penalties} rankaisevaa",
            pointsToScore: 2,
            baselinePenalty: 3
        ),
        Task(
            template: "{player1}, ota {penalties} rankaisevaa",
            pointsToScore: 1,
            baselinePenalty: 6
        ),
        
        //Free task limit
        
        Task(
        template:"{player1}, röyhtäise tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, niin monta punnerrusta kuin sinä teet, {player2} ottaa rankaisevia",
        pointsToScore: 0,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, freestyle-räppää tästä illasta. Muut pelaajat ovat tuomaristo ja päättävät, selviätkö rangaistukselta ({penalties} rankaisevaa)",
        pointsToScore: 4,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, nuolaise pelaajan {player2} jalkaa tai ota {penalties} rankaisevaa",
        pointsToScore: 4,
        baselinePenalty: 6
        ),
        Task(
        template:"{player1}, laita seuraavat ruumiinosat viehättävyysjärjestykseen: kainalot, varpaat, korvat, tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 2
        ),
        Task(
        template:"{player1}, oudoin asia jonka olet tehnyt seksin aikana? Vastaa tai ota 5 rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, onko sinulla fetissejä? Paljasta ne tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, soita exällesi tai ota {penalties} rankaisevaa",
        pointsToScore: 4,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, näytä viimeisin lähettämäsi viesti tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, imitoi muiden pelaajien valitsemaa julkkista tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, soita tutullesi ja sano että rakastat häntä tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, näytä viimeisin kuva puhelimesi ”Kätketyt” -albumista tai ota {penalties} rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, anna pelaajalle {player2} sylitanssi tai ota {penalties} rankaisevaa",
        pointsToScore: 4,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, juo raaka kananmuna tai ota {penalties} rankaisevaa",
        pointsToScore: 4,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, milloin viimeksi harrastit seksiä? Vastaa tai ota 5 rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, milloin viimeksi masturboit? Vastaa tai ota 5 rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 6
        ),
        Task(
        template:"{player1}, laula pelaajan {player2} valitsemaa biisiä tai ota {penalties} rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, näytä nänni tai ota {penalties} rankaisevaa",
        pointsToScore: 5,
        baselinePenalty: 6
        ),
        Task(
        template:"{player1}, kerro salaisuus tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, oletko kiinnostunut kenestäkään? Vastaa tai ota 3 rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, twerkkaa 10 sekuntia tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, anna paras Mikki Hiiri -imitaatiosi tai ota {penalties} rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, vaihda vaatteita pelaajan {player2} kanssa tai ottakaa molemmat {penalties} rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, seuraavan 3 kierroksen ajan, saat puhua vain laulaen",
        pointsToScore: 0,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, tyynyjuttele tyynylle 30 sekunnin ajan tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, keksi jokaiselle pelaajalle uusi lempinimi tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, imitoi leijonaa 15 sekunnin ajan tai ota {penalties} rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, juo lasi vettä yhdellä kulauksella tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, näytä parhaimmat tanssiliikkeesi seuraavan 15 sekunnin ajan tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, anna pelaajan {player2} laittaa sinulle huulipunaa loppupelin ajaksi tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, kerro nolo muisto. Jos muut pelaajat eivät pidä sitä nolona, ota {penalties} rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, imitoi orgasmia 10 sekunnin ajan tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, ole loppupeli silmät sidottuna tai ota {penalties} rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, freestyle-räppää aiheesta: 'Olen rakastunut pelaajaan {player2}'. Kieltäytymisestä {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, soita vanhemmillesi ja kerro olevasi raskaana, tai ota {penalties} rankaisevaa",
        pointsToScore: 4,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, lähetä tuhmin mahdollinen tekstiviesti pelaajalle {player2} vain emojeita käyttäen. Kieltäytymisestä {penalties} rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 4
        ),
        Task(
        template:"Ottakaa ryhmäkuva. Kieltäytyjä ottaa 4 rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 3
        ),
        Task(
        template:"Ottakaa ryhmäkuva mahdollisimman rumilla ilmeillä. Kieltäytyjä ottaa 4 rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, anna pelaajan {player2} laittaa viestiä puhelimellasi valitsemalleen henkilölle. Jos kieltäydyt, ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, nimeä 10 sekunnissa 5 maata jotka alkavat kirjaimella S tai ota {penalties} rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, nimeä 7 Disney-prinsessaa 15 sekunnissa tai ota {penalties} rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, riisu pelaajan {player2} sukat hampaillasi tai ota {penalties} rankaisevaa",
        pointsToScore: 4,
        baselinePenalty: 6
        ),
        Task(
        template:"{player1}, ulvo suden lailla tai ota {penalties} rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, anna pelaajan {player2} stailata hiuksesi loppupelin ajaksi, tai ota 4 rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, voihkaise aina ennen rankaisevaa loppupelin ajan. Ota aina unohtaessasi {penalties} rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, esitä apinaa 10 sekunnin ajan tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, haista pelaajan {player2} kainaloa tai ota {penalties} rankaisevaa",
        pointsToScore: 4,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, selvitä kenellä pelaajalla on pahin jalkahiki tai ota {penalties} rankaisevaa",
        pointsToScore: 5,
        baselinePenalty: 6
        ),
        Task(
        template:"{player1}, arvaa minkä väriset alushousut pelaajalla {player2} on. Jos arvaat oikein, hän ottaa {penalties} rankaisevaa. Jos väärin, otat itse {penalties}",
        pointsToScore: 1,
        baselinePenalty: 2
        ),
        Task(
        template:"{player1}, soita ilmakitaraa 15 sekunnin ajan eläytyen tai ota {penalties} rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, esitä robottia seuraavan 3 kierroksen ajan tai ota {penalties} rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, imitoi pelaajista valitsemaasi henkilöä niin pitkään, että joku arvaa ketä imitoit tai ota {penalties} rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, tee 10 kyykkyä samalla kun {player2} makaa selällään allasi. Kieltäytymisestä {penalties} rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, murise seksikkäästi tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, anna 30 sekunnin jalkahieronta pelaajalle {player2} tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, yritä laittaa pelaajan {player2} nyrkki omaan suuhusi tai ota {penalties} rankaisevaa",
        pointsToScore: 4,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, yritä nuolaista kyynärpäätäsi. Jos epäonnistut, ota 2 rankaisevaa",
        pointsToScore: 4,
        baselinePenalty: 2
        ),
        Task(
        template:"{player1}, kuori banaani varpaillasi tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, imitoi jotain julkkista kunnes muut pelaajat arvaavat ketä esität. Jos epäonnistut, ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, mene kolmen kierroksen ajaksi nurkkaan istumaan itseksesi tai ota 5 rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, riisu 2 valitsemaasi vaatekappaletta tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 5
        ),
        Task(
        template:"{player1}, jos puhelimesi ruutuaika on suurempi kuin pelaajalla {player2}, ota {penalties} rankaisevaa. Muussa tapauksessa {player2} ota itse {penalties} rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, vastaa kaikkeen 'kyllä' seuraavan minuutin ajan tai ota 5 rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, veikkaa, missä pisteessä jokainen pelaaja on seuraavan 5 vuoden aikana",
        pointsToScore: 1,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, saat puhua vain kuiskaten seuraavan 3 kierroksen ajan. Jos epäonnistut, ota {penalties} rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, twerkkaa 15 sekunnin ajan tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, näytä orgasmi-ilmeesi tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, syö banaani viettelevästi tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, et saa nauraa loppupelin ajan. Jos epäonnistut, ota 5 rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, paras kehonosa vastakkaisella sukupuolella? Vastaa tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 2
        ),
        Task(
        template:"{player1} ja {player2}, kivi-sakset-paperi! Häviäjä ottaa {penalties} rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 2
        ),
        Task(
        template:"Kaikki pelaajat, joilla on siitin, ottavat {penalties} rankaisevaa",
        pointsToScore: 0,
        baselinePenalty: 2
        ),
        Task(
        template:"{player1}, jos olisit peruna, tulisitko mieluummin kuorituksi vai keitetyksi? Vaasta tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 2
        ),
        Task(
        template:"{player1}, monenko ihmisen kanssa olet harrastanut seksiä? Vastaa tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, onko koolla väliä? Vastaa tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 4
        ),
        Task(
        template:"{player1}, mikä on suurin fantasiasi? Vastaa tai ota {penalties} rankaisevaa",
        pointsToScore: 1,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, mikä on kiusallisin tilanne, johon olet joutunut? Vastaa tai ota {penalties} rankaisevaa",
        pointsToScore: 2,
        baselinePenalty: 3
        ),
        Task(
        template:"{player1}, mikä on erikoisin paikka, jossa olet harrastanut seksiä? Vastaa tai ota {penalties} rankaisevaa",
        pointsToScore: 3,
        baselinePenalty: 5
        ),
    ]
}



