//
//  Main.swift
//  BlackJack
//
//  Created by Supinfo on 14/05/2016.
//  Copyright © 2016 Supinfo. All rights reserved.
//

import Foundation

struct LaMain {
    var bet = 0.0
    var initialCardPair = false
    var doubled = false
    var split = false
    var card: [Card]
    
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
    
       
    // Les cartes dans la var card valent ex : "deux carreaux"
    // On substring avec " " comme délimiteur, on récupère la première valeur retourné
    // Qui est la valeur de la carte, et qui est donc la clé du dictionnaire value
    // Enfin, on récupère la valeur grace à la clé, dans le dictionnaire
    func countHand(card : [Card]) -> Int {
        var delimiter: String = " "
        var isAs:Bool = false
        var asCount: Int = 0
        var sum: Int = 0
        for i in card {
            var sub:[Card] = card[0].componentsSeparatedByString(delimiter)
            var cardValue:Int = sub[0].numero.valeur
            if cardValue == 11 {
                isAS = true
                asCount = asCount + 1
            }
            sum = sum + cardValue
        }
        //Si un ou plusieurs As sont dans la main, enlève 10 tant que la main vaut plus que 21. L'As vaut donc 1 sinon 11
        if isAS == true && sum > 21 {
            for i in 0..<asCount {
                if (sum > 21){
                    sum = sum - 10
                }
            }
        }
        return sum
    }

}

