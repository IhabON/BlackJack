//
//  Regle.swift
//  BlackJack
//
//  Created by Supinfo on 15/05/2016.
//  Copyright © 2016 Supinfo. All rights reserved.
//

import Foundation

class Regle {
    
    var aCard:Bool = false // Sert une carte
    var served:Bool = false // Servie, ne rien faire
    var doubleBet:Bool = false // Doubler la mise en tirant une carte et en s'arretant la. Uniquement possible si la somme de la main est égale à 9, 10 ou 11
    var separate:Bool = false // Séparer lorsque les 2 cartes de la main ont une valeur identiquent, crée 2 main, le joueur joue sur les 2 mains et double sa mise, si il gagne 1 jeu, il gagne rien en mise (+50 et -50 par ex), si il perd les 2 il perd tout (-50 et -50), si il gagne les 2 il gagne tout (+50 et +50)
    var assurance:Bool = false // Lorsque la banque a un As, le joueur peut "sauver" une partie de sa mise, il met la moitié de sa mise dans l'assurance. Si il perd avec une main >21, il gagne le double de son assurance et perd sa mise. Si le croupier fait blackjack, le joueur repart avec sa mise et son assurance. Sinon il perd tout
    // le croupier doit s'arreter quand il est entre 17 et 21
    
    
    func allowedToDo(playerR: Joueur, handPlayer: [String], handBank: [String]) {
        var handValue = countHand(handPlayer)
        for i in handValue { // aCard
            if (handValue[i] < 21){ // La second valeur, si elle existe, est forcément inférieur à la première
                aCard = true        // On peut donc boucler sur la variable booleen
                served = true
            }
            if (handValue[i] < 21 && (handValue[i] == 9 || handValue[i] == 10 || handValue[i] == 11) {
            doubleBet = true
            }
        }
        var sub = handBank[0].componentsSeparatedByString(" ")
        if (sub.contains("as") {
            assurance = true
        }
        
        if (handPlayer[0] == handPlayer[1]){
            separate = true
        }
    }
    
    func doubleBet(deck :Deck, playerR: Jeton){
        pickCard(deck, playerR)
        betDouble(playerR)
    }
    
    func separate(deck, playerR: Joueur){
        
    }
    
    func assurance(d: Deck, playerR: Jeton) {
        playerR.playerAssur(playerR)
        assurance = false
    }
    
    func disable() {
        aCard = false
        served = false
        doubleBet = false
        separate = false
        assurance = false
    }
    
    func condition(playerR: Jeton, playerB: Joueur){
        if (!assurance){
            
            var victory = false
            var equal = false
            var handR = countHand(playerR.hand())
            var handB = countHand(playerB.hand())
            if (handR == 21){
                victory = true
                var result = "BlackJack !!"
                if (handB == true) {
                    equal = true
                    result = "Egualité !"
                }
            }
            if (handR < 21){
                victory = true
                var result = "Vous avez gagnez."
                if (handB < 21){
                    victory = false
                    result = "Vous avez perdu."
                    if (handR > handB){
                        victory = true
                    }
                }
            } else if (handB > 21) {
                victory = true
                var result = "Vous avez gagnez."
                if (handR < handB){
                    victory = false
                    result = "Vous avez perdu."
                }
            }
            
            if (equal){
                playerR.equalBet()
                var result = "Egualité !"
            }
        } else {
            var handR = countHand(playerR.hand())
            var handB = countHand(playerB.hand())
            
            if (handB == 21){
                playerR.winAssur()
                var result = "Vous avez gagnez votre assurance et votre mise"
            } else if (handB != 21 && handR > handB){
                playerR.winAssurLoseBet()
                var result = "Vous avez gagnez votre assurance et perdu votre mise."
            } else {
                playerR.loseAssur()
                var result = "Vous avez perdu votre assurance et votre mise"
            }
            
            return result
        }
    }
}