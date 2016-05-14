//
//  BlackJack.swift
//  BlackJack
//
//  Created by Supinfo on 14/05/2016.
//  Copyright © 2016 Supinfo. All rights reserved.
//

import Foundation

class BlackJack {
    var sabot:Sabot
    var joueur:[Joueur] = []
    var j: Joueur = Joueur()
    var croupier: Croupier = Croupier()
    var JoueurActuel:Int = 0
    var currentDeck:Int = 0
    
    //constructor
    init (deckSize:Int, playerNumber:Int) {
        //shoe reference
        sabot = Sabot(number: deckSize)
        //depending on users input, appropiate number of players is created.
        for i in 0..<playerNumber { AjouterJoueur() }
        //initially each player is given 2 cards.
        for j in joueur {for i in 0..<2{j.addCard(getCard(currentDeck)!)}}
        croupier.AjouterCarteRouge(getCard(currentDeck)!)
        j.AjouterCarteBleue(getCard(currentDeck)!)
        
        //dealer's hidden card will be stored in a temporary variable, cardBack picture will replace it.
        croupier.hiddenCard = croupier.cards[0]}
    
    //adding new player to the game
    func AjouterJoueur() {
        let NouveauJoueur:Joueur = Joueur();
        joueur.append(NouveauJoueur)
    }
    
    func getCard(deckNdx:Int) -> Card? {
        if (sabot.decks[currentDeck].cards.count <= 10 ) {currentDeck = currentDeck + 1 }
        return sabot.decks[deckNdx].drawCard()!
    }
    
    //calls the split function for player at playerNdx index
    func split (NumJoueur:Int) {
        let card: Card = getCard(currentDeck)
        if (joueur[NumJoueur].split == false ) {
            joueur[NumJoueur].setSplit = true
            joueur[NumJoueur].addCard(card)}
        
    }
    
    //calls the stand function for player at playerNdx index
    func stand (NumJoueur:Int) {
        if (joueur[NumJoueur].EnJeu == false ) {
            joueur[NumJoueur].setEnJeu = true
            JoueurActuel = JoueurActuel + 1
            if (JoueurActuel > joueur.count - 1) {JoueurActuel = 0}
        }
        else {
            JoueurActuel = JoueurActuel + 1
            if (JoueurActuel > joueur.count - 1) {JoueurActuel = 0}
        }
    }
    
    func cut(joueur: [Int]) {
        var rnd = random(joueur.lenght)//Sortir un nombre aléatoire entre 1 (exclure la banque à 0) jusqu'au max de joueur
        print(joueur[rnd] + " à été désigné, placez la carte bleu dans le deck. [1-312]")
        var correctAnswer:Bool = false
        while correctAnswer == false {
            var answerBlue = ""// Récupère la réponse du joueur
            if (answerBlue >= 1 || answerBlue <= 312){
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