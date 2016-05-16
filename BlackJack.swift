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
    var j: Joueur
    var croupier: Croupier
    var JoueurActuel:Int = 0
    var currentDeck:Int = 0
    
    init () {
    print("Bonjour et bienvenue !")
    var playing = true
    while playing == true {
    print("Choisissez le nombre de joueur")
    var nbPlayer: Int = readLine()!.hashValue// Récuperer le nombre de joueur
    var Player:[String] = ["Bank"]
    //var table("Bank")
    var i = 0
    var canPlay: [Int] = []
    // Initialiser les joueurs, avec leur jetons
    while i < nbPlayer {
    //i += 1
    //Player = Joueur()
    //print("Bonjour " + Player[i])
    //Jeton()
    //print("Vous avez " + showToken())
    //table(Player[i])
    //canPlay[i] = 1
    }
    
        // Initialiser le jeu de carte
        var deck:Deck = Deck()
        
        mixCard(deck.initDeck())
        cut(deck.initDeck())
        destroyCards(deck.initDeck())
        
        
        
        var keepPlaying = true
        // Tant que la bank a de l'argent, ou que les joueurs en ont, le jeu continue.
        while keepPlaying == true{
            
            // Première distribution
            var addCardTurn: Int = 0
            while addCardTurn < 2 {
                addCardTurn += 1
                for i in Player {
                    deck = Player[i].pickCard(deck)///////////////////////////////////////////////
                }
            }
            /////////////////////////////////////////////////////
            var playersBet:[Int] =[]
            for i in Player {
                playersBet[i] = joueur[i].playerBet() //Les joueurs misent avant la distribution des cartes
            }
            
            
            
            // Les joueurs jouent chacun à leur tour, i += 1 pour passer la banque
            for i in Player {
                
                i += 1
                
                print("C'est à vous de jouer " + Player[i].playerName)
                print("La banque à " + Player[0].hand[0]) // On affiche seulement la première carte, la seconde sera dévoilé quand tout le monde aura joué
                print("Votre jeu contient les cartes suivantes :")
                
                for j in Player[i].hand {
                    print(Player[i].hand[j])
                }
                
                allowedToDo(Player[i], Player[i].hand, Player[0].hand) // On envoi le player, sa main, et la main du croupier
                // On attend que le joueur choisisse le bouton
                //
                //
                var isPlaying = true
                
                while ( Regle().assurance || isPlaying ) {
                    switch button {
                    case 1 : // Carte
                        Player[i].pickCard(deck, Player[i])
                    case 2 : // servie
                        isPlaying = false
                    case 3 : // Double la mise
                        Player[i].doubleBet(deck, Player[i])
                        isPlaying = false
                    case 4 : // Separe la main
                        Player[i].separate()
                    case 5 : // assurance
                        Player[i].assurance(deck, Player[i]) // Dans la classe condition de victoire, mettre un if(assurance)
                        rules().assurance = false
                    }
                }
                
            }
            var botPlaying = true
            while botplaying {
                tableCountHand = countHand(Player[0].hand())
                if (countHand[0] < 17 && (countHand[1] == 0 && countHand[1] < 17)) {
                    Player[0].pickCard()
                }
            }
            
            
            var result = condition(Player[i], Player[0])
            print(result)
            
            var sumCanPlay: Int = 0
            var bankCanPlay: Int = 0
            for i in Player {
                if (Player[i].showToken() < 0){
                    canPlay[i] = 0
                }
                if (i > 0) {//Donc tous, sauf la banque
                    sumCanPlay = sumCanPlay + canPlay[i]
                }
            }
            if (sumCanPlay == 0 || canPlay[0] == 0){
                keepPlaying = false
            }
            
            if (Player.length * 10 < cards.length && keepPlaying == true){//////////////////////////////
                deck = deckOfCards()
                mixCard(deck)
                cut(deck)
                deckOfCards(deck)
            }
            
        }
        
        
        // Fin de jeu, lorsque la bank a perdu
        print("Voulez vous recommencer ? o/n")
        var answer:Bool = true
        
        while (answer == false) {
            var response:String? = readLine()
            if (response == "n"){
                answer = true
                playing = false
            }
            else if (response != "o"){
                answer = true
            }
        }
    
    }
}