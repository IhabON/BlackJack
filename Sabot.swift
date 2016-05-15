//
//  Sabot.swift
//  BlackJack
//
//  Created by Supinfo on 14/05/2016.
//  Copyright © 2016 Supinfo. All rights reserved.
//

import Foundation

class Sabot {
    var decks:[Deck] = []
    
    //constructor
    init (number:Int = 4) {
        for _ in 0..<number {
            let tempDeck = Deck ()
            tempDeck.initDeck()
            decks.append(tempDeck)
        }
    }
    //adding a new deck to the Shoe
    func addDeck() {
        let newDeck:Deck = Deck()
        newDeck.initDeck()
        decks.append(newDeck)
    }
    
    //getting rid of all decks, used for new game
    func removeAllDeck() {
        decks.removeAll(keepCapacity: false);
    }
    
    
    
}
    