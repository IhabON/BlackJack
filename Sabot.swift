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
    init (number:Int = 1) {
        for ndx in 0..<number {
            var tempDeck = Deck ()
            tempDeck.createDeck()
            decks.append(tempDeck)
        }
    }
    //adding a new deck to the Shoe
    func addDeck() {
        var newDeck:Deck = Deck()
        newDeck.createDeck()
        decks.append(newDeck)
    }
    
    //getting rid of all decks, used for new game
    func removeAllDeck() {
        decks.removeAll(keepCapacity: false);
    }
    
}
    