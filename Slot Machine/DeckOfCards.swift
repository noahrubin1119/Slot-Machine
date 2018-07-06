//
//  DeckOfCards.swift
//  Slot Machine
//
//  Created by Noah Rubin on 7/5/18.
//  Copyright © 2018 Noah Rubin. All rights reserved.
//

import Foundation

class DeckOfCards{
    
    var deck = [Card]()
    
    init(){
        var suit = "Hearts"
        for num in 2...15{
            deck.append(Card(s: suit, v: num))
        }
        suit = "Diamonds"
        for num in 2...15{
            deck.append(Card(s: suit, v: num))
        }
        suit = "Clubs"
        for num in 2...15{
            deck.append(Card(s: suit, v: num))
        }
        suit = "Spades"
        for num in 2...15{
            deck.append(Card(s: suit, v: num))
        }
    }
    
    func shuffle(){
        for _ in 0..<deck.count{
            let rand = Int(arc4random_uniform(UInt32(deck.count-1)))
            deck.append(deck[rand])
            deck.remove(at: rand)
        }
    }
    
    func deal() -> Card{
        let tempCard = deck[0]
        deck.remove(at: 0)
        return(tempCard)
    }
    
    func discard(discardedCard: Card){
        deck.append(discardedCard)
    }
    
    
}
