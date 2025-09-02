//
//  OneTask.swift
//  Juomapeli
//
//  Created by Veikko Arvonen on 23.7.2024.
//

import UIKit

struct SingleTask {
    
/*MARK: game parameters determined by user*/
    
    //players
    var player1: String
    var player2: String
    var color1: UIColor
    var color2: UIColor
    
    //game parameters
    var category: Int
    var tier: Int
    var drinkValue: Float
    var taskIndex: Int
    
    //tasks
    var normalsFI: [String] = []
    var datesFI: [String] = []
    var tier1FI: [String] = []
    var tier2FI: [String] = []
    var tier3FI: [String] = []
    var tier4FI: [String] = []
    var tier5FI: [String] = []
    
    var normalsEN: [String] = []
    var datesEN: [String] = []
    var tier1EN: [String] = []
    var tier2EN: [String] = []
    var tier3EN: [String] = []
    var tier4EN: [String] = []
    var tier5EN: [String] = []
    
    //amount of punishments
    func getNumber(input: Int) -> Int {
        let multiplier = (0.09735) * (drinkValue * drinkValue) + (0.15625)
        let amount = multiplier * Float(input)
        let finalNumber = amount.rounded()
        return Int(finalNumber)
        
    }
    
    func getTask() -> NSAttributedString {
        var taskArray: [String]
        
        let languageManager = LanguageManager()
        
        if languageManager.getSelectedLanguage() == "en" {
            if category == 0 {
                taskArray = normalsEN
            } else if category == 1 {
                taskArray = datesEN
            } else {
                switch tier {
                case 1: taskArray = tier1EN
                case 2: taskArray = tier2EN
                case 3: taskArray = tier3EN
                case 4: taskArray = tier4EN
                case 5: taskArray = tier5EN
                default: taskArray = tier3EN
                }
            }
        } else {
            if category == 0 {
                taskArray = normalsFI
            } else if category == 1 {
                taskArray = datesFI
            } else {
                switch tier {
                case 1: taskArray = tier1FI
                case 2: taskArray = tier2FI
                case 3: taskArray = tier3FI
                case 4: taskArray = tier4FI
                case 5: taskArray = tier5FI
                default: taskArray = tier3FI
                }
            }
        }
        
        
        
        guard taskIndex < taskArray.count else {
            print("Task index out of range!")
            return NSAttributedString(string: "Task index out of range")
        }
        
        let taskString = taskArray[taskIndex]
        
        let attributedString = attributedText(for: taskString, highlight1: player1, highlight2: player2, color1: color1, color2: color2)
        
        return attributedString
    }
    
    func attributedText(for fullText: String, highlight1: String, highlight2: String, color1: UIColor, color2: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Attributes for the highlighted texts
        let highlight1Attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color1,
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]
        let highlight2Attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color2,
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]
        
        // Apply attributes to highlight1
        let highlight1Range = (fullText as NSString).range(of: highlight1)
        if highlight1Range.location != NSNotFound {
            attributedString.addAttributes(highlight1Attributes, range: highlight1Range)
        }
        
        // Apply attributes to highlight2
        let highlight2Range = (fullText as NSString).range(of: highlight2)
        if highlight2Range.location != NSNotFound {
            attributedString.addAttributes(highlight2Attributes, range: highlight2Range)
        }
        
        return attributedString
    }
    
    init(player1: String, player2: String, color1: UIColor, color2: UIColor, category: Int, tier: Int, drinkValue: Float, taskIndex: Int) {
        self.player1 = player1
        self.player2 = player2
        self.color1 = color1
        self.color2 = color2
        self.category = category
        self.tier = tier
        self.drinkValue = drinkValue
        self.taskIndex = taskIndex
   
//MARK: - Finnish tasks
        
//The getNumber function inserts a number in the string calculated by game parameters
        
        self.normalsFI = [
            
            //Free version tasks
            
            
            "\(player1), haista pelaajan \(player2) kainaloa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), totuus vai tehtävä? \(player2) kysyy kysymyksen tai antaa tehtävän vastauksesi perusteella",
            "\(player1), ota 5 rankaisevaa",
            "\(player1), ota rankaiseva ilman käsiä. Jos epäonnistut, ota \(getNumber(input: 2)) rankaisevaa",
            "\(player1), kerro vitsi. Jos muut pelaajat eivät naura, ota \(getNumber(input: 2)) rankaisevaa",
            "\(player1), demonstroi suosikki seksiasentosi pelaajan \(player2) kanssa",
            "\(player1), Telepatiahaaste! Yrittäkää sanoa pelaajan \(player2) kanssa sama sana samaan aikaan. Jos epäonnistutte otatte molemmat \(getNumber(input: 2)) rankaisevaa. Kategoria: väri",
            "\(player1), aina kun kiroilet, ota rankaiseva loppupelin ajan",
            "\(player1), yritä saada pelaaja \(player2) nauramaan 30 sekunnin aikana. Jos epäonnistut, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), ota paita pois loppupelin ajaksi tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), puhu kolmen kierroksen ajan ilman, että huulesi koskettavat. Jos epäonnistut, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), yritä saada muut pelaajat nauramaan puhumatta. Jos epäonnistut, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), anna paras Hessu Hopo -imitaatiosi tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), jos sinun pitäisi harrastaa roolileikkiä pelaajan \(player2) kanssa, miksi pukeutuisitte? Vastaa tai ota 3 rankaisevaa",
            "\(player1), ota \(getNumber(input: 3)) rankaisevaa tai poskiläimäisy pelaajalta \(player2)",
            "\(player1), oletko omasta mielestäsi hyvä sängyssä? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), kuiskaa salaisuus pelaajalle \(player2). Jos hän ei reagoi mitenkään, ota 2 rankaisevaa",
            "Kertokaa tarina sana kerrallaan, se joka jäätyy ekana ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), sano 5 kertaa putkeen 'Floridan broileri ja reilu litra maitoa' ilman että kieli menee solmuun, tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), ota rangaistus pelaajan \(player2) navasta",
            "\(player1), seuraavan 3 kierroksen ajan, saat puhua vain suu kiinni. Jos epäonnistut, ota 3 rankaisevaa",
            "\(player1), ota housut pois loppupelin ajaksi tai \(getNumber(input: 4)) rankaisevaa",
            "\(player1), suutele edessäsi olevaa pelaajaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), kuvaile viimeisintä katsomaasi aikuisviihdevideota tai ota 6 rankaisevaa",
            "\(player1) ja \(player2), tuijotuskilpailu! Häviäjä ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), ota pelaaja \(player2) reppuselkään ja tee 3 kyykkyä, tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), esitä känniläistä 15 sekuntia tai ota \(getNumber(input: 2)) rankaisevaa",
            "\(player1), näytä seksikkäin ilme jonka osaat tehdä tai ota 5 rankaisevaa",
            "\(player1), mikä on mielestäsi epäviehättävin kehonosa vastakkaisella sukupuolella? Vastaa tai ota 3 rankaisevaa",
            "\(player1), tee 10 punnerrusta tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), ota \(getNumber(input: 5)) rankaisevaa",
            
            //Plus version tasks
            
            
            
            
            
            
      
           
           
           
            "\(player1), röyhtäise tai ota \(getNumber(input: 3)) rankaisevaa",
         
            "\(player1), niin monta punnerrusta kuin sinä teet, \(player2) ottaa rankaisevia",
            "\(player1), freestyle-räppää tästä illasta. Muut pelaajat ovat tuomaristo ja päättävät, selviätkö rangaistukselta (\(getNumber(input: 3)) rankaisevaa)",
            "\(player1), nuolaise pelaajan \(player2) jalkaa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), laita seuraavat ruumiinosat viehättävyysjärjestykseen: kainalot, varpaat, korvat, tai ota \(getNumber(input: 2)) rankaisevaa",
            
          
           
        
            
            "\(player1), oudoin asia jonka olet tehnyt seksin aikana? Vastaa tai ota 5 rankaisevaa",
           
            "\(player1), onko sinulla fetissejä? Paljasta ne tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), soita exällesi tai ota \(getNumber(input: 4)) rankaisevaa",
            
            "\(player1), näytä viimeisin lähettämäsi viesti tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), imitoi muiden pelaajien valitsemaa julkkista tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), soita tutullesi ja sano että rakastat häntä tai ota \(getNumber(input: 4)) rankaisevaa",
           
            
            "\(player1), näytä viimeisin kuva puhelimesi ”Kätketyt” -albumista tai ota \(getNumber(input: 4)) rankaisevaa",
           
            "\(player1), anna pelaajalle \(player2) sylitanssi tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), juo raaka kananmuna tai ota \(getNumber(input: 3)) rankaisevaa",
            
            "\(player1), milloin viimeksi harrastit seksiä? Vastaa tai ota 5 rankaisevaa",
            "\(player1), milloin viimeksi masturboit? Vastaa tai ota 5 rankaisevaa",
           
            "\(player1), laula pelaajan \(player2) valitsemaa biisiä tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), näytä nänni tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), kerro salaisuus tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), oletko kiinnostunut kenestäkään? Vastaa tai ota 3 rankaisevaa",
            
           
     
            "\(player1), twerkkaa 10 sekuntia tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), anna paras Mikki Hiiri -imitaatiosi tai ota \(getNumber(input: 3)) rankaisevaa",
            
            
            "\(player1), vaihda vaatteita pelaajan \(player2) kanssa tai ottakaa molemmat \(getNumber(input: 5)) rankaisevaa",
            "\(player1), seuraavan 3 kierroksen ajan, saat puhua vain laulaen",
          
            "\(player1), tyynyjuttele tyynylle 30 sekunnin ajan tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), keksi jokaiselle pelaajalle uusi lempinimi tai ota \(getNumber(input: 2)) rankaisevaa",
            "\(player1), imitoi leijonaa 15 sekunnin ajan tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), juo lasi vettä yhdellä kulauksella tai ota \(getNumber(input: 2)) rankaisevaa",
            "\(player1), näytä parhaimmat tanssiliikkeesi seuraavan 15 sekunnin ajan tai ota \(getNumber(input: 5)) rankaisevaa",
           
            "\(player1), anna pelaajan \(player2) laittaa sinulle huulipunaa loppupelin ajaksi tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), kerro nolo muisto. Jos muut pelaajat eivät pidä sitä nolona, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), imitoi orgasmia 10 sekunnin ajan tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), ole loppupeli silmät sidottuna tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), freestyle-räppää aiheesta: 'Olen rakastunut pelaajaan \(player2)'. Kieltäytymisestä \(getNumber(input: 4)) rankaisevaa",
            "\(player1), soita vanhemmillesi ja kerro olevasi raskaana, tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), lähetä tuhmin mahdollinen tekstiviesti pelaajalle \(player2) vain emojeita käyttäen. Kieltäytymisestä \(getNumber(input: 4)) rankaisevaa",
            "Ottakaa ryhmäkuva. Kieltäytyjä ottaa 4 rankaisevaa",
            "Ottakaa ryhmäkuva mahdollisimman rumilla ilmeillä. Kieltäytyjä ottaa 4 rankaisevaa",
            "\(player1), anna pelaajan \(player2) laittaa viestiä puhelimellasi valitsemalleen henkilölle. Jos kieltäydyt, ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), nimeä 10 sekunnissa 5 maata jotka alkavat kirjaimella S tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), nimeä 10 Disney-prinsessaa 15 sekunnissa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), riisu pelaajan \(player2) sukat hampaillasi tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), ulvo suden lailla tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), anna pelaajan \(player2) stailata hiuksesi loppupelin ajaksi, tai ota 4 rankaisevaa",
            "\(player1), voihkaise aina ennen rankaisevaa loppupelin ajan. Ota aina unohtaessasi \(getNumber(input: 2)) rankaisevaa",
            "\(player1), esitä apinaa 10 sekunnin ajan tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), haista pelaajan \(player2) kainaloa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), selvitä kenellä pelaajalla on pahin jalkahiki tai ota \(getNumber(input: 6)) rankaisevaa",
            "\(player1), arvaa minkä väriset alushousut pelaajalla \(player2) on. Jos arvaat oikein, hän ottaa \(getNumber(input: 3)) rankaisevaa. Jos väärin, otat itse \(getNumber(input: 3))",
            "\(player1), soita ilmakitaraa 15 sekunnin ajan eläytyen tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), esitä robottia seuraavan 3 kierroksen ajan tai ota \(getNumber(input: 6)) rankaisevaa",
            "\(player1), imitoi pelaajista valitsemaasi henkilöä niin pitkään, että joku arvaa ketä imitoit tai ota \(getNumber(input: 6)) rankaisevaa",
            "\(player1), tee 10 kyykkyä samalla kun \(player2) makaa selällään allasi. Kieltäytymisestä \(getNumber(input: 6)) rankaisevaa",
            "\(player1), murise seksikkäästi tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), anna 30 sekunnin jalkahieronta pelaajalle \(player2) tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), yritä laittaa pelaajan \(player2) nyrkki omaan suuhusi tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), yritä nuolaista kyynärpäätäsi. Jos epäonnistut, ota 2 rankaisevaa",
            "\(player1), kuori banaani varpaillasi tai ota \(getNumber(input: 4)) rankaisevaa",
            
            "\(player1), imitoi jotain julkkista kunnes muut pelaajat arvaavat ketä esität. Jos epäonnistut, ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), mene kolmen kierroksen ajaksi nurkkaan istumaan itseksesi tai ota 5 rankaisevaa",
            
            "\(player1), riisu 2 valitsemaasi vaatekappaletta tai ota \(getNumber(input: 4)) rankaisevaa",
            
            "\(player1), jos puhelimesi ruutuaika on suurempi kuin pelaajalla \(player2), ota \(getNumber(input: 3)) rankaisevaa. Muussa tapauksessa \(player2) ota itse \(getNumber(input: 3)) rankaisevaa",
            "\(player1), vastaa kaikkeen 'kyllä' seuraavan minuutin ajan tai ota 5 rankaisevaa",
            "\(player1), veikkaa, missä pisteessä jokainen pelaaja on seuraavan 5 vuoden aikana",
            "\(player1), saat puhua vain kuiskaten seuraavan 3 kierroksen ajan. Jos epäonnistut, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), twerkkaa 15 sekunnin ajan tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), näytä orgasmi-ilmeesi tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), syö banaani viettelevästi tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), et saa nauraa loppupelin ajan. Jos epäonnistut, ota 5 rankaisevaa",
            "\(player1), paras kehonosa vastakkaisella sukupuolella? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1) ja \(player2), kivi-sakset-paperi! Häviäjä ottaa \(getNumber(input: 3)) rankaisevaa",
            "Kaikki pelaajat, joilla on siitin, ottavat \(getNumber(input: 3)) rankaisevaa",
            "\(player1), jos olisit peruna, tulisitko mieluummin kuorituksi vai keitetyksi? Vaasta tai ota \(getNumber(input: 1)) rankaisevaa",
            "\(player1), monenko ihmisen kanssa olet harrastanut seksiä? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), onko koolla väliä?",
            
            "\(player1), mikä on suurin fantasiasi? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), mikä on kiusallisin tilanne, johon olet joutunut? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa",
      
            "\(player1), mikä on erikoisin paikka, jossa olet harrastanut seksiä? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
        ]
        
        self.datesFI = [
            "\(player1), kerro jokin red flag itsestäsi",
            "\(player1), kerro jokin red flag vastakkaisessa sukupuolessa",
            "\(player1), kerro jokin green flag vastakkaisessa sukupuolessa",
            "\(player1), tee jokin olettamus pelaajasta \(player2)",
            "Laittakaa huulenne vastakkain 3 sekunniksi, mutta älkää suudelko",
            "\(player1), kerro itsestäsi 2 totuutta ja yksi valhe. Jos \(player2) arvaa valheen, ottaa 3 rankaisevaa",
            "\(player1), kerro salaisuus",
            "\(player1), kuvaile itseäsi 3 sanalla",
            "\(player1), kuvaile pelaajaa \(player2) 3 sanalla",
            "\(player1), uskotko johonkin yliluonnolliseen?",
            "\(player1), mikä on suosikki elokuvasi?",
            "\(player1), mikä oli lapsuuden haaveammattisi?",
            "\(player1), ketä julkisuuden henkilöä ihailet?",
            "\(player1), kerro jokin nolo muisto",
            "\(player1), mikä on pahin pelkosi?",
            "\(player1), raha vai rakkaus?",
            "\(player1), mikä on mielestäsi paras piirre itsessäsi?",
            "\(player1), pidätkö itseäsi outona?",
            "\(player1), mikä on suosikki urheilulajisi?",
            "\(player1), mikä on suurin unelmasi?",
            "\(player1), milloin viimeksi olet lukenut kirjan?",
            "\(player1), uskallatko näyttää puhelimesi kuvagallerian pelaajalle \(player2)?",
            "\(player1), sano joku biisi jota inhoat",
            "\(player1), sulje silmäsi. Minkä väriset silmät pelaajalla \(player2) on? Jos arvaat väärin, ota 3 rankaisevaa",
            "\(player1), jos sinun olisi pakko tatuoida jotain otsaasi, mitä se olisi?",
            "\(player1), onko sinulla yhtäkään fobiaa?",
            "\(player1), onko sinulla fetissejä? Jos kyllä, uskallatko kertoa pelaajalle \(player2) niistä?",
            "\(player1), demonstroi asento jossa yleensä nuku",
            "\(player1), jos olisitte kävelyllä ja \(player2) yhtäkkiä liukastuisi, nauraisitko vai olisitko huolissasi?",
            "\(player1), miten reagoisit, jos \(player2) kosisi sinua nyt?",
            "\(player1), kuuluuko ananas pizzaan?",
            "\(player1), mikä on spontaanein asia, jonka olet tehnyt?",
            "\(player1), näytä jokin uniikki taito jonka osaat. Jos et osaa mitään, ota 3 rankaisevaa",
            "\(player1), mikä on/oli suosikki oppiaineesi koulussa?",
            "\(player1), mikä on/oli inhokki oppiaineesi koulussa?",
            "\(player1), kerro jokin mielipiteesi, josta valtaosa on eri mieltä",
            "\(player1), uskotko taikuuteen?",
            "\(player1), uskotko rakkauteen ensisilmäyksellä?",
            "\(player1), mikä oli ensivaikutelmasi pelaajasta \(player2)?",
            "\(player1), oletko ikinä ollut rakastunut?",
            "\(player1), ovatko ensitreffit yleensä hauskoja vai stressaavia mielestäsi?",
            "\(player1), mitä haet parisuhteelta?",
            "\(player1), kumpi maksaa ensitreffit?",
            "\(player1), mikä on parasta sinkkuna olemisessa?",
            "\(player1), mikä on parasta parisuhteessa olemisessa?",
            "\(player1), jos voisit, haluaisitko elää ikuisesti?",
            "\(player1), mikä on mielestäsi viehättävin piirre vastakkaisessa sukupuolessa?",
            "\(player1), miten flirttailet yleensä?",
            "\(player1), mikä epäseksuaalinen piirre on sellainen, jota itse pidät viehättävänä?",
            "\(player1), mitä haluaisit tehdä pelaajan \(player2) kanssa yhdessä?",
            "\(player1), hiero pelaajan \(player2) hartioita 30 sekuntia tai ota 4 rankaisevaa",
            "\(player1), mikä on paras iskureplasi?",
            "\(player1), jos olisit peruna, tulisitko mielummin kuorituksi vai keitetyksi?",
            "\(player1), onko sinulla luurankoja kaapissa? Mitä ne ovat?",
            "\(player1), kauanko sinulla menee, että voit olla parisuhteessa täysin oma itsesi?",
            "\(player1), oletko mieluummin iso lusikka vai pikkulusikka?",
            "\(player1), oletko mieluummin alla vai päällä?",
            "\(player1), eskimosuutele pelaajaa \(player2)",
            "\(player1), kenen julkkiksen kanssa menisit naimisiin?",
            "\(player1), mistä pidät eniten kehossasi?",
            "\(player1), jos sinulla olisi 24 tuntia aikaa tuhlata miljoona euroa, mihin käyttäisit ne?",
            "\(player1), tulisitko mieluummin petetyksi vai pettäisitkö itse?",
            "\(player1), mikä koettelemus on vahvistanut sinua ihmisenä?",
            "\(player1), mitä päihteitä käytät/olet kokeillut?",
            "\(player1), uskotko kohtaloon?",
            "\(player1), missä haluaisit olla 10 vuoden päästä?",
            "\(player1), laita tärkeysjärjestykseen: raha, rakkaus, terveys, vapaus, turvallisuus",
            "\(player1), millaisia piirteitä arvostat kumppanissa eniten?",
            "\(player1), miten käsittelet riitatilanteita parisuhteessa?",
            "\(player1), miten osoitat rakkauttasi?",
            "\(player1), jos haluaisit karata näiltä treffeiltä ovelasti, miten tekisit sen olematta töykeä?",
            "\(player1), mikä biisi on soinut päässäsi viime aikoina?",
            "\(player1), mikä on kaikkien aikojen lempikappaleesi?",
            "\(player1), mikä adjektiivi kuvailisi sinua kaikista eniten?",
            "\(player1), kerro minulle jokin sisäpiirivitsisi kertomatta kontekstia",
            "\(player1), minkä vuosikymmenen/ajanjakson musiikki on mielestäsi parasta?",
            "\(player1), jos saisit valita, mihin maahan lentäisimme yhdessä heti huomenna?",
            "\(player1), uskotko horoskooppeihin?",
            "\(player1), uskotko Jumalaan?",
            "\(player1), mikä on paras neuvo, joka sinulle on annettu?",
            "\(player1), onko tärkeämpää omistaa 50 kaveria vai 2 hyvää ystävää?",
            "\(player1), mikä on jokin ärsyttävä piirre itsessäsi?",
            "\(player1), mikä on mieleenpainuvin kehu, jonka olet saanut?",
            "\(player1), miksi olet yhä sinkku?",
            "\(player1), jos voisit kertoa 10-vuotiaalle itsellesi jonkun neuvon, mikä se olisi?",
            "\(player1), kohtaisitko metsässä mieluummin miehen vai karhun?",
            "\(player1), oletko ikinä pissannut julkiseen uima-altaaseen?",
            "\(player1), mitä biisiä kuuntelet, kun olet surullinen?",
            "\(player1), oletko kateellinen kenellekään? Jos olet, kenelle ja miksi?",
            "\(player1), miten määrittelisit menestymisen?",
            "\(player1), mikä on mielestäsi paras tapa viettää laatuaikaa kahdestaan?",
            "\(player1), kuinka tärkeää seksi on sinulle?",
            "\(player1), mikä on parasta seksissä?",
            "\(player1), mikä on oudoin asia, jonka olet kokenut petipuuhissa?",
            "\(player1), oletko koskaan jättänyt tahallasi avaamatta toisen viestiä, jotta vaikuttaisit kiireiseltä?",
            "\(player1), mitä mieltä olet yhden illan jutuista?",
            "\(player1), mikä on suosikki seksiasentosi?",
            "\(player1), kuunteletko enemmän sydäntäsi vai päätäsi?",
            "\(player1), haluatko perustaa perheen joskus?",
            "\(player1), uskotko sielunkumppanuuteen?"
        ]
        
        self.tier1FI = [
            "\(player1), nimeä viisi Jediritaria Tähtiensota-elokuvista tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), jos olisit peruna, tulisitko mieluummin kuorituksi vai keitetyksi?",
            "Jokainen pelaaja, joka on alle 180 cm pitkä, ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), niin monta punnerrusta kuin sinä teet, \(player2) ottaa rankaisevia",
            "\(player1), Telepatiahaaste! Yrittäkää sanoa pelaajan \(player2) kanssa sama sana samaan aikaan. Jos epäonnistutte otatte molemmat \(getNumber(input: 2)) rankaisevaa. Kategoria: väri",
            "Kertokaa tarina sana kerrallaan. Pelaaja, joka jäätyy ensimmäisenä ottaa \(getNumber(input: 3)) rankaisevaa. Aloittakaa myötäpäivään pelaajasta \(player1)",
            "\(player1), veikkaa, missä pisteessä jokainen pelaaja on seuraavan 5 vuoden päästä",
            "\(player1), nimeä 10 sekunnissa 5 maata jotka alkavat kirjaimella S tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), nimeä 10 Disney-prinsessaa 15 sekunnissa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), tee 10 punnerrusta tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), keksi jokaiselle pelaajalle uusi lempinimi",
            "\(player1), imitoi pelaajista valitsemaasi henkilöä niin pitkään, että joku arvaa ketä imitoit",
            "\(player1), kerro jokin paheesi tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), kuuluuko ananas pizzaan?, ota niin monta rankaisevaa kuin pelaajia on eri mieltä kanssasi",
            "\(player1), luettele suomalaisten aakkosten vokaalit takaperin. Jos epäonnistut, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), mainitse jokin hyvä ominaisuus pelaajassa \(player2)",
            "\(player1), nimeä 4 James Bond -näyttelijää 10:ssä sekunnissa. Epäonnistumisesta \(getNumber(input: 3)) rankaisevaa",
            "\(player1), puhu niin monella kielellä jotain järkevää kuin osaat. Jokaista kieltä kohden muut ottavat \(getNumber(input: 2)) rankaisevaa",
            "\(player1) päättää kategorian. Ensimmäinen joka ei osaa nimetä uutta asiaa, ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), sano 5 kertaa putkeen ”mustan kissan paksut posket” ilman että kieli menee solmuun, tai ota 4 rankaisevaa",
            "\(player1), sano 5 kertaa putkeen ”käki istui keskellä keskioksaa” ilman että kieli menee solmuun, tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), sano 5 kertaa putkeen ”yksikseskös yskiskelet, itsekseskös itkeskelet” ilman että kieli menee solmuun, tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), nimeä 10 NATO-maata 10:ssä sekunnissa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), nimeä 5 Suomen maakuntaa 10:ssä sekunnissa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), sano kaksi legendaarista one-lineria Terminator-elokuvasarjasta tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), keksi lempinimi jokaiselle pelaajalle",
            "\(player1), haasta \(player2) kivi, paperi, sakset -peliin. Häviäjälle \(getNumber(input: 3)) rankaisevaa",
            "\(player1), imitoi jotain näyttelijää 10 sekunnin ajan",
            "\(player1), Kerro jokin biisi, jota inhoat? Vastaa tai ota \(getNumber(input: 2)) rankaisevaa.",
            "Vesiputous! \(player1) aloittaa. Edetkää myötäpäivään",
            "\(player1), sano 5 kertaa putkeen ”Floridan broileri ja reilu litra maitoa” ilman että kieli menee solmuun, tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), Millainen oli ensisuudelmasi? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), Kuka on kuumin tietämäsi julkkis? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), Kuka on kuuluisin henkilö, kenen numero sinulla on? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa.",
            "Jokainen pelaaja laulaa sana kerrallaan kappaletta Minttu sekä Ville. Se, joka jäätyy ensimmäisenä, ottaa \(getNumber(input: 3)) rankaisevaa. \(player1) aloittaa",
            "Jokainen pelaaja laulaa sana kerrallaan Mirellan kappaletta Timanttei. Se, joka jäätyy ensimmäisenä, ottaa \(getNumber(input: 3)) rankaisevaa. \(player1) aloittaa",
            "Jokainen pelaaja laulaa sana kerrallaan Kasmirin kappaletta Vadelmavene. Se, joka jäätyy ensimmäisenä, ottaa \(getNumber(input: 3)) rankaisevaa. \(player1) aloittaa",
            "Jokainen pelaaja laulaa sana kerrallaan Käärijän kappaletta Cha cha cha. Se, joka jäätyy ensimmäisenä, ottaa \(getNumber(input: 3)) rankaisevaa. \(player1) aloittaa",
            "Jokainen pelaaja laulaa sana kerrallaan JVG:n kappaletta Ikuinen vappu. Se, joka jäätyy ensimmäisenä, ottaa \(getNumber(input: 3)) rankaisevaa. \(player1) aloittaa",
            "\(player1), päätä, kuka pelaajista ottaa \(getNumber(input: 3)) rankaisevaa",
            "Pelaaja, jolla on pienin jalka, ottaa \(getNumber(input: 3)) rankaisevaa",
            "Pelkäätkö enemmän korkeita vai ahtaita paikkoja? Äänestäkää! Vähemmistö ottaa \(getNumber(input: 4)) rankaisevaa",
            "\(player1), milloin viimeksi nolasit itsesi ja miten? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), seuraavan 3 kierroksen ajan et saa puhua, vaan joudut esittämään asiasi äänettömästi Mr. Beanin tyyliin. Jos epäonnistut tai kieltäydyt, \(getNumber(input: 5)) rankaisevaa",
            "\(player1), sinulla on 10 sekuntia aikaa ottaa käteesi jokin punainen esine. Jos epäonnistut, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), kerro hauska fakta tai tarina pelaajasta \(player2). Jos et keksi mitään, ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), laula Suvivirren ensimmäinen säkeistö virheettömästi. Epäonnistumisesta \(getNumber(input: 4)) rankaisevaa",
            "\(player1), laula Maamme-laulun ensimmäinen säkeistö virheettömästi. Epäonnistumisesta \(getNumber(input: 4)) rankaisevaa",
            "\(player1), sano pelaajan \(player2) kokonimi. Jos et tiedä sitä, on aika ottaa \(getNumber(input: 4)) rankaisevaa ja tutustua pelitoveriisi paremmin",
            "\(player1), tee jokin olettamus pelaajasta \(player2). Jos osut oikeaan, hän ottaa \(getNumber(input: 4)) rankaisevaa. Muuten otat itse \(getNumber(input: 2))",
            "Jokainen pelaaja kertoo vuorollaan vitsin. Jos vitsi ei naurata, ottaa sen kertoja \(getNumber(input: 3)) rankaisevaa. Saatte 15 sekuntia aikaa valmistautua, \(player1) aloittaa",
            "\(player1), mikä on pelaajan \(player2) syntymäpäivä ja -vuosi? Jos arvaat oikein, hän ottaa \(getNumber(input: 5)) rankaisevaa. Jos väärin, otat itse \(getNumber(input: 2))",
        ]
        
        self.tier2FI = [
            "\(player1), Mikä on pisin aikasi pesemättä hampaita? Vastaa tai ota \(getNumber(input: 2)) rankaisevaa.",
            "Pelaaja, jolla on paras peppu, ottaa \(getNumber(input: 4)) rankaisevaa",
            "Pelaaja, jolla on isoin hauis, ottaa \(getNumber(input: 4)) rankaisevaa",
            "\(player1), et saa nauraa loppupelin ajan. Jos epäonnistut, ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), kerro jokin harvinianen asia, jota olet tehnyt. Kaikki ketkä eivät ole tehneet kyseistä asiaa, ottavat \(getNumber(input: 3)) rankaisevaa",
            "\(player1), laita pelaajan \(player2) sukat käsiisi loppupelin ajaksi tai ota \(getNumber(input: 5)) rankaisevaa",
            "Jokainen pelaaja imitoi vauvan ääniä. Huonoiten suoriutunut ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), jos puhelimesi ruutuaika on suurempi kuin pelaajalla \(player2), ota \(getNumber(input: 3)) rankaisevaa. Muussa tapauksessa \(player2) ottaa \(getNumber(input: 3)) rankaisevaa.",
            "\(player2), kerro jokin mielenkiintoinen fakta. Kaikki ketkä eivät tienneet sitä, ottavat \(getNumber(input: 2)) rankaisevaa",
            "\(player1), laita seuraavat ruumiinosat viehättävyysjärjestykseen: kainalot, varpaat, korvat, tai ota \(getNumber(input: 2)) rankaisevaa",
            "Vesiputous! \(player1) aloittaa. Edetkää vastapäivään",
            "\(player1), imitoi jotain vastapelaajista 10 sekunnin ajan",
            "\(player1), haasta pelaaja \(player2) peukalopainiin. Häviäjälle \(getNumber(input: 3)) rankaisevaa",
            "\(player1), keksi hauska lempinimi jokaiselle pelaajalle",
            "\(player1), halaa pelaajaa \(player2)",
            "\(player1), kerro vitsi. Jos muut pelaajat eivät naura, ota \(getNumber(input: 2)) rankaisevaa",
            "\(player1), niin monta punnerrusta kuin sinä teet, \(player2) ottaa rankaisevia",
            "\(player1), tee 10 punnerrusta tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1) ja \(player2), tuijotuskilpailu!. Häviäjä ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), imitoi leijonaa 15 sekunnin ajan",
            "\(player1), anna pelaajan \(player2) stailata hiuksesi loppu pelin ajaksi, tai ota 4 rankaisevaa",
            "\(player1), mikä on kiusallisin tilanne, johon olet joutunut? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), imitoi jotain julkkista kunnes muut pelaajat arvaavat ketä esität. Jos epäonnistut, ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), mikä on suurin fantasiasi? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), kerro paras iskurepliikkisi, jos muut eivät pidä sitä hauskana, ota \(getNumber(input: 2)) rankaisevaa",
            "Jokainen pelaaja päästää vuorollaan oudon äänen. Kieltäytyjä ottaa \(getNumber(input: 4)) rankaisevaa",
            "\(player1), polvistu pelaajan \(player2) eteen ja kosi häntä, tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), kehrää kuin kissa 5 sekunnin ajan tai ota \(getNumber(input: 2)) rankaisevaa",
            "Seuraava pelaaja, joka nauraa ensimmäisenä, ottaa \(getNumber(input: 5)) rankaisevaa!",
            "\(player1), mene nurkkaan häpeämään kolmen vuoron ajaksi",
            "\(player1), Kerro jokin petipuuhiin sopiva biisi tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), freestyle-räppää tästä illasta. Muut pelaajat ovat tuomaristo ja päättävät, selviätkö rangaistukselta \(getNumber(input: 3)) rankaisevaa",
            "\(player1), yritä nuolaista kyynärpäätäsi. Jos epäonnistut, ota \(getNumber(input: 2)) rankaisevaa",
            "\(player1), mikä on penkkimaksimisi? Jaa \(getNumber(input: 1)) rankaisevaa jokaista kymmentä kiloa kohden",
            "\(player1), Telepatiahaaste! Yrittäkää sanoa pelaajan \(player2) kanssa sama sana samaan aikaan. Jos epäonnistutte otatte molemmat \(getNumber(input: 2)) rankaisevaa. Kategoria: automerkki",
            "\(player1), anna paras Hessu Hopo -imitaatiosi tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), soita ilmakitaraa 15 sekunnin ajan tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), saat puhua vain kuiskaten seuraavan 3 kierroksen ajan. Jos epäonnistut, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), yritä saada muut pelaajat nauramaan puhumatta. Jos epäonnistut, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), esitä vauvaa seuraavan \(getNumber(input: 3)) kierroksen ajan tai ota \(getNumber(input: 4)) rankaisevaa",
            "Jokainen pelaaja imitoi jotain eläintä vuorollaan. Huonoiten suoriutunut ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), hyppää niin korkealle kuin pystyt. Jos muut pelaajat ovat vakuuttuneita, säästyt \(getNumber(input: 3)) rankaisevalta",
            
            "\(player1), mene lankku-asentoon minuutiksi. Jos epäonnistut, ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), laula oopperaa 10 sekunnin ajan tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), hyräile valitsemaasi biisiä. Jos muut pelaajat eivät 15 sekunnissa arvaa mikä kappale on kyseessä, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), mikä on kyykkymaksimisi? Jaa \(getNumber(input: 1)) rankaisevaa jokaista kymmentä kiloa kohden",
            "\(player1), jos sykkeesi on korkeampi kuin pelaajalla \(player2), ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), tee 5 kuperkeikkaa tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1) ja \(player2), esittäkää dramaattinen erotilanne keskenänne tai ottakaa \(getNumber(input: 4)) rankaisevaa",
            "\(player1) vastaan \(player2)! Kumpi tekee ensimmäisenä 5 kuperkeikkaa, voittaa. Häviäjä ottaa \(getNumber(input: 4)) rankaisevaa",
            "\(player1), mau'u kissan lailla 10 sekunnin ajan tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), anna näytteesi Tarzanin ikonisesta viidakkohuudosta. Jos et vakuuta muita pelaajia, ota \(getNumber(input: 4)) rankaisevaa",
            "Seuraava pelaaja, joka räpäyttää silmiään, ottaa \(getNumber(input: 4)) rankaisevaa",
            "\(player1), ulvo suden lailla tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), nimeä 5 animesarjaa 10 sekunnissa tai ota \(getNumber(input: 4)) rankaisevaa",
            "Vanhin pelaaja antaa nuorimalle pelaajalle mullistavan elämänohjeen, tai ottaa \(getNumber(input: 3)) rankaisevaa",
            "Jokainen pelaaja kertoo pahimman tekonsa viimeisen viikon aikana. Suurin lurjus ottaa \(getNumber(input: 5)) rankaisevaa",
            "\(player1), pidä kasvosi peruslukemilla seuraavan kahden kierroksen ajan. Jokaista ilmeilyä kohden ota \(getNumber(input: 2)) rankaisevaa",
            "\(player1), kehu pelaajaa \(player1) maasta taivaisiin! Jos saat hänet hymyilemään, säästyt \(getNumber(input: 3)) rankaisevalta. Jos hän punastuu, hän ottaa itse \(getNumber(input: 3))",
            "Jokainen pelaaja esittelee itsensä hauskan faktan kera. Tylsimmän esittelyn esittäjä ottaa \(getNumber(input: 4)) rankaisevaa. \(player1) aloittaa",
        ]
        
        self.tier3FI = [
            "\(player1), Mikä on pisin aikasi ilman suihkua? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa.",
            "Voiko pettämisen antaa anteeksi? Äänestäkää! Vähemmistö ottaa \(getNumber(input: 4)) rankaisevaa",
            "\(player1), nuolaise pelaajan \(player2) napaa tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), suutele jokaisen pelaajan nenää tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), keksi eroottinen lempinimi jokaiselle pelaajalle tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), riisu pelaajan \(player2) sukat hampaillasi tai ota \(getNumber(input: 3)) rankaisevaa",
            "Antakaa vuorotellen poskisuudelma oikealla puolellanne istuvalle pelaajalle. Kieltäytyjälle \(getNumber(input: 5)) rankaisevaa",
            "\(player1), kuiskaa salaisuus pelaajalle \(player2). Jos hän ei reagoi mitenkään, ota \(getNumber(input: 2)) rankaisevaa",
            "\(player1), mikä on suurin fantasiasi? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), puhu kolmen kierroksen ajan ilman, että huulesi koskettavat. Jos epäonnistut, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), päätä, kuka pelaajista ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), sulje silmät ja ojenna etusormesi. \(player2) laittaa valitsemansa kehonosansa sormeasi vasten. Jos arvaat, mikä ruumiinosa on kyseessä, säästyt \(getNumber(input: 4)) rankaisevalta",
            "Jokainen pelaaja voihkaisee kerran. \(player1) aloittaa",
            "\(player1), anna 30 sekunnin jalkahieronta pelaajalle \(player2) tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), ota \(getNumber(input: 3)) rankaisevaa tai poskiläimäisy pelaajalta \(player2)",
            "\(player1), laita seuraavat ruumiinosat viehättävyysjärjestykseen: kainalot, varpaat, korvat",
            "\(player1), niin monta punnerrusta kuin sinä teet, \(player2) ottaa rankaisevia",
            "\(player1), röyhtäise tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), jos sinun pitäisi harrastaa roolileikkiä pelaajan \(player2) kanssa, miksi pukeutuisitte?",
            "\(player1), Oletko ihastunut kehenkään tällähetkellä? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa.",
            "\(player1), Oletko ikinä syönyt räkää? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), tee 10 punnerrusta tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), näytä viimeisin kuva puhelimesi ”Kätketyt” -albumista",
            "\(player1), ota paita pois loppupelin ajaksi tai \(getNumber(input: 4)) rankaisevaa",
            "\(player1), näytä parhaimmat tanssiliikkeesi seuraavan 15 sekunnin ajan tai ota \(getNumber(input: 5)) rankaisevaa",
            "Jokainen pelaaja laulaa sana kerrallaan Irwin Goodmanin kappaletta Ei tippa tapa. Se, joka jäätyy ensimmäisenä, ottaa \(getNumber(input: 3)) rankaisevaa. \(player1) aloittaa",
            "Jokainen pelaaja laulaa sana kerrallaan PMMP:n kappaletta Rusketusraidat. Se, joka jäätyy ensimmäisenä, ottaa \(getNumber(input: 3)) rankaisevaa. \(player1) aloittaa",
            "\(player1) ja \(player2), pitäkää toisianne kädestä kiinni loppupelin ajan. Jos kätenne irtoaa kesken pelin, ottakaa molemmat \(getNumber(input: 5)) rankaisevaa",
            "\(player1), näytä seksikkäin ilme jonka osaat tehdä",
            "\(player1), freestyle-räppää aiheesta: 'Olen rakastunut pelaajaan \(player2)' tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), riisu valitsemasi vaatekappale tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), leikkaa saksilla pieni pala hiuksiasi tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), voihkaise aina ennen rankaisevaa loppupelin ajan",
            "\(player1), mikä on kiusallisin tilanne treffeillä, johon olet joutunut? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), paras kehonosa vastakkaisella sukupuolella? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), anna pelaajan \(player2) kutittaa sinua 10 sekunnin ajan. Jos naurat, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), flirttaile niin monella kielellä jotain järkevää kuin osaat. Jokaista kieltä kohden muut ottavat \(getNumber(input: 2)) rankaisevaa",
            "\(player1), istu pelaajan \(player2) syliin kolmen vuoron ajaksi. Kieltäytyjälle \(getNumber(input: 4)) rankaisevaa",
            "Ota \(getNumber(input: 3)) rankaisevaa, jos voisit harrastaa seksiä jonkun huoneessa olevan pelaajan kanssa",
            "\(player1), vastaa kaikkeen ”kyllä” seuraavan minuutin ajan tai ota 5 rankaisevaa",
            "\(player1), montaako ihmistä olet suudellut? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), oletko omasta mielestäsi hyvä sängyssä? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), mikä on isoin asia, josta olet valehdellut?? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), näytä ahegao-ilmeesi tai ota \(getNumber(input: 4)) rankaisevaa",
            "Jokainen pelaaja esittelee itsensä mahdollisimman seksikkäästi. Kieltäytyjä/alisuoriutuja ottaa \(getNumber(input: 4)) rankaisevaa",
            "\(player1) ja \(player2), vaihtakaa vaatteet keskenänne loppupelin ajaksi (alkkareita lukuunottamatta). Kieltäytyjä ottaa 7 rankaisevaa",
            "Jokainen pelaaja nimeää vuorollaan jonkun seksilelun tai -välineen. Se, joka jäätyy ensimmäisenä, ottaa \(getNumber(input: 4)) rankaisevaa. \(player1) aloittaa",
            "\(player1), haista pelaajan \(player2) korvia tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), vaihda paitaa pelaajan \(player2) kanssa. Kieltäytymisestä \(getNumber(input: 4)) rankaisevaa",
            "\(player1), pomputa rintalihaksiasi yhteensä 10 kertaa. Jos et osaa, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), haista vuorotellen jokaisen pelaajan kaulaa. Pelaaja, joka tuoksuu mielestäsi parhaimmalta, ottaa \(getNumber(input: 4)) rankaisevaa",
            "\(player1) ja \(player2), tehkää yhdessä jooga-asento Vene (Navasana). Jos epäonnistutte, ottakaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), ota \(player2) reppuselkään loppupelin ajaksi. Kieltäytymisestä \(getNumber(input: 6)) rankaisevaa",
            "\(player1), ota \(player2) syliin loppupelin ajaksi. Kieltäytymisestä \(getNumber(input: 6)) rankaisevaa",
            "\(player1), sulje silmät. \(player2) laittaa valitsemansa sormen suuhusi. Jos arvaat mikä sormi on kyseessä, säästyt \(getNumber(input: 3)) rankaisevalta",
            "\(player1), esitä raivostunutta 15 sekunnin ajan. Jos suoriudut muiden mielestä hyvin, säästyt \(getNumber(input: 3)) rankaisevalta",
            "\(player1) ja \(player2), halatkaa toisianne loppupelin ajan niin, että vatsanne ovat jatkuvassa kosketuksessa. Epäonnistumisesta \(getNumber(input: 6)) rankaisevaa",
            "\(player1), esitä känniläistä 15 sekuntia tai ota \(getNumber(input: 2)) rankaisevaa",
            "\(player1), kerro nolo muisto. Jos muut pelaajat eivät pidä sitä nolona, ota \(getNumber(input: 3)) rankaisevaa",
            "Kaikki sinkut ottavat \(getNumber(input: 4)) rankaisevaa, tai suutelevat samaa sukupuolta olevan pelaajan kanssa",
            "\(player1), laita soimaan valitsemasi biisi. Jos joku pelaajista ei tykkää biisistä, ota \(getNumber(input: 2)) rankaisevaa",
            "\(player1), pidätä hengitystäsi 30 sekuntia. Jos epäonnistut, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), kerro paras setämies-vitsisi. Jos muut ei naura, ota \(getNumber(input: 3)) rankaisevaa",
            "Jokainen pelaaja kertoo pahimman tekemänsä rikoksen. Pahin rikollinen ottaa \(getNumber(input: 6)) rankaisevaa",
            "Heteroin pelaaja ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), laita valitsemasi biisi soimaan. Jos se ei saa ketään pelaajaa nauramaan, ota \(getNumber(input: 4)) rankaisevaa",
            "Eniten työttömältä näyttävä pelaaja ottaa \(getNumber(input: 3)) rankaisevaa. Äänestäkää riitatilanteen sattuessa",
            "\(player1), jos sinulla on tatuointeja, näytä niistä yksi ja ota \(getNumber(input: 3)) rankaisevaa",
            "Jokainen itsensä feministiksi luokitteleva pelaaja ottaa \(getNumber(input: 2)) rankaisevaa",
            "Jokainen pelaaja puhuu ja käyttäytyy tästedes kuin mitä kohteliain hienohelma. Ensimmäinen etikettiä rikkova törkysuu ottaa \(getNumber(input: 4)) rankaisevaa",
            "Jokainen pelaaja esittää tästedes liioitellusti vastakkaisen sukupuolen edustajaa. Pelaaja, jolla menee ensimmäisenä maku ottaa \(getNumber(input: 4)) rankaisevaa",
            "\(player1), saat puhua vain englantia loppupelin ajan. Ota tästedes \(getNumber(input: 2)) rankaisevaa jokaista muulla kielellä puhuttua toteamusta kohden",
            "\(player1), esitä että esiinnyt loppuunmyydyllä keikalla ja anna muille pelaajille ennennäkemätön 15 sekunnin show. Jos et saa pelaajilta aplodeja, ota \(getNumber(input: 5)) huikkaa",
            "Parhaimman hiusrajan omaava pelaaja ottaa \(getNumber(input: 3)) rankaisevaa",
            
        ]
        
        self.tier4FI = [
            "\(player1), milloin menetit neitsyytesi? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), vaihda housuja pelaajan \(player2) kanssa. Kieltäytymisestä \(getNumber(input: 4)) rankaisevaa",
            "\(player1), istu pelaajan \(player2) syliin loppupelin ajaksi. Kieltäytyjälle \(getNumber(input: 4)) rankaisevaa",
            "\(player1), kuori banaani varpaillasi tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), mikä on erikoisin paikka, jossa olet harrastanut seksiä? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), yritä laittaa pelaajan \(player2) nyrkki suuhusi tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), anna muille pelaajille viehättävä, 15 sekunnin napatanssi-show tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), näytä orgasmi-ilmeesi tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), syö banaani vietteliäästi tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), oletko omasta mielestäsi hyvä sängyssä? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), milloin viimeksi harrastit seksiä? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), milloin viimeksi masturboit? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), näytä viimeisin lähettämäsi viesti tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), tee 10 punnerrusta tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), suutele edessäsi olevaa pelaajaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), Telepatiahaaste! Yrittäkää sanoa pelaajan \(player2) kanssa sama sana samaan aikaan. Jos epäonnistutte otatte molemmat \(getNumber(input: 2)) rankaisevaa. Kategoria: seksiasento",
            "\(player1), ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), oudoin asia jonka olet tehnyt seksin aikana? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), kuvaile viimeisintä katsomaasi aikuisviihdevideota tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), freestyle-räppää aiheesta: 'Haluan rakastella pelaajan \(player2) kanssa'",
            "\(player1), riisu 2 valitsemaasi vaatekappaletta tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), mikä on kiusallisin tilanne seksin aikana, johon olet joutunut? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), mikä on erikoisin paikka, jossa olet harrastanut seksiä? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), paras kehonosa pelaajalla \(player2)? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), mikä on suurin seksifantasiasi? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), haasta \(player2) kädenvääntöön. Häviäjä ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), Mitkä ovat huonoimmat treffit, joilla olet ollut? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "Kaikki pelaajat joilla on siitin, ottavat \(getNumber(input: 3)) rankaisevaa",
            "\(player1), riisu pelaajan \(player2) paita tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), Mikä on body-counttisi? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), milloin viimeksi harrastit seksiä? Vastaa tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), onko koolla väliä? Vastaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "Jokainen pelaaja suutelee vasemmalla puolellaan olevaa pelaajaa. Kieltäytymisestä \(getNumber(input: 4)) rankaisevaa",
            "\(player1), laske housusi ja nosta alkkarisi niin ylös kuin pystyt, tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), imitoi yhdynnässä olevaa kilpikonnaa. Ota \(getNumber(input: 3)) rankaisevaa, jos imitaatiosi ei miellytä muita pelaajia",
            "\(player1) ja \(player2), tehkää fritsut toistenne rintakehään. Kieltäytyjä ottaa \(getNumber(input: 5)) rankaisevaa",
            "\(player1), kenen pelaajan kanssa harrastaisit mieluiten seksiä? Vastaa rehellisesti tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), laita housusi väärinpäin jalkaan loppupelin ajaksi tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), nylkytä pelaajan \(player2) jalkaa 10 sekunnin ajan tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), julkaise kuva takamuksestasi someen tai ota \(getNumber(input: 4)) rankaisevaa. Saat pitää housut jalassa",
            "Kouraiskaa vuorotellen oikealla puolellanne istuvan pelaajan haaraväliä. Kieltäytyjälle \(getNumber(input: 5)) rankaisevaa. \(player1) aloittaa",
            "Jokainen suutelee oikealla puolellaan olevaa pelaajaa huulille. Kieltäytyjät ottavat \(getNumber(input: 5)) rankaisevaa",
            "\(player1), nuolaise pelaajan \(player2) jalkaa. Kieltäytymisestä \(getNumber(input: 5)) rankaisevaa",
            "\(player1) ja \(player2), suudelkaa. Muut pelaajat ottavat niin monta rankaisevaa, kuin suudelmanne kestää sekkunneissa",
            "\(player1), anna pelaajan \(player2) pukea ylleen rintaliivisi. Jos sinulla ei ole liivejä tai kieltäydyt, ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), käytä kielesi pelaajan \(player2) sieraimessa tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), selvitä kenellä pelaajalla on pahin jalkahiki tai ota \(getNumber(input: 6)) rankaisevaa",
            "\(player1), haista pelaajan \(player2) jalkaa tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), arvaa minkä väriset alushousut pelaajalla \(player2) on. Jos arvaat oikein, hän ottaa \(getNumber(input: 3)) rankaisevaa. Jos väärin, otat itse \(getNumber(input: 3))",
            "\(player1) ja \(player2), laittakaa huulenne vastakkain 15 sekunnin ajaksi, mutta älkää suudelko. Epäonnistumisesta \(getNumber(input: 5)) rankaisevaa",
            "\(player1), milloin viimeksi nolasit itsesi ja miten? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), nuuhkaise pelaajan \(player2) haaroväliä. Kieltäytyjälle \(getNumber(input: 5)) rankaisevaa",
            "\(player1), seuraavan 3 kierroksen ajan et saa puhua, vaan joudut esittämään asiasi äänettömästi Mr. Beanin tyyliin. Jos epäonnistut tai kieltäydyt, \(getNumber(input: 5)) rankaisevaa",
            "\(player1), mielestäsi syntisin pelaaja ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), mille masturboit viimeksi? Vastaa tai ota \(getNumber(input: 5)) rankaisevaa",
            "Jokainen pelaaja kertoo vuorollaan vitsin. Jos vitsi ei naurata, ottaa sen kertoja \(getNumber(input: 3)) rankaisevaa. Saatte 15 sekuntia aikaa valmistautua, \(player1) aloittaa",
            "Jokainen pelaaja riisuu vuorollaan yhden vaatekappaleen. Ensimmäinen, joka lopettaa kesken, ottaa \(getNumber(input: 6)) rankaisevaa. \(player1) aloittaa",
            "Keksikää vuorotellen synonyymi sanalle ”siitin”. Ensimmäinen joka ei keksi uutta, ottaa \(getNumber(input: 3)) rankaisevaa. \(player1) aloittaa",
            
    
            
            
        ]
        
        self.tier5FI = [
            "\(player1), riisu pelaajan \(player2) housut tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), milloin, missä ja miten menetit neitsyytesi? Kerro yksityiskohtaisesti tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), mene pelaajan \(player2) kanssa lusikkaan loppupelin ajaksi. Kieltäytymisestä \(getNumber(input: 4)) rankaisevaa",
            "\(player1), anna pelaajalle \(player2) sylitanssi tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), tee 10 punnerrusta tai ottaa \(getNumber(input: 4)) rankaisevaa",
            "\(player1), Telepatiahaaste! Yrittäkää sanoa pelaajan \(player2) kanssa sama sana samaan aikaan. Jos epäonnistutte otatte molemmat \(getNumber(input: 2)) rankaisevaa. Kategoria: seksilelut",
            "\(player1), kuvaile viimeisintä katsomaasi aikuisviihdevideota yksityiskohtaisesti tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), twerkkaa 10 sekuntia tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), riisuudu alusvaatteillesi loppupelin ajaksi tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), riisu 3 valitsemaasi vaatekappaletta tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), hyväile pelaajan \(player2) parasta kehonosaa 10 sekunnin ajan tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), nuolaise pelaajan \(player2) nänniä tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), näytä paljas takamuksesi tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), suutele pelaajaa \(player2) tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), pieraise tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), tee oudoin ääni jonka osaat tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), aiheuta myötähäpeä muille pelaajille seuraavan 15 sekunnin aikana tai ota \(getNumber(input: 6)) rankaisevaa",
            "\(player1), kaiva pelaajan \(player2) nenää tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), anna pelaajan \(player2) sylkäistä suuhusi tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), kenen pelaajan kanssa harrastaisit mieluiten seksiä? Vastaa tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), hiero molempia nännejäsi ja voihki 5 sekunnin ajan tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), ota pelaajan \(player2) jalka suuhusi tai \(getNumber(input: 3)) rankaisevaa",
            "\(player1), anna pelaajan \(player2) läimäistä sinua takamukselle tai ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), pyllistä muille pelaajille tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), laula kappaletta Ievan Polkka niin hyvin kuin osaat. Muut pelaajat päättävät suorituksesi perusteella, säästytkö \(getNumber(input: 3)) rankaisevalta",
            "\(player1), jos siittimesi on tällä hetkellä pidempi kuin 10 cm, ota \(getNumber(input: 3)) rankaisevaa (älä huijaa)",
            "\(player1), lausu Isä meidän -rukous virheettömästi. Jos epäonnistut, ota \(getNumber(input: 7)) rankaisevaa",
            "\(player1), esitä koiraa seuraavan 3 kierroksen ajan tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1) ja \(player2), kielisuudelkaa tai ottakaa molemmat \(getNumber(input: 5)) rankaisevaa",
            "\(player1) ja \(player2), tuijotuskilpailu! Häviäjä ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), esitä apinaa seuraavan 3 kierroksen ajan tai ota \(getNumber(input: 4)) rankaisevaa",
            "Jokainen pelaaja on nauramatta! Se, joka nauraa ensimmäisenä, ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), tee 10 kainalopierua tai ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), rummuta Aakkoslaulun melodia pelaajan \(player2) pakaroilla. Kieltäytyjä ottaa \(getNumber(input: 5)) rankaisevaa",
            "\(player1) ja \(player2), dry humpatkaa keskenänne 10 sekunnin ajan. Kieltäytyjä ottaa \(getNumber(input: 6)) rankaisevaa",
            "Lyhin pelaaja ottaa \(getNumber(input: 3)) rankaisevaa",
            "\(player1), ota suu täyteen juomaa ja siirrä nesteet omasta suustasi pelaajan \(player2) suuhun. Kieltäytyjä ottaa \(getNumber(input: 5)) rankaisevaa",
            "\(player1), ja \(player2), vaihtakaa alusvaatteenne keskenänne. Kieltäytyjä ottaa \(getNumber(input: 6)) rankaisevaa",
            "\(player1), näytä tissit tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), näytä siittimesi tai ota \(getNumber(input: 6)) rankaisevaa. Jos et omista siitintä, ota \(getNumber(input: 2)) rankaisevaa",
            "\(player1), anna fritsu pelaajalle \(player2). Kieltäytyjä ottaa \(getNumber(input: 5)) rankaisevaa",
            "\(player1) ja \(player2), 7 minutes in heaven. Kieltäytyjälle \(getNumber(input: 5)) rankaisevaa",
            "\(player1) ja \(player2), koskettakaa kielillänne toistenne kieltä. Kieltäytymisestä \(getNumber(input: 5)) rankaisevaa",
            "\(player1) ja \(player2), näyttäkää yhdessä muille pelaajille, miltä lehmityttö-asento näyttää. Kieltäytymisestä \(getNumber(input: 5)) rankaisevaa",
            "\(player1) ja \(player2), näyttäkää yhdessä muille pelaajille, miltä lähetyssaarnaaja-asento näyttää. Kieltäytymisestä \(getNumber(input: 5)) rankaisevaa",
            "\(player1) hyväile pelaajan \(player2) rintakehää 10 sekunnin ajan. Kieltäytymisestä \(getNumber(input: 5)) rankaisevaa",
            "\(player1), sinulla on 10 sekuntia aikaa ottaa käteesi jokin punainen esine. Jos epäonnistut, ota \(getNumber(input: 3)) rankaisevaa",
            "\(player1), kuvaile aikuisviihdevideota, jonka katsomisesta sinulle on tullut isoin morkkis. Tai ota \(getNumber(input: 5)) rankaisevaa",
            "\(player1), kerro hauska fakta tai tarina pelaajasta \(player2). Jos et keksi mitään, ota \(getNumber(input: 4)) rankaisevaa",
            "\(player1), laula Suvivirren ensimmäinen säkeistö virheettömästi. Epäonnistumisesta \(getNumber(input: 4)) rankaisevaa",
            "\(player1), laula Maamme-laulun ensimmäinen säkeistö virheettömästi. Epäonnistumisesta \(getNumber(input: 4)) rankaisevaa",
            "\(player1), pidä kasvosi peruslukemilla seuraavan kahden kierroksen ajan. Jokaista ilmeilyä kohden ota \(getNumber(input: 2)) rankaisevaa",
             "Keksikää vuorotellen synonyymi sanalle ”emätin”. Ensimmäinen joka ei keksi uutta, ottaa \(getNumber(input: 3)) rankaisevaa. \(player1) aloittaa",
        ]
        
//MARK: - English tasks
        
      
        self.normalsEN = [
        "\(player1), smell \(player2)'s armpit or take \(getNumber(input: 3)) penalties",
        "\(player1), truth or dare? \(player2) will ask you a question or give you a dare based on your answer",
        "\(player1), take 5 penalties",
        "\(player1), take a sip without using your hands. If you fail, take \(getNumber(input: 2)) penalties",
        "\(player1), tell a joke. If other players don't laugh, take \(getNumber(input: 2)) penalties",
        "\(player1), demonstrate your favorite sex position with \(player2) or take \(getNumber(input: 3)) penalties",
        "\(player1), Telepathy challenge! Try to say the same word as \(player2) at the same time. If you fail, you both take \(getNumber(input: 2)) penalties. Category: color",
        "\(player1), every time you swear, take a penalty for the rest of the game",
        "\(player1), try to make \(player2) laugh in 30 seconds. If you fail, take \(getNumber(input: 3)) penalties",
        "\(player1), take off your shirt for the rest of the game or take \(getNumber(input: 4)) penalties",
        "\(player1), talk for the next 3 rounds without letting your lips touch. If you fail, take \(getNumber(input: 3)) penalties",
        "\(player1), try to make other players laugh without speaking. If you fail, take \(getNumber(input: 3)) penalties",
        "\(player1), give your best Goofy impression or take \(getNumber(input: 4)) penalties",
        "\(player1), if you had to roleplay with \(player2), what would you both dress up as? Answer or take 3 penalties",
        "\(player1), take \(getNumber(input: 3)) penalties or a slap on the cheek from \(player2)",
        "\(player1), do you think you're good in bed? Answer or take \(getNumber(input: 4)) penalties",
        "\(player1), whisper a secret to \(player2). If they don't react, take 2 penalties",
        "Tell a story one word at a time, whoever freezes first takes \(getNumber(input: 3)) penalties. \(player1) starts",
        "\(player1), say 'Peter Piper picked a peck of pickled peppers' 5 times fast without twisting your tongue or take \(getNumber(input: 3)) penalties",
        "\(player1), take a sip of drink from \(player2)'s bellybutton",
        "\(player1), for the next 3 rounds, you may only talk with your mouth closed. If you fail, take 3 penalties",
        "\(player1), take off your pants for the rest of the game or take \(getNumber(input: 4)) penalties",
        "\(player1), kiss the player in front of you or take \(getNumber(input: 4)) penalties",
        "\(player1), describe the last NSFW video you watched or take 6 penalties",
        "\(player1) and \(player2), staring contest! Loser takes \(getNumber(input: 3)) penalties",
        "\(player1), carry \(player2) on your back and do 3 squats, or take \(getNumber(input: 5)) penalties",
        "\(player1), act drunk for 15 seconds or take \(getNumber(input: 2)) penalties",
        "\(player1), show your sexiest facial expression or take 5 penalties",
        "\(player1), what's the most unattractive body part on the opposite sex? Answer or take 3 penalties",
        "\(player1), do 10 push-ups or take \(getNumber(input: 4)) penalties",
        "\(player1), take \(getNumber(input: 5)) penalties",

        // Plus version tasks

        "\(player1), burp or take \(getNumber(input: 3)) penalties",
        "\(player1), however many push-ups you do, \(player2) takes that many penalties",
        "\(player1), freestyle rap about tonight. The other players are the jury and decide if you avoid \(getNumber(input: 3)) penalties",
        "\(player1), lick \(player2)'s foot or take \(getNumber(input: 3)) penalties",
        "\(player1), rank these body parts by attractiveness: armpits, toes, ears, or take \(getNumber(input: 2)) penalties",

        "\(player1), what's the weirdest thing you've done during sex? Answer or take 5 penalties",
        "\(player1), do you have any fetishes? Reveal them or take \(getNumber(input: 4)) penalties",
        "\(player1), call your ex or take \(getNumber(input: 4)) penalties",
        "\(player1), show your last sent message or take \(getNumber(input: 3)) penalties",
        "\(player1), imitate a celebrity chosen by other players or take \(getNumber(input: 3)) penalties",
        "\(player1), call an acquaintance and tell them you love them or take \(getNumber(input: 4)) penalties",
        "\(player1), show the latest photo from your 'Hidden' album or take \(getNumber(input: 4)) penalties",
        "\(player1), give \(player2) a lap dance or take \(getNumber(input: 4)) penalties",
        "\(player1), drink a raw egg or take \(getNumber(input: 3)) penalties",
        "\(player1), when was the last time you had sex? Answer or take 5 penalties",
        "\(player1), when was the last time you masturbated? Answer or take 5 penalties",
        "\(player1), sing a song chosen by \(player2) or take \(getNumber(input: 3)) penalties",
        "\(player1), show one of your nipples or take \(getNumber(input: 3)) penalties",
        "\(player1), tell a secret to everyone or take \(getNumber(input: 3)) penalties",
        "\(player1), are you interested in someone? Answer or take 3 penalties",
        "\(player1), twerk for 10 seconds or take \(getNumber(input: 5)) penalties",
        "\(player1), give your best Mickey Mouse impression or take \(getNumber(input: 3)) penalties",
        "\(player1), swap clothes with \(player2) or both take \(getNumber(input: 5)) penalties",
        "\(player1), for the next 3 rounds, you can only speak by singing. Otherwise you take 5 penalties",
        "\(player1), have a pillow talk with a pillow for 30 seconds or take \(getNumber(input: 4)) penalties",
        "\(player1), come up with a new nickname for every player or take \(getNumber(input: 2)) penalties",
        "\(player1), imitate a lion for 15 seconds or take \(getNumber(input: 4)) penalties",
        "\(player1), drink a glass of water in one go or take \(getNumber(input: 2)) penalties",
        "\(player1), show your best dance moves for 15 seconds or take \(getNumber(input: 5)) penalties",
        "\(player1), let \(player2) put lipstick on you for the rest of the game or take \(getNumber(input: 3)) penalties",
        "\(player1), share an embarrassing memory. If others don't find it embarrassing, take \(getNumber(input: 3)) penalties",
        "\(player1), fake an orgasm for 10 seconds or take \(getNumber(input: 5)) penalties",
        "\(player1), stay blindfolded for the rest of the game or take \(getNumber(input: 4)) penalties",
        "\(player1), freestyle rap about: 'I'm in love with \(player2)'. Refusing = \(getNumber(input: 4)) penalties",
        "\(player1), call your parents and tell them you're pregnant, or take \(getNumber(input: 5)) penalties",
        "\(player1), send the naughtiest possible message to \(player2) using only emojis. Refusing = \(getNumber(input: 4)) penalties",
        "Take a group photo. Anyone refusing takes 4 penalties",
        "Take a group photo with the ugliest faces you can make. Anyone refusing takes 4 penalties",
        "\(player1), let \(player2) send a message to anyone from your phone. If you refuse, take \(getNumber(input: 4)) penalties",
        "\(player1), name 5 countries starting with S in 10 seconds or take \(getNumber(input: 3)) penalties",
        "\(player1), name 10 Disney princesses in 15 seconds or take \(getNumber(input: 3)) penalties",
        "\(player1), remove \(player2)'s socks with your teeth or take \(getNumber(input: 4)) penalties",
        "\(player1), howl like a wolf or take \(getNumber(input: 5)) penalties",
        "\(player1), let \(player2) style your hair for the rest of the game or take 4 penalties",
        "\(player1), moan every time you take a penalty for the rest of the game. If you forget, take \(getNumber(input: 2)) penalties",
        "\(player1), act like a monkey for 10 seconds or take \(getNumber(input: 5)) penalties",
        "\(player1), smell \(player2)'s armpit or take \(getNumber(input: 4)) penalties",
        "\(player1), find out who has the smelliest feet or take \(getNumber(input: 6)) penalties",
        "\(player1), guess what color underwear \(player2) is wearing. If correct, they take \(getNumber(input: 3)) penalties, if wrong, you take \(getNumber(input: 3)) penalties",
        "\(player1), play an air guitar for 15 seconds with passion or take \(getNumber(input: 4)) penalties",
        "\(player1), act like a robot for the next 3 rounds or take \(getNumber(input: 6)) penalties",
        "\(player1), imitate a player until someone guesses who it is or take \(getNumber(input: 6)) penalties",
        "\(player1), do 10 squats while \(player2) lies on their back beneath you. Refusing = \(getNumber(input: 6)) penalties",
        "\(player1), growl sexily or take \(getNumber(input: 5)) penalties",
        "\(player1), give \(player2) a 30-second foot massage or take \(getNumber(input: 4)) penalties",
        "\(player1), try to fit \(player2)'s fist in your mouth or take \(getNumber(input: 4)) penalties",
        "\(player1), try to lick your elbow. If you fail, take 2 penalties",
        "\(player1), peel a banana with your feet or take \(getNumber(input: 4)) penalties",
        "\(player1), imitate a celebrity until the others guess who it is. If you fail, take \(getNumber(input: 4)) penalties",
        "\(player1), go sit in a corner alone for 3 rounds or take 5 penalties",
        "\(player1), remove 2 clothing items of your choice or take \(getNumber(input: 4)) penalties",
        "\(player1), if your screen time is higher than \(player2)'s, take \(getNumber(input: 3)) penalties. Otherwise, \(player2) takes \(getNumber(input: 3)) penalties",
        "\(player1), answer 'yes' to everything for the next minute or take 5 penalties",
        "\(player1), guess where each player will be in 5 years",
        "\(player1), speak only in whispers for the next 3 rounds. If you fail, take \(getNumber(input: 3)) penalties",
        "\(player1), twerk for 15 seconds or take \(getNumber(input: 4)) penalties",
        "\(player1), show your orgasm face or take \(getNumber(input: 4)) penalties",
        "\(player1), eat a banana seductively or take \(getNumber(input: 3)) penalties",
        "\(player1), you are not allowed to laugh for the rest of the game. If you do, take 5 penalties",
        "\(player1), best body part on the opposite sex? Answer or take \(getNumber(input: 3)) penalties",
        "\(player1) and \(player2), rock-paper-scissors! Loser takes \(getNumber(input: 3)) penalties",
        "All players with a penis take \(getNumber(input: 3)) penalties",
        "\(player1), if you were a potato, would you prefer to be peeled or boiled? Answer or take \(getNumber(input: 1)) penalties",
        "\(player1), how many people have you slept with? Answer or take \(getNumber(input: 4)) penalties",
        "\(player1), does size matter?",
        "\(player1), what is your biggest fantasy? Answer or take \(getNumber(input: 4)) penalties",
        "\(player1), what's the most awkward situation you've been in? Answer or take \(getNumber(input: 3)) penalties",
        "\(player1), what's the weirdest place you've had sex? Answer or take \(getNumber(input: 4)) penalties",
        ]

        self.datesEN = [
            "\(player1), tell a red flag about yourself",
            "\(player1), tell a red flag in the opposite sex",
            "\(player1), tell a green flag in the opposite sex",
            "\(player1), make an assumption about \(player2)",
            "Put your lips together for 3 seconds without kissing",
            "\(player1), tell 2 truths and one lie about yourself. If \(player2) guesses the lie, take 3 penalties",
            "\(player1), share a secret",
            "\(player1), describe yourself in 3 words",
            "\(player1), describe \(player2) in 3 words",
            "\(player1), do you believe in anything supernatural?",
            "\(player1), what's your favorite movie?",
            "\(player1), what was your childhood dream job?",
            "\(player1), which celebrity do you admire?",
            "\(player1), tell an embarrassing memory",
            "\(player1), what's your biggest fear?",
            "\(player1), money or love?",
            "\(player1), what's your best trait?",
            "\(player1), do you consider yourself weird?",
            "\(player1), what's your favorite sport?",
            "\(player1), what's your biggest dream?",
            "\(player1), when was the last time you read a book?",
            "\(player1), dare to show your phone gallery to player \(player2)?",
            "\(player1), name a song you hate",
            "\(player1), close your eyes. What color are player \(player2)'s eyes? If wrong, take 3 penalties",
            "\(player1), if you had to tattoo something on your forehead, what would it be?",
            "\(player1), do you have any phobias?",
            "\(player1), do you have any fetishes? If yes, dare to tell player \(player2)?",
            "\(player1), demonstrate the position you usually sleep in",
            "\(player1), if you were on a walk together and \(player2) slipped, would you laugh or be worried?",
            "\(player1), how would you react if \(player2) proposed to you right now?",
            "\(player1), does pineapple belong on pizza?",
            "\(player1), what's the most spontaneous thing you've done?",
            "\(player1), show a unique skill you have. If none, take 3 penalties",
            "\(player1), what is/was your favorite school subject?",
            "\(player1), what is/was your least favorite school subject?",
            "\(player1), say an opinion most people disagree with",
            "\(player1), do you believe in magic?",
            "\(player1), do you believe in love at first sight?",
            "\(player1), what was your first impression of player \(player2)?",
            "\(player1), have you ever been in love?",
            "\(player1), are first dates usually fun or stressful to you?",
            "\(player1), what do you look for in a relationship?",
            "\(player1), who pays on a first date?",
            "\(player1), what's the best thing about being single?",
            "\(player1), what's the best thing about being in a relationship?",
            "\(player1), if you could, would you want to live forever?",
            "\(player1), what's the most attractive trait in the opposite sex?",
            "\(player1), how do you usually flirt?",
            "\(player1), what non-sexual trait do you find attractive?",
            "\(player1), what would you like to do together with player \(player2)?",
            "\(player1), give player \(player2) a shoulder massage for 30 seconds or take 4 penalties",
            "\(player1), what's your best pick-up line?",
            "\(player1), if you were a potato, would you rather be peeled or boiled?",
            "\(player1), do you have skeletons in the closet?",
            "\(player1), how long does it take for you to be fully yourself in a relationship?",
            "\(player1), are you a big spoon or little spoon?",
            "\(player1), top or bottom?",
            "\(player1), give an eskimo kiss to \(player2)",
            "\(player1), which celebrity would you marry?",
            "\(player1), what do you like most about your body?",
            "\(player1), if you had 24 hours to spend a million dollars, what would you buy?",
            "\(player1), would you rather be cheated on or cheat yourself?",
            "\(player1), what hardship has made you stronger?",
            "\(player1), what substances do you use/have tried?",
            "\(player1), do you believe in destiny?",
            "\(player1), where do you want to be in 10 years?",
            "\(player1), rank these by importance: money, love, health, freedom, safety",
            "\(player1), what qualities do you value most in a partner?",
            "\(player1), how do you handle conflicts in a relationship?",
            "\(player1), how do you show love?",
            "\(player1), if you wanted to sneak out of this date politely, how would you do it?",
            "\(player1), what song has been stuck in your head lately?",
            "\(player1), what's your favorite song of all time?",
            "\(player1), what adjective describes you the best?",
            "\(player1), tell me an inside joke without the context",
            "\(player1), which decade/era has the best music in your opinion?",
            "\(player1), if you could choose, which country would we fly to tomorrow?",
            "\(player1), do you believe in horoscopes?",
            "\(player1), do you believe in God?",
            "\(player1), what's the best advice you've ever received?",
            "\(player1), is it better to have 2 close friends or a casual friendship with 50 people?",
            "\(player1), what's an annoying trait of yours?",
            "\(player1), what's the most memorable compliment you've gotten?",
            "\(player1), why are you still single?",
            "\(player1), what advice would you give your 10-year-old self?",
            "\(player1), would you rather meet a man or a bear alone in the woods?",
            "\(player1), have you ever peed in a public swimming pool?",
            "\(player1), what song do you listen to when you're sad?",
            "\(player1), are you jealous of anyone? If yes, who and why?",
            "\(player1), how would you define success?",
            "\(player1), what's the best way to spend quality time together?",
            "\(player1), how important is sex to you?",
            "\(player1), what's the best thing about sex?",
            "\(player1), what's the weirdest thing you've experienced in bed?",
            "\(player1), have you ever deliberately left someone on read to seem busy?",
            "\(player1), what do you think about one-night stands?",
            "\(player1), what's your favorite sex position?",
            "\(player1), do you listen more to your heart or your head?",
            "\(player1), do you want to start a family someday?",
            "\(player1), do you believe in soulmates?"
        ]

        self.tier1EN = [
            "\(player1), name five Jedi Knights from Star Wars movies or take \(getNumber(input: 3)) penalties",
            "\(player1), if you were a potato, would you rather be peeled or boiled?",
            "Every player under 6 ft tall takes \(getNumber(input: 3)) penalties",
            "\(player1), however many push-ups you do, \(player2) takes that many penalties",
            "\(player1), Telepathy challenge! Try to say the same word as player \(player2) at the same time. If you fail, both take \(getNumber(input: 2)) penalties. Category: color",
            "Tell a story one word at a time. The first player to freeze takes \(getNumber(input: 3)) penalties. Start clockwise from \(player1)",
            "\(player1), guess where each player will be in 5 years",
            "\(player1), name 5 countries starting with S in 10 seconds or take \(getNumber(input: 3)) penalties",
            "\(player1), name 10 Disney princesses in 15 seconds or take \(getNumber(input: 3)) penalties",
            "\(player1), do 10 push-ups or take \(getNumber(input: 4)) penalties",
            "\(player1), make up a new nickname for every player",
            "\(player1), imitate a player of your choice until someone guesses who it is",
            "\(player1), confess a guilty pleasure or take \(getNumber(input: 5)) penalties",
            "\(player1), does pineapple belong on pizza? Take as many penalties as there are players who disagree",
            "\(player1), list the Finnish vowels in reverse order. If you fail, take \(getNumber(input: 3)) penalties",
            "\(player1), name a good trait about player \(player2)",
            "\(player1), name 4 James Bond actors in 10 seconds or take \(getNumber(input: 3)) penalties",
            "\(player1), say something sensible in as many languages as you can. For each language, others take \(getNumber(input: 2)) penalties",
            "\(player1) picks a category. The first player who can't name a new thing takes \(getNumber(input: 3)) penalties",
            "\(player1), say 'Betty Botter bought some butter' five times fast without twisting your tongue or take 4 penalties",
            "\(player1), say 'I saw a kitten eating chicken in the kitchen' five times fast without messing up or take \(getNumber(input: 3)) penalties",
            "\(player1), name 5 NATO countries in 10 seconds or take \(getNumber(input: 3)) penalties",
            "\(player1), name 6 U.S. states in 10 seconds or take \(getNumber(input: 3)) penalties",
            "\(player1), quote two legendary one-liners from the Terminator movies or take \(getNumber(input: 3)) penalties",
            "\(player1), give a nickname to every player or take \(getNumber(input: 3)) penalties",
            "\(player1), challenge \(player2) to rock-paper-scissors. Loser takes \(getNumber(input: 3)) penalties",
            "\(player1), imitate a politician of your choice for 10 seconds, or take \(getNumber(input: 3)) penalties",
            "\(player1), name a song you hate or take \(getNumber(input: 2)) penalties",
            "Waterfall! \(player1) starts. Move clockwise",
            "\(player1), say 'Peter Piper picked a peck of pickled peppers' five times fast without a tongue twist or take \(getNumber(input: 3)) penalties",
            "\(player1), describe your first kiss or take \(getNumber(input: 3)) penalties",
            "\(player1), who's the hottest celebrity you know? Answer or take \(getNumber(input: 3)) penalties",
            "\(player1), who's the most famous person whose number you have? Answer or take \(getNumber(input: 3)) penalties",
            ]
           
            self.tier2EN = [
                "\(player1), what's the longest you've gone without brushing your teeth? Answer or take \(getNumber(input: 2)) penalties.",
                    "The player with the best butt takes \(getNumber(input: 4)) penalties.",
                    "The player with the biggest biceps takes \(getNumber(input: 4)) penalties.",
                    "\(player1), you’re not allowed to laugh for the rest of the game. If you fail, take \(getNumber(input: 5)) penalties.",
                    "\(player1), tell a rare thing you've done. Everyone who hasn’t done it takes \(getNumber(input: 3)) penalties.",
                    "\(player1), wear \(player2)’s socks on your hands for the rest of the game or take \(getNumber(input: 5)) penalties.",
                    "Everyone makes baby noises. The worst performer takes \(getNumber(input: 3)) penalties.",
                    "\(player1), if your screen time is higher than \(player2)’s, take \(getNumber(input: 3)) penalties. Otherwise, \(player2) takes \(getNumber(input: 3)) penalties.",
                    "\(player2), tell an interesting fact. Everyone who didn’t know it takes \(getNumber(input: 2)) penalties.",
                    "\(player1), rank these body parts in order of attractiveness: armpits, toes, ears — or take \(getNumber(input: 2)) penalties.",
                    "Waterfall! \(player1) starts. Continue counter-clockwise.",
                    "\(player1), impersonate one of the other players for 10 seconds.",
                    "\(player1), challenge \(player2) to a thumb war. Loser takes \(getNumber(input: 3)) penalties.",
                    "\(player1), give each player a funny nickname.",
                    "\(player1), hug \(player2).",
                    "\(player1), tell a joke. If no one laughs, take \(getNumber(input: 2)) penalties.",
                    "\(player1), however many push-ups you do, \(player2) takes that many penalties.",
                    "\(player1), do 10 push-ups or take \(getNumber(input: 4)) penalties.",
                    "\(player1) and \(player2), staring contest! Loser takes \(getNumber(input: 3)) penalties.",
                    "\(player1), imitate a lion for 15 seconds.",
                    "\(player1), let player \(player2) style your hair for the rest of the game or take 4 penalties.",
                    "\(player1), what's the most embarrassing situation you've been in? Answer or take \(getNumber(input: 3)) penalties.",
                    "\(player1), impersonate a celebrity until others guess who it is. If you fail, take \(getNumber(input: 4)) penalties.",
                    "\(player1), what's your biggest fantasy? Answer or take \(getNumber(input: 4)) penalties.",
                    "\(player1), give your best pickup line. If others don’t find it funny, take \(getNumber(input: 2)) penalties.",
                    "Each player makes a weird noise. Anyone refusing takes \(getNumber(input: 4)) penalties.",
                    "\(player1), kneel before \(player2) and propose — or take \(getNumber(input: 3)) penalties.",
                    "\(player1), purr like a cat for 5 seconds or take \(getNumber(input: 2)) penalties.",
                    "Next player to laugh takes \(getNumber(input: 5)) penalties!",
                    "\(player1), go to the corner to 'shame' yourself for three rounds.",
                    "\(player1), name a song suitable for bedroom activities or take \(getNumber(input: 3)) penalties.",
                    "\(player1), freestyle rap about tonight. The others will judge if you get away without \(getNumber(input: 3)) penalties.",
                    "\(player1), try licking your elbow. If you fail, take \(getNumber(input: 2)) penalties.",
                    "\(player1), what's your bench press max? For every 10 kg, give out \(getNumber(input: 1)) penalties.",
                    "\(player1), Telepathy challenge! Try to say the same car brand as \(player2) at the same time. If you fail, both take \(getNumber(input: 2)) penalties.",
                    "\(player1), give your best Goofy impression or take \(getNumber(input: 3)) penalties.",
                    "\(player1), air guitar for 15 seconds or take \(getNumber(input: 4)) penalties.",
                    "\(player1), whisper only for the next 3 rounds. If you fail, take \(getNumber(input: 3)) penalties.",
                    "\(player1), make everyone laugh without talking. If you fail, take \(getNumber(input: 3)) penalties.",
                    "\(player1), act like a baby for \(getNumber(input: 3)) rounds or take \(getNumber(input: 4)) penalties.",
                    "Everyone impersonates an animal in turn. The worst one takes \(getNumber(input: 3)) penalties.",
                    "\(player1), jump as high as you can. If the others aren’t convinced, take \(getNumber(input: 3)) penalties.",
                    "\(player1), hold a plank for one minute. If you fail, take \(getNumber(input: 5)) penalties.",
                    "\(player1), sing opera for 10 seconds or take \(getNumber(input: 4)) penalties.",
                    "\(player1), hum a song of your choice. If others can’t guess it in 15 seconds, take \(getNumber(input: 3)) penalties.",
                    "\(player1), what’s your squat max? For every 10 kg, give out \(getNumber(input: 1)) penalties.",
                    "\(player1), if your heart rate is higher than \(player2)’s, take \(getNumber(input: 3)) penalties.",
                    "\(player1), do 5 somersaults or take \(getNumber(input: 5)) penalties.",
                    "\(player1) and \(player2), act out a dramatic breakup or both take \(getNumber(input: 4)) penalties.",
                    "\(player1) vs \(player2)! First to do 5 somersaults wins. Loser takes \(getNumber(input: 4)) penalties.",
                    "\(player1), meow like a cat for 10 seconds or take \(getNumber(input: 3)) penalties.",
                    "\(player1), do your best Tarzan jungle yell. If you don’t convince the others, take \(getNumber(input: 4)) penalties.",
                    "Next player to blink takes \(getNumber(input: 4)) penalties.",
                    "\(player1), howl like a wolf or take \(getNumber(input: 5)) penalties."
            ]
            
            self.tier3EN = [
                "\(player1), what’s the longest you’ve gone without showering? Answer or take \(getNumber(input: 3)) penalties.",
                    "Can cheating be forgiven? Vote! The minority takes \(getNumber(input: 4)) penalties",
                    "\(player1), lick \(player2)’s belly button or take \(getNumber(input: 5)) penalties",
                    "\(player1), kiss every player’s nose or take \(getNumber(input: 4)) penalties",
                    "\(player1), come up with an erotic nickname for each player or take \(getNumber(input: 4)) penalties",
                    "\(player1), remove \(player2)’s socks using only your teeth or take \(getNumber(input: 3)) penalties",
                    "One by one, kiss the cheek of the player to your right. Refusers take \(getNumber(input: 5)) penalties",
                    "\(player1), whisper a secret to \(player2). If they show no reaction, take \(getNumber(input: 2)) penalties",
                    "\(player1), what’s your biggest fantasy? Answer or take \(getNumber(input: 4)) penalties",
                    "\(player1), talk for three turns without letting your lips touch. If you fail, take \(getNumber(input: 3)) penalties",
                    "\(player1), choose one player to take \(getNumber(input: 3)) penalties",
                    "\(player1), close your eyes and point your index finger. \(player2) presses a body part against it. If you guess correctly, you’re spared \(getNumber(input: 4)) penalties",
                    "Each player moans once. \(player1) starts",
                    "\(player1), give \(player2) a 30-second foot massage or take \(getNumber(input: 4)) penalties",
                    "\(player1), take \(getNumber(input: 3)) penalties or a slap on the cheek from \(player2)",
                    "\(player1), rank these body parts by attractiveness: armpits, toes, ears",
                    "\(player1), however many push-ups you do, \(player2) takes that many penalties",
                    "\(player1), burp or take \(getNumber(input: 3)) penalties",
                    "\(player1), if you had to roleplay with \(player2), what would you wear?",
                    "\(player1), are you currently crushing on someone? Answer or take \(getNumber(input: 3)) penalties.",
                    "\(player1), have you ever eaten a booger? Answer or take \(getNumber(input: 4)) penalties",
                    "\(player1), do 10 push-ups or take \(getNumber(input: 4)) penalties",
                    "\(player1), show the most recent photo from your Hidden album",
                    "\(player1), take off your shirt for the rest of the game or take \(getNumber(input: 4)) penalties",
                    "\(player1), show your best dance moves for the next 15 seconds or take \(getNumber(input: 5)) penalties",
                    "Each player sings one word at a time from Europe’s ’The ’Final Countdown. The first one to freeze takes \(getNumber(input: 3)) penalties. \(player1) starts",
                    "Each player sings one word at a time from Queen’s ’Bohemian Rhapsody’. The first one to freeze takes \(getNumber(input: 3)) penalties. \(player1) starts",
                    "\(player1) and \(player2), hold hands for the rest of the game. If your hands separate, you both take \(getNumber(input: 5)) penalties",
                    "\(player1), show the sexiest face you can make",
                    "\(player1), freestyle rap about: 'I’m in love with \(player2)' or take \(getNumber(input: 4)) penalties",
                    "\(player1), remove an item of clothing of your choice or take \(getNumber(input: 4)) penalties",
                    "\(player1), cut off a small piece of your hair with scissors or take \(getNumber(input: 5)) penalties",
                    "\(player1), moan every time you take a penalty for the rest of the game",
                    "\(player1), what’s the most awkward dating situation you’ve experienced? Answer or take \(getNumber(input: 3)) penalties",
                    "\(player1), favorite body part on the opposite sex? Answer or take \(getNumber(input: 4)) penalties",
                    "\(player1), let \(player2) tickle you for 10 seconds. If you laugh, take \(getNumber(input: 3)) penalties",
                    "\(player1), flirt in as many languages as you can. For each language, the others take \(getNumber(input: 2)) penalties",
                    "\(player1), sit on \(player2)’s lap for three rounds. Refusing means \(getNumber(input: 4)) penalties",
                    "Take \(getNumber(input: 3)) penalties if you could have sex with someone in the room",
                    "\(player1), say “yes” to everything for the next minute or take 5 penalties",
                    "\(player1), how many people have you kissed? Answer or take \(getNumber(input: 3)) penalties",
                    "\(player1), do you think you're good in bed? Answer or take \(getNumber(input: 4)) penalties",
                    "\(player1), what’s the biggest thing you’ve lied about? Answer or take \(getNumber(input: 3)) penalties",
                    "\(player1), show your ahegao face or take \(getNumber(input: 4)) penalties",
                    "Each player introduces themselves as sexily as possible. Refusers or underperformers take \(getNumber(input: 4)) penalties",
                    "\(player1) and \(player2), swap clothes for the rest of the game (underwear excluded). Refusing means 7 penalties",
                    "Each player names a sex toy or item in turn. First to freeze takes \(getNumber(input: 4)) penalties. \(player1) starts",
                    "\(player1), smell \(player2)’s ears or take \(getNumber(input: 3)) penalties",
                    "\(player1), swap shirts with \(player2). Refusing means \(getNumber(input: 4)) penalties",
                    "\(player1), flex your pecs 10 times. If you can’t, take \(getNumber(input: 3)) penalties",
                    "\(player1), smell each player’s neck one by one. The best-smelling player takes \(getNumber(input: 4)) penalties",
                    "\(player1) and \(player2), do the yoga pose 'Boat' (Navasana) together. If you fail, take \(getNumber(input: 3)) penalties",
                    "\(player1), carry \(player2) on your back for the rest of the game. Refusing means \(getNumber(input: 6)) penalties",
                    "\(player1), hold \(player2) in your arms for the rest of the game. Refusing means \(getNumber(input: 6)) penalties",
                    "\(player1), close your eyes. \(player2) puts a finger in your mouth. If you guess which finger, you’re spared \(getNumber(input: 3)) penalties",
                    "\(player1), act enraged for 15 seconds. If others think you did well, you’re spared \(getNumber(input: 3)) penalties",
                    "\(player1) and \(player2), hug with your stomachs touching for the rest of the game. Failing means \(getNumber(input: 6)) penalties",
                    "\(player1), act drunk for 15 seconds or take \(getNumber(input: 2)) penalties",
                    "\(player1), tell an embarrassing memory. If the others don’t think it’s embarrassing, take \(getNumber(input: 3)) penalties",
            ]
        

            self.tier4EN = [
            "\(player1), when did you lose your virginity? Answer or take \(getNumber(input: 4)) penalties",
            "\(player1), swap pants with \(player2). Refusing means \(getNumber(input: 4)) penalties",
            "\(player1), sit on \(player2)’s lap for the rest of the game. Refusing means \(getNumber(input: 4)) penalties",
            "\(player1), peel a banana with your feet or take \(getNumber(input: 4)) penalties",
            "\(player1), what’s the weirdest place you’ve had sex? Answer or take \(getNumber(input: 4)) penalties",
            "\(player1), try to fit \(player2)’s fist in your mouth or take \(getNumber(input: 4)) penalties",
            "\(player1), give the others a seductive 15-second belly dance show or take \(getNumber(input: 5)) penalties",
            "\(player1), show your orgasm face or take \(getNumber(input: 4)) penalties",
            "\(player1), eat a banana seductively or take \(getNumber(input: 3)) penalties",
            "\(player1), do you think you’re good in bed? Answer or take \(getNumber(input: 4)) penalties",
            "\(player1), when was the last time you had sex? Answer or take \(getNumber(input: 4)) penalties",
            "\(player1), when was the last time you masturbated? Answer or take \(getNumber(input: 4)) penalties",
            "\(player1), show your most recent sent message or take \(getNumber(input: 3)) penalties",
            "\(player1), do 10 push-ups or take \(getNumber(input: 4)) penalties",
            "\(player1), kiss the player in front of you or take \(getNumber(input: 4)) penalties",
            "\(player1), Telepathy challenge! Try to say the same word as \(player2) at the same time. If you fail, you both take \(getNumber(input: 2)) penalties. Category: sex position",
            "\(player1), take \(getNumber(input: 5)) penalties",
            "\(player1), what’s the weirdest thing you’ve done during sex? Answer or take \(getNumber(input: 4)) penalties",
            "\(player1), describe the last adult video you watched or take \(getNumber(input: 4)) penalties",
            "\(player1), freestyle rap about: 'I want to make love with \(player2)'",
            "\(player1), remove 2 clothing items of your choice or take \(getNumber(input: 4)) penalties",
            "\(player1), what’s the most awkward moment you’ve had during sex? Answer or take \(getNumber(input: 3)) penalties",
            "\(player1), what’s the weirdest place you’ve had sex? Answer or take \(getNumber(input: 4)) penalties",
            "\(player1), best body part on \(player2)? Answer or take \(getNumber(input: 4)) penalties",
            "\(player1), what’s your biggest sexual fantasy? Answer or take \(getNumber(input: 4)) penalties",
            "\(player1), challenge \(player2) to arm wrestle. Loser takes \(getNumber(input: 3)) penalties",
            "\(player1), what’s the worst date you’ve ever been on? Answer or take \(getNumber(input: 4)) penalties",
            "All players with a penis take \(getNumber(input: 3)) penalties",
            "\(player1), remove \(player2)’s shirt or take \(getNumber(input: 3)) penalties",
            "\(player1), what’s your body count? Answer or take \(getNumber(input: 4)) penalties",
            "\(player1), when was the last time you had sex? Answer or take \(getNumber(input: 5)) penalties",
            "\(player1), does size matter? Answer or take \(getNumber(input: 4)) penalties",
            "Each player kisses the one on their left. Refusing means \(getNumber(input: 4)) penalties",
            "\(player1), pull down your pants and yank your underwear up as high as you can, or take \(getNumber(input: 4)) penalties",
            "\(player1), imitate a turtle having sex. If the others aren’t impressed, take \(getNumber(input: 3)) penalties",
            "\(player1) and \(player2), give each other hickeys on your chests. Refusing means \(getNumber(input: 5)) penalties",
            "\(player1), which player would you most like to have sex with? Answer honestly or take \(getNumber(input: 4)) penalties",
            "\(player1), put your pants on backwards for the rest of the game or take \(getNumber(input: 4)) penalties",
            "\(player1), hump \(player2)’s leg for 10 seconds or take \(getNumber(input: 4)) penalties",
            "\(player1), post a picture of your butt on social media or take \(getNumber(input: 4)) penalties. You can keep your pants on",
            "One by one, grab the crotch of the player to your right. Refusing means \(getNumber(input: 5)) penalties. \(player1) starts",
            "Everyone kisses the player on their right on the lips. Refusing means \(getNumber(input: 5)) penalties",
            "\(player1), lick \(player2)’s foot. Refusing means \(getNumber(input: 5)) penalties",
            "\(player1) and \(player2), kiss. Other players take as many penalties as the kiss lasts in seconds",
            "\(player1), let \(player2) wear your bra. If you don’t have one or refuse, take \(getNumber(input: 5)) penalties",
            "\(player1), put your tongue in \(player2)’s nostril or take \(getNumber(input: 5)) penalties",
            "\(player1), find out who has the smelliest feet or take \(getNumber(input: 6)) penalties",
            "\(player1), smell \(player2)’s foot or take \(getNumber(input: 4)) penalties",
            "\(player1), guess what color underwear \(player2) is wearing. If you’re right, they take \(getNumber(input: 3)) penalties. If wrong, you take \(getNumber(input: 3))",
            "\(player1) and \(player2), press your lips together for 15 seconds, but don’t kiss!. Failing means \(getNumber(input: 5)) penalties",
        ]

            self.tier5EN = [
            "\(player1), remove \(player2)’s pants or take \(getNumber(input: 3)) penalties",
            "\(player1), when, where and how did you lose your virginity? Describe in detail or take \(getNumber(input: 5)) penalties",
            "\(player1), spoon with \(player2) for the rest of the game. Refusing means \(getNumber(input: 4)) penalties",
            "\(player1), give \(player2) a lap dance or take \(getNumber(input: 4)) penalties",
            "\(player1), do 10 push-ups or take \(getNumber(input: 4)) penalties",
            "\(player1), Telepathy challenge! Try to say the same word at the same time with \(player2). If you fail, you both take \(getNumber(input: 2)) penalties. Category: sex toys",
            "\(player1), describe the last adult video you watched or take \(getNumber(input: 5)) penalties",
            "\(player1), twerk for 10 seconds or take \(getNumber(input: 5)) penalties",
            "\(player1), strip to your underwear for the rest of the game or take \(getNumber(input: 4)) penalties",
            "\(player1), remove 3 clothing items of your choice or take \(getNumber(input: 4)) penalties",
            "\(player1), massage \(player2)’s best body part for 10 seconds or take \(getNumber(input: 3)) penalties",
            "\(player1), lick \(player2)’s nipple or take \(getNumber(input: 3)) penalties",
            "\(player1), show your bare butt or take \(getNumber(input: 3)) penalties",
            "\(player1), kiss \(player2) or take \(getNumber(input: 3)) penalties",
            "\(player1), fart or take \(getNumber(input: 5)) penalties",
            "\(player1), make the weirdest sound you can or take \(getNumber(input: 3)) penalties",
            "\(player1), cause secondhand embarrassment for the other players in the next 15 seconds or take \(getNumber(input: 6)) penalties",
            "\(player1), pick \(player2)’s nose or take \(getNumber(input: 3)) penalties",
            "\(player1), let \(player2) spit into your mouth or take \(getNumber(input: 5)) penalties",
            "\(player1), which player would you most like to have sex with? Answer or take \(getNumber(input: 3)) penalties",
            "\(player1), rub both your nipples while moaning for 5 seconds or take \(getNumber(input: 3)) penalties",
            "\(player1), put \(player2)’s foot in your mouth or take \(getNumber(input: 3)) penalties",
            "\(player1), let \(player2) slap your butt or take \(getNumber(input: 4)) penalties",
            "\(player1), bend over for the other players or take \(getNumber(input: 3)) penalties",
            "\(player1), sing the song 'Ievan Polkka' as best as you can. Other players decide if you’re spared \(getNumber(input: 3)) penalties",
            "\(player1), if your penis is currently longer than 3.5 inches, take \(getNumber(input: 3)) penalties (don’t lie)",
            "\(player1), act like a dog for the next 3 turns or take \(getNumber(input: 5)) penalties",
            "\(player1) and \(player2), French kiss or both take \(getNumber(input: 5)) penalties",
            "\(player1) and \(player2), staring contest! Loser takes \(getNumber(input: 3)) penalties",
            "\(player1), act like a monkey for the next 3 turns or take \(getNumber(input: 4)) penalties",
            "No one is allowed to laugh! The first to laugh takes \(getNumber(input: 3)) penalties",
            "\(player1), do 10 armpit farts or take \(getNumber(input: 3)) penalties",
            "\(player1), drum the ABC song melody on \(player2)’s butt. Refusing means \(getNumber(input: 5)) penalties",
            "\(player1) and \(player2), dry hump each other for 10 seconds. Refusing means \(getNumber(input: 6)) penalties",
            "The shortest player takes \(getNumber(input: 3)) penalties",
            "\(player1), fill your mouth with drink and transfer the liquid to \(player2)’s mouth. Refusing means \(getNumber(input: 5)) penalties",
            "\(player1) and \(player2), swap underwear with each other. Refusing means \(getNumber(input: 6)) penalties",
            "\(player1), show your boobs or take \(getNumber(input: 5)) penalties",
            "\(player1), show your penis or take \(getNumber(input: 6)) penalties. If you don’t have one, take \(getNumber(input: 2)) penalties",
            "\(player1), give \(player2) a hickey. Refusing means \(getNumber(input: 5)) penalties",
            "\(player1) and \(player2), 7 minutes in heaven. Refusing means \(getNumber(input: 5)) penalties",
            "\(player1) and \(player2), touch each other’s tongues with your tongues. Refusing means \(getNumber(input: 5)) penalties",
            "\(player1) and \(player2), show the others what the cowgirl position looks like. Refusing means \(getNumber(input: 5)) penalties",
            "\(player1) and \(player2), show the others what the missionary position looks like. Refusing means \(getNumber(input: 5)) penalties",
            "\(player1), massage \(player2)’s chest for 10 seconds. Refusing means \(getNumber(input: 5)) penalties"
        ]




        
        
    }
}
