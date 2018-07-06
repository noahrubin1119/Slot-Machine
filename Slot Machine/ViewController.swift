//
//  ViewController.swift
//  Slot Machine
//
//  Created by Noah Rubin on 7/5/18.
//  Copyright © 2018 Noah Rubin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftSlot: UILabel!
    @IBOutlet weak var centerSlot: UILabel!
    @IBOutlet weak var rightSlot: UILabel!
    @IBOutlet weak var slotImage: UIImageView!
    
    let slotOptions = ["🍒", "🍋", "🍊", "🎱", "🎲", "💰"]
    

    
    var index = 0
    var stopSpin = true
    var gameTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slotImage.image = #imageLiteral(resourceName: "slot")
        //updateDisplay()
        //spin()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        slotImage.image = #imageLiteral(resourceName: "slot")
        spin()
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

