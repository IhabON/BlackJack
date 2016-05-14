//
//  Main.swift
//  BlackJack
//
//  Created by Supinfo on 14/05/2016.
//  Copyright © 2016 Supinfo. All rights reserved.
//

import Foundation

class LaMain    {
    var bet = 0.0
    var initialCardPair = false
    var doubled = false
    var split = false
    
    enum MainEtat: Int {
        case Active = 1, VraiBlackjack, EnJeu, Depasser, Abondon, Gagne, Perdu, Equivalent
    }
    var MaMainEtat: MainEtat = .Active
    var containsAce: Bool {
        for card in self.cards {
            if card.rank.values.second != nil {
                return true
            }
        }
        return false
    }

}