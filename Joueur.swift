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
    var playerName: String = ""
    var score: Double = 0.0
    var dyfg : Int = 1000
    var mise: Int = 0
    var EnJeu:Bool = false
    var abondon:Bool = false
    var split:Bool = false

    var hand: [Card] = [] // Initialise la main

    init (name: String) {
        self.playerName = name
    }

    func addCard(aNewCard: Card){ // Ajoute une Carte à la main
        self.hand.append(aNewCard);
    }

    func reinitHand() { // Vide la main
        self.hand = []
    }

    func totalHand() -> Int { // Appel la méthode countHand pour calculer la valeur de la main
        return countHand(self.hand)
    }

    func cardNumber() -> Int { // Compte combien de cartes contient la main
        return hand.count
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




// Les cartes dans la var card valent ex : "deux carreaux"
// On substring avec " " comme délimiteur, on récupère la première valeur retourné
// Qui est la valeur de la carte, et qui est donc la clé du dictionnaire value
// Enfin, on récupère la valeur grace à la clé, dans le dictionnaire
    func countHand(card : Card[]) -> Int {
    var delimiter: String = " "
    var isAs = false
    var asCount = 0
    var sum: Int = 0
    for i in card {
        var sub = card[0].componentsSeparatedByString(delimiter)
        cardValue = value[sub[0]]
        if cardValue == 11 {
            isAS = true
            asCount = asCount + 1
        }
        sum = sum + cardValue
    }
    // Si un ou plusieurs As sont dans la main, enlève 10 tant que la main vaut plus que 21. L'As vaut donc 1 sinon 11
    if isAS == true && sum > 21 {
        for i in asCount {
            if (sum > 21){
                sum = sum - 10
            }
        }
    }
    return sum
}
