//
//  SecondViewController.swift
//  Slot Machine
//
//  Created by Noah Rubin on 7/8/18.
//  Copyright © 2018 Noah Rubin. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

class SecondViewController: UIViewController {

    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var multiplierIncreseLabel: UIButton!
    @IBOutlet weak var multiplierLabel: UILabel!
    @IBOutlet weak var coinIncreaseLabel: UIButton!
    
    var bet = 10
    var winAmm = 300
    var coins = 400
    var multiplier = 0
    
    let pop = SystemSoundID(1312)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //multiplierIncreseLabel.setTitle("Change multiplier to \(multiplier + 2) for \(((multiplier)-29) * 250) coins", for: .normal)
        coinLabel.text = "Coins: \(coins)"
        multiplierLabel.text = "Multiplier: \(multiplier)"
        coinLabel.textColor = .black
         multiplierLabel.textColor = .black
        if(multiplier >= 30){
            multiplierIncreseLabel.setTitle(" Change multiplier to \(multiplier + 2) for \(((multiplier)-29) * 250) coins ", for: .normal)
            coinIncreaseLabel.setTitle(" Get 500 coins for -2 multiplier ", for: .normal)
        }
        else{
            multiplierIncreseLabel.setTitle(" Change multiplier to \(multiplier + 2) for 150 coins ", for: .normal)
            coinIncreaseLabel.setTitle(" Get 100 coins for -2 multiplier ", for: .normal)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! ViewController
        dvc.bet = bet
        dvc.winAmm = winAmm
        dvc.coins = coins
        dvc.multiplier = multiplier
    }
    
    @IBAction func multiplierIncreasedTapped(_ sender: Any) {
        if(coins >= ((multiplier-29) * 250)){
            AudioServicesPlaySystemSound(pop)
            if(multiplier >= 30){
                 multiplierLabel.textColor = .black
                coinLabel.textColor = .black
                coins -= (multiplier-29) * 250
                multiplier += 2
                coinLabel.text = "Coins: \(coins)"
                multiplierIncreseLabel.setTitle(" Change multiplier to \(multiplier + 2) for \(((multiplier)-29) * 250) coins ", for: .normal)
                coinIncreaseLabel.setTitle(" Get 500 coins for -2 multiplier ", for: .normal)
                multiplierLabel.text = "Multiplier: \(multiplier)"
            }
            else{
                coinLabel.textColor = .black
                multiplierLabel.textColor = .black
                coins -= 150
                multiplier += 2
                coinLabel.text = "Coins: \(coins)"
                    multiplierIncreseLabel.setTitle(" Change multiplier to \(multiplier + 2) for 150 coins ", for: .normal)
                coinIncreaseLabel.setTitle(" Get 100 coins for -2 multiplier ", for: .normal)
                
                multiplierLabel.text = "Multiplier: \(multiplier)"
            }
        }
        else{
            coinLabel.textColor = .red
        }
    }
    
    @IBAction func addCoinsTapped(_ sender: Any) {
        if(multiplier > 2){
            AudioServicesPlaySystemSound(pop)
            multiplierLabel.textColor = .black
            coinLabel.textColor = .black
            if(multiplier > 30) {coins += 400}
            coins += 100
            multiplier += -2
            coinLabel.text = "Coins: \(coins)"
            multiplierIncreseLabel.setTitle(" Change multiplier to \(multiplier + 2) for \(((multiplier)-29) * 250) coins ", for: .normal)
            multiplierLabel.text = "Multiplier: \(multiplier)"
            if(multiplier >= 30){
                multiplierIncreseLabel.setTitle(" Change multiplier to \(multiplier + 2) for \(((multiplier)-29) * 250) coins ", for: .normal)
                coinIncreaseLabel.setTitle(" Get 500 coins for -2 multiplier ", for: .normal)
            }
            else{
                multiplierIncreseLabel.setTitle(" Change multiplier to \(multiplier + 2) for 150 coins ", for: .normal)
                coinIncreaseLabel.setTitle(" Get 100 coins for -2 multiplier ", for: .normal)
            }
        }
        else{
            multiplierLabel.textColor = .red
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
