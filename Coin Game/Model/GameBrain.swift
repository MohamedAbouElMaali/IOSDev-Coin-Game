//
//  GameBrain.swift
//  Coin Game
//
//  Created by Mohamed Abouelmaali on 12/28/21.
//

import Foundation

struct GameBrain {
    let coinNum = [1, 2, 3]
    var player1Coin: Int
    var player2Coin: Int
    var coin1Alpha = 0.0
    var coin2Alpha = 0.0
    var coin3Alpha = 0.0
    var coin4Alpha = 0.0
    var coin5Alpha = 0.0
    var coin6Alpha = 0.0
    var roundNumbers = 1
    var player1Spent = 0
    var player2Spent = 0
    var coinChoice: String
    var winnerResult = ""
    var roundsResult = ""
    var player1CoinsResults = ""
    var player2CoinsResults = ""
    var winner = ""
    var endGame = false
    
    init(coin1: Int, coin2: Int, coinChoice: String) {
        player1Coin = coin1
        player2Coin = coin2
        self.coinChoice = coinChoice
    }
    
    mutating func player1CoinNumber() {
        switch coinChoice {
        case "1 Coin":
            player1Coin -= 1
            player1Spent = 1
            coin1Alpha = 1
            coin2Alpha = 0
            coin3Alpha = 0
        case "2 Coin":
            player1Coin -= 2
            player1Spent = 2
            coin1Alpha = 1
            coin2Alpha = 1
            coin3Alpha = 0
        case "3 Coin":
            player1Coin -= 3
            player1Spent = 3
            coin1Alpha = 1
            coin2Alpha = 1
            coin3Alpha = 1
        default:
            print("Unexpected Error!")
        }
    }
    
    mutating func player2CoinNumber() {
        var randomCoin = coinNum.randomElement()!
        player2Coin -= randomCoin
        player2Spent = randomCoin
        switch randomCoin {
        case 1:
            coin4Alpha = 1
            coin5Alpha = 0
            coin6Alpha = 0
        case 2:
            coin4Alpha = 1
            coin5Alpha = 1
            coin6Alpha = 0
        case 3:
            coin4Alpha = 1
            coin5Alpha = 1
            coin6Alpha = 1
        default:
            print("Unexpected Error!")
        }
    }
    
    mutating func pointCalculator() {
        if (player1Spent == player2Spent) {
            player2Coin += 1
        }
        else if (player2Spent - 1 == player1Spent || player2Spent + 1 == player1Spent) {
            player2Coin += 1
        }
        else if (player2Spent - 2 == player1Spent || player2Spent + 2 == player1Spent) {
            player1Coin += 2
        }
        else {
            print("Unexpected Error!")
        }
        
    }
    
    mutating func gameEnd(){
        if (player1Coin <= 3 || player2Coin <= 3) {
            endGame = true
        }
        else {
            endGame = false
        }
    }
    
    mutating func gameResults() {
        if (player1Coin == player2Coin) {
            winner = "Draw"
        }
        else if (player1Coin > player2Coin) {
            winner = "Player 1"
        }
        else {
            winner = "Player 2"
        }
        winnerResult = winner
        roundsResult = "\(roundNumbers)"
        player1CoinsResults = "\(player1Coin)"
        player2CoinsResults = "\(player2Coin)"
    }
}
