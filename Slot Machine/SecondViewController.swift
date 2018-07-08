//
//  SecondViewController.swift
//  Slot Machine
//
//  Created by Noah Rubin on 7/8/18.
//  Copyright © 2018 Noah Rubin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var multiplierIncreseLabel: UIButton!
    @IBOutlet weak var multiplierLabel: UILabel!
    
    var bet = 10
    var winAmm = 300
    var coins = 400
    var multiplier = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        multiplierIncreseLabel.setTitle("Change multiplier to \(multiplier + 2) for \(((multiplier)-29) * 250) coins", for: .normal)
        coinLabel.text = "PicaCoins: \(coins)"
        multiplierLabel.text = "Multiplier: \(multiplier)"
        coinLabel.textColor = .black
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
            coinLabel.textColor = .black
            coins -= (multiplier-29) * 250
            multiplier += 2
            coinLabel.text = "PicaCoins: \(coins)"
            multiplierIncreseLabel.setTitle("Change multiplier to \(multiplier + 2) for \(((multiplier)-29) * 250) coins", for: .normal)
            multiplierLabel.text = "Multiplier: \(multiplier)"
        }
        else{
            coinLabel.textColor = .red
        }
    }
    
    @IBAction func addCoinsTapped(_ sender: Any) {
        if(multiplier > 2){
            multiplier -= 2
            coins += 500
            coinLabel.text = "PicaCoins: \(coins)"
            multiplierLabel.text = "Multiplier: \(multiplier)"
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
