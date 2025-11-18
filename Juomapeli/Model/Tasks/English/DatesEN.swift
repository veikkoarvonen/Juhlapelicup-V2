//
//  DatesEN.swift
//  Juomapeli
//
//  Created by Valeria Rehokainen on 16.11.2025.
//

import Foundation

struct DateTasksEN {
    
    func instuctions(startingPlayer: String) -> String {
        let string = "Ask eachother a question one by one. The question is determined by the app. After the question hand the phone to the player who answered. \(startingPlayer) starts!"
        return string
    }
    
    static let tasks = [
    
    Task(
    template:"{player1}, tell a red flag about yourself",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, tell a red flag in the opposite sex",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, tell a green flag in the opposite sex",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, make an assumption about {player2}",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "Put your lips together for 3 seconds without kissing",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, tell 2 truths and one lie about yourself. If {player2} guesses the lie, take 3 penalties",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, share a secret",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, describe yourself in 3 words",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, describe {player2} in 3 words",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you believe in anything supernatural?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's your favorite movie?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what was your childhood dream job?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, which celebrity do you admire?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, tell an embarrassing memory",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's your biggest fear?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, money or love?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's your best trait?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you consider yourself weird?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's your favorite sport?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's your biggest dream?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, when was the last time you read a book?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, dare to show your phone gallery to player {player2}?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, name a song you hate",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, close your eyes. What color are player {player2}'s eyes? If wrong, take 3 penalties",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, if you had to tattoo something on your forehead, what would it be?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you have any phobias?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you have any fetishes? If yes, dare to tell player {player2}?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, demonstrate the position you usually sleep in",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, if you were on a walk together and {player2} slipped, would you laugh or be worried?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, how would you react if {player2} proposed to you right now?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, does pineapple belong on pizza?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's the most spontaneous thing you've done?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, show a unique skill you have. If none, take 3 penalties",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what is/was your favorite school subject?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what is/was your least favorite school subject?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, say an opinion most people disagree with",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you believe in magic?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you believe in love at first sight?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what was your first impression of player {player2}?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, have you ever been in love?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, are first dates usually fun or stressful to you?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what do you look for in a relationship?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, who pays on a first date?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's the best thing about being single?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's the best thing about being in a relationship?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, if you could, would you want to live forever?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's the most attractive trait in the opposite sex?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, how do you usually flirt?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what non-sexual trait do you find attractive?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what would you like to do together with player {player2}?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, give player {player2} a shoulder massage for 30 seconds or take 4 penalties",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's your best pick-up line?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, if you were a potato, would you rather be peeled or boiled?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you have skeletons in the closet?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, how long does it take for you to be fully yourself in a relationship?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, are you a big spoon or little spoon?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, top or bottom?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, give an eskimo kiss to {player2}",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, which celebrity would you marry?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what do you like most about your body?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, if you had 24 hours to spend a million dollars, what would you buy?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, would you rather be cheated on or cheat yourself?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what hardship has made you stronger?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what substances do you use/have tried?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you believe in destiny?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, where do you want to be in 10 years?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, rank these by importance: money, love, health, freedom, safety",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what qualities do you value most in a partner?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, how do you handle conflicts in a relationship?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, how do you show love?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, if you wanted to sneak out of this date politely, how would you do it?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what song has been stuck in your head lately?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's your favorite song of all time?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what adjective describes you the best?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, tell me an inside joke without the context",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, which decade/era has the best music in your opinion?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, if you could choose, which country would we fly to tomorrow?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you believe in horoscopes?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you believe in God?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's the best advice you've ever received?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, is it better to have 2 close friends or a casual friendship with 50 people?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's an annoying trait of yours?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's the most memorable compliment you've gotten?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, why are you still single?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what advice would you give your 10-year-old self?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, would you rather meet a man or a bear alone in the woods?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, have you ever peed in a public swimming pool?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what song do you listen to when you're sad?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, are you jealous of anyone? If yes, who and why?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, how would you define success?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's the best way to spend quality time together?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, how important is sex to you?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's the best thing about sex?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's the weirdest thing you've experienced in bed?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, have you ever deliberately left someone on read to seem busy?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what do you think about one-night stands?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, what's your favorite sex position?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you listen more to your heart or your head?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you want to start a family someday?",
    pointsToScore: 1,
    baselinePenalty: 3
    ),
    Task(
    template:            "{player1}, do you believe in soulmates?",
    pointsToScore: 1,
    baselinePenalty: 3
    )
    ]


    
}
