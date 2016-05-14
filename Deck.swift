//
//  Deck.swift
//  BlackJack
//
//  Created by Supinfo on 14/05/2016.
//  Copyright © 2016 Supinfo. All rights reserved.
//

import Foundation

class Deck {
    var cards:[Card] = []
    
    let valeur = [Numero.As, Numero.Deux, Numero.Trois, Numero.Quatre, Numero.Cinq, Numero.Six, Numero.Sept, Numero.Huit, Numero.Neuf, Numero.Dix, Numero.Valet, Numero.Reine, Numero.Roi]
    let couleur = [Couleur.Pique, Couleur.Coeur, Couleur.Trefle, Couleur.Carre]
    
    
    func initDeck() {
        var i = 0
        while i < 4 {
            i += 1
            for (cle, valeur) in cards {
                for i = 0; i < 5; i++ {
                    newCard = cle + " " + color[i]
                    cards = cards + newCard
                }
            }
        }
    }
    
    
    func mixCard() {
        var j = cards.count
        var i = 0
        for i in j {
            k = arc4random(j)
            m = arc4random(j)
            cards[k] = cards[m]
            cards[m] = cards[k]
        }
    }
    
    func pullOut() -> Card {
        var j = cards.count
        if j>0 {
            let card = cards.removeAtIndex(0)
            return card
        } else {
            return null
        }
}
