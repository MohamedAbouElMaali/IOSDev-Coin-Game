//
//  ViewController.swift
//  Coin Game
//
//  Created by Mohamed Abouelmaali on 12/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var roundNumber: UILabel!
    @IBOutlet weak var player1Coins: UILabel!
    @IBOutlet weak var player2Coins: UILabel!
    @IBOutlet weak var coin11: UIImageView!
    @IBOutlet weak var coin12: UIImageView!
    @IBOutlet weak var coin13: UIImageView!
    @IBOutlet weak var coin21: UIImageView!
    @IBOutlet weak var coin22: UIImageView!
    @IBOutlet weak var coin1: UIButton!
    @IBOutlet weak var coin23: UIImageView!
    @IBOutlet weak var coin2: UIButton!
    @IBOutlet weak var coin3: UIButton!
    var gameBrain = GameBrain(coin1: 10, coin2: 10, coinChoice: "")
    
        @IBAction func coinNumberSelected1(_ sender: UIButton) {
            let coinChoice = sender.titleLabel!.text
            gameBrain.coinChoice = coinChoice!
            gameBrain.player1CoinNumber()
            gameBrain.player2CoinNumber()
            gameBrain.pointCalculator()
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            gameBrain.roundNumbers += 1
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @objc func updateUI() {
        updateRoundNumber()
        updateCoinNumber()
        updateCoins()
        updateEndGame()
    }
    
    func updateRoundNumber() {
        roundNumber.text = "Round Number: \(gameBrain.roundNumbers)"
    }
    
    func updateCoinNumber() {
        player1Coins.text = "\(gameBrain.player1Coin)"
        player2Coins.text = "\(gameBrain.player2Coin)"
    }
    
    func updateCoins() {
        coin11.alpha = gameBrain.coin1Alpha
        coin12.alpha = gameBrain.coin2Alpha
        coin13.alpha = gameBrain.coin3Alpha
        coin21.alpha = gameBrain.coin4Alpha
        coin22.alpha = gameBrain.coin5Alpha
        coin23.alpha = gameBrain.coin6Alpha
    }
    
    func updateEndGame() {
        gameBrain.gameEnd()
        if (gameBrain.endGame) {
            coin1.isUserInteractionEnabled = false
            coin2.isUserInteractionEnabled = false
            coin3.isUserInteractionEnabled = false
            tintView.alpha = 0.5
            questionView.alpha = 1.0
            gameReusultsView.alpha = 1.0
            winnerResult.text = gameBrain.winnerResult
            roundsResult.text = gameBrain.roundsResult
            player1CoinsResult.text = gameBrain.player1CoinsResults
            player2CoinsResult.text = gameBrain.player2CoinsResults
            noOption.isUserInteractionEnabled = true
            yesOption.isUserInteractionEnabled = true
        }
        else {
            coin1.isUserInteractionEnabled = true
            coin2.isUserInteractionEnabled = true
            coin3.isUserInteractionEnabled = true
            noOption.isUserInteractionEnabled = false
            yesOption.isUserInteractionEnabled = false
            tintView.alpha = 0.0
            questionView.alpha = 0
            gameReusultsView.alpha = 0
        }
    }
    
    @IBAction func gameRestartPressed(_ sender: UIButton) {
        let answer = sender.currentTitle!
        
        if(answer == "No") {
            tintView.alpha = 1.0
        }
        else {
            gameBrain.endGame = false
            updateUI()
        }
    }
    
}

