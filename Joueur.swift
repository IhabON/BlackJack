//
//  Joueur.swift
//  BlackJack
//
//  Created by Supinfo on 14/05/2016.
//  Copyright © 2016 Supinfo. All rights reserved.
//

import Foundation

class Joueur {
    var cards:[Card] = []
    var JoueurName: String
    
    var playerToken: Int = 0
    var playerBetTable: Int = 0
    
    var EnJeu:Bool = false
    var abondon:Bool = false
    var split:Bool = false
    var Main: LaMain

    var hand: [Card] = [] // Initialise la main
   
    init (name: String, jeton: Int , mise: Int) {
        self.JoueurName = name
        self.playerToken = jeton
        self.playerBetTable = mise
    }

    func addCard(aNewCard: Card){ // Ajoute une Carte à la main
        self.hand.append(aNewCard);
    }

    func reinitHand() { // Vide la main
        self.hand = []
    }

    func totalHand() -> Int { // Appel la méthode countHand pour calculer la valeur de la main
        return Main.countHand(self.hand)
    }

    func cardNumber() -> Int { // Compte combien de cartes contient la main
        return hand.count
    }
    
    func checkScore() -> (intScore: Int, strScore: String) {
        var intScore:Int = 0
        for n in cards {intScore += n.numero.valeur.first}
        let strScore:String = "\(intScore)"
        return (intScore, strScore)
    }
    
    func AjouterCarteBleue(card: Card) {
        cards.append(card);
    }
    
    var setEnJeu:Bool {
        get {return self.EnJeu}
        set(newBoolValue) { self.EnJeu = newBoolValue}
    }
    
    var setAbondon:Bool {
        get {return self.abondon}
        set(newBoolValue) { self.abondon = newBoolValue}
    }
    
    var setSplit:Bool {
        get {return self.split}
        set(newBoolValue) { self.split = newBoolValue}
    }
    
    
}




