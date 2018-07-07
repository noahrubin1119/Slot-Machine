//
//  ViewController.swift
//  Slot Machine
//
//  Created by Noah Rubin on 7/5/18.
//  Copyright © 2018 Noah Rubin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //for every $1 that you wager, you will win back $0.92 or $0.96 in the long-term – the rest will be won by the casino. And so it is with slot machine games too
    @IBOutlet weak var leftSlot: UILabel!
    @IBOutlet weak var centerSlot: UILabel!
    @IBOutlet weak var rightSlot: UILabel!
    @IBOutlet weak var slotImage: UIImageView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var betLabel: UILabel!
    
    let slotOptions = ["🍒", "🍋", "🍊", "🎱", "🎲", "💰"]

    var index = 0
    var stopSpin = true
    var gameTimer: Timer!
    var bet = 10
    var winAmm = 300
    var coins = 400
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slotImage.image = #imageLiteral(resourceName: "slot")
        winAmm = bet*30
        winLabel.text = "You can win: \(winAmm)"
        betLabel.text = "Bet: \(bet)"
        coinsLabel.text = "PicaCoins: \(coins)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        if(coins > 0){
            coins -= bet
            coinsLabel.text = "PicaCoins: \(coins)"
            slotImage.image = #imageLiteral(resourceName: "slot")
            spin()
        }
    }
    
    @IBAction func betStepper(_ sender: UIStepper) {
        bet = Int(sender.value)
        winAmm = bet*30
        betLabel.text = "Bet: \(bet)"
        winLabel.text = "You can win: \(winAmm)"
    }
    
    func spin(){
        //updateDisplay()
        
        let leftPick = Int(arc4random_uniform(UInt32(slotOptions.count-1)))
        let centerPick = Int(arc4random_uniform(UInt32(slotOptions.count-1)))
        let rightPick = Int(arc4random_uniform(UInt32(slotOptions.count-1)))
        //spinWheel(labelToChange: leftSlot, rand: leftPick)
        
        leftSlot.text = slotOptions[leftPick]
        centerSlot.text = slotOptions[centerPick]
        rightSlot.text = slotOptions[rightPick]
        
        if(leftSlot.text == centerSlot.text && centerSlot.text == rightSlot.text){
            slotImage.image = #imageLiteral(resourceName: "winnerSlot")
            print("Winner")
            coins += winAmm
            coinsLabel.text = "PicaCoins: \(coins)"
        }
    }
    /*
    func spinWheel(labelToChange: UILabel, rand: Int){
        for n in 0...slotOptions.count{
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.setLabel(label: labelToChange, num: n)), userInfo: nil, repeats: true)
        }
        for n in 0...rand{
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.setLabel(label: labelToChange, num: n)), userInfo: nil, repeats: true)
        }
    }
    
    @objc func setLabel(label: UILabel, num: Int){
        label.text = slotOptions[num]
        gameTimer.invalidate()
    }
    
    */
}

