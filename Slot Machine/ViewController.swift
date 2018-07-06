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
    
    let slotOptions = ["🍒", "🍋", "🍊", "🎱", "🎲", "💰"]
    
    /*
    var timer = Timer()
    var cycle = 0.0
    var index = 0
    var stopSpin = true
    
    func resetTimer ()
    {
        cycle += 0.2
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: cycle, target: self, selector: #selector(updateDisplay), userInfo: nil, repeats: true)
    }
    
    @objc func updateDisplay()
    {
        resetTimer()
        index += 1
        if(index == slotOptions.count && stopSpin){
            index = 0
        }
        //leftSlot.text = slotOptions[index]
    }
    
    */
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updateDisplay()
        //spin()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        spin()
    }
    
    func spin(){
        //updateDisplay()
        
        let leftPick = Int(arc4random_uniform(UInt32(slotOptions.count-1)))
        let centerPick = Int(arc4random_uniform(UInt32(slotOptions.count-1)))
        let rightPick = Int(arc4random_uniform(UInt32(slotOptions.count-1)))
        leftSlot.text = slotOptions[leftPick]
        centerSlot.text = slotOptions[centerPick]
        rightSlot.text = slotOptions[rightPick]
        
        if(leftSlot.text == centerSlot.text && centerSlot.text == rightSlot.text){
            print("Winner")
        }
    }
    
}

