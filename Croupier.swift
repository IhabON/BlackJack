//
//  Croupier.swift
//  BlackJack
//
//  Created by Supinfo on 14/05/2016.
//  Copyright © 2016 Supinfo. All rights reserved.
//

import Foundation

class Croupier {
    
    
    var cards:[Card] = []
    
    //this function behaves differently for dealer
    func checkScore(type:String) -> (intScore: Int, strScore: String) {
        if (type == "hidden") {
            var intScore:Int = 0
            for ndx in cards {intScore += ndx.numero.valeur.first}
            intScore = intScore - cards[0].numero.valeur.first
            let strScore:String = "\(intScore)"
            return (intScore, strScore) }
        else {
            var intScore:Int = 0
            for ndx in cards {intScore += ndx.numero.valeur.first}
            let strScore:String = "\(intScore)"
            return (intScore, strScore)
        }
    }
    
    func AjouterCarteRouge(card: Card) {
        cards.append(card);
    }
}