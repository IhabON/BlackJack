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
        for nbC in 0..<couleur.count {
            for nbV in 0..<valeur.count {
                cards.append(Card(numero: valeur[nbV], couleur: couleur[nbC]))}
        }
    }
        
    
        //var i = 0
        //while i < 4 {
            //i += 1
            //for (cle, valeur) in cards {
                //for i = 0; i < 5; i++ {
                    ////newCard = cle + " " + color[i]
                    //cards = cards + newCard
                //}
            //}
        //}
    //}
    
    func drawCard() -> Card?{
        let	randomNumberOne = Int(arc4random_uniform(UInt32(cards.count)))
        let aCard = cards[randomNumberOne]
        cards.removeAtIndex(randomNumberOne)
        return aCard
    }
    
    func mixCard() {
        let j = cards.count
        for i in 0..<j {
            let randomNumber = Int(arc4random_uniform(UInt32(j-i)))
            let temp = cards[i]
            cards[i] = cards[randomNumber]
            cards[randomNumber] = temp
        }
        //for i in 0..<j {
            //var k = arc4random(j)
            //var m = arc4random(j)
            //cards[k] = cards[m]
            //cards[m] = cards[k]
    }
    
            
   
        
    func destroyCards() {
        var burned: [Card] = []
        var cards: [Card] = []
        var tempArray: [Card] = []
        for i in 0..<cards.count {
            if (i < 5){
                burned[i] = cards[i] //Met la carte à la poubelle
            } else {
                let j = i - 5
                tempArray[j] = cards[i] // Le tableau temporaire prends les valeurs du tableau cards à partir des cartes non détruite, donc i + 5
            }
        }
        cards = tempArray
    }
}
