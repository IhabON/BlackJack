//
//  Croupier.swift
//  BlackJack
//
//  Created by Supinfo on 14/05/2016.
//  Copyright © 2016 Supinfo. All rights reserved.
//

import Foundation

class Croupier {
    var Name:String
    var hiddenCard:Card
    //constructor
    init (name: String) {
        self.Name = "Croupier"
    }
    
    var cards:[Card] = []
    var score: Double = 0.0
    
    func unhide() -> Card? {
        cards[0].numero = hiddenCard.numero
        return cards[0]
    }
    func checkScore(type:String) -> (intScore: Int, strScore: String) {
        if (type == "hidden") {
            var intScore:Int = 0
            for n in cards {intScore += n.numero.valeur.first}
            intScore = intScore - cards[0].numero.valeur.first
            let strScore:String = "\(intScore)"
            return (intScore, strScore) }
        else {
            var intScore:Int = 0
            for n in cards {intScore += n.numero.valeur.first}
            let strScore:String = "\(intScore)"
            return (intScore, strScore)
        }
    }
    
    
    func cut(j: [Int], var d: [Card]) {
        var rnd = Int(arc4random_uniform(UInt32(j.count)))//Sortir un nombre aléatoire entre 1 (exclure la banque à 0) jusqu'au max de joueur
        print("Le Joueur numero" + "\(rnd)" + " à été désigné, placez la carte bleu dans le deck. [1-312]")
        var correctAnswer:Bool = false
        var answerBlue:String = readLine()!
        while correctAnswer == false {
            // Récupère la réponse du joueur
            if (answerBlue.hashValue >= 1 || answerBlue.hashValue <= 312){
                correctAnswer = true
            }
        }
        
        
        cards.insert("Blue", atIndex: answerBlue.hashValue) // Ajout de la carte bleu dans le paquet à l'emplacement définit par le joueur
        var cardsCount = cards.count
        cards.insert("Red", atIndex: cardsCount) // Place la carte rouge à la fin du paquet
        
        var newIndex:Int = 314 - answerBlue.hashValue
        var i: Int = 0
        var arrayTemp:[Card] = []
        while i < 314 {
            i += 1
            arrayTemp = []
        }
        var newIndexBis:Int = newIndex
        var indexRed: Int = 0
        for i in arrayTemp {
            if (i.currentCard < newIndexBis) {
                arrayTemp.insert(d[i.currentCard], atIndex: newIndexBis)
                newIndexBis += 1
            } else if (i.currentCard > newIndexBis) {
                arrayTemp.insert(d[i.currentCard], atIndex: indexRed)
                indexRed += 1
            }
        }
        d = arrayTemp
        return d
    }
}