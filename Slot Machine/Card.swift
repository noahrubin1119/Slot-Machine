//
//  Card.swift
//  Slot Machine
//
//  Created by Noah Rubin on 7/5/18.
//  Copyright © 2018 Noah Rubin. All rights reserved.
//

import Foundation

class Card{
    var suit = "" //♥️♣️♠️♦️
    var value = 2
    var picture = false
    
    init(s: String, v: Int){
        switch suit {
        case "Hearts":
            suit = "♥️"
        case "Diamonds":
            suit = "♦️"
        case "Clubs":
            suit = "♣️"
        default:
            suit = "♠️"
        }
        value = v
        if(value == 13){
            value = 11
        }
        else if(value > 10){
            picture = true
            value = 10
        }
    }
    
    func getValue() -> Int {return value}
    func getSuit() -> String {return suit}
    func toString() -> String {return "\(value) of \(suit)"}
}
