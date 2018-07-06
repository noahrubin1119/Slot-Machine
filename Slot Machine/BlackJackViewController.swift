//
//  BlackJackViewController.swift
//  Slot Machine
//
//  Created by Noah Rubin on 7/5/18.
//  Copyright © 2018 Noah Rubin. All rights reserved.
//

import UIKit

class BlackJackViewController: UIViewController {

    @IBOutlet weak var yourCardsLabel: UILabel!
    var yourCards = [Card]()
    var dealersCards = [Card]()
    var houseDeck = DeckOfCards()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        houseDeck.shuffle()
        
        //deal the cards:
        yourCards.append(houseDeck.deal())
        yourCards.append(houseDeck.deal())
        dealersCards.append(houseDeck.deal())
        dealersCards.append(houseDeck.deal())
        
        yourCardsLabel.text = "Your cards are: \(yourCards[0].toString()), and \(yourCards[1].toString())"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
