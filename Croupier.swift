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
    var CarteCache:Card
    //constructor
    init (name: String) {
        self.Name = "Croupier"
    }
    
    var cards:[Card] = []
    var CarteRouge : Card = "Rouge"
    var score: Double = 0.0
    
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
    
    func AjouterCarteRouge() {
        cards.append(CarteRouge);
    }
    
    func cut(d:Deck, CarteB: Card) {
        var joueur = [Joueur].self
        var rnd = random( joueur)//Sortir un nombre aléatoire entre 1 (exclure la banque à 0) jusqu'au max de joueur
        print(joueur[rnd] + " à été désigné, placez la carte bleu dans le deck. [1-312]")
        var correctAnswer:Bool = false
        while correctAnswer == false {
            var answerBlue:String = readLine()!// Récupère la réponse du joueur
            if (answerBlue >= "1" || answerBlue <= "312"){
                correctAnswer = true
            }
        }
        cards = insert("Blue", atIndex: answerBlue) // Ajout de la carte bleu dans le paquet à l'emplacement définit par le joueur
        cardsCount = cards.count
        cards = insert("Red", atIndex: cardsCount) // Place la carte rouge à la fin du paquet
        
        var newIndex = 314 - answerBlue
        var i: Int = 0
        var arrayTemp = [String]
        while i < 314 {
            i += 1
            arrayTemp = ""
        }
    }
    
    
}