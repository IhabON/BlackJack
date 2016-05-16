//
//  Jeton.swift
//  BlackJack
//
//  Created by Supinfo on 14/05/2016.
//  Copyright © 2016 Supinfo. All rights reserved.
//

import Foundation


class Jeton {
    var blue: Int = 1
    var green: Int = 2
    var red: Int = 5
    var white: Int = 10
    var black: Int = 10
    var playerToken: Int = 0
    
    func basicToken() { // Le joueur commence avec une valeur de 1200
        playerToken = 1200
    }
    
    func showToken() -> Int {
        return playerToken
    }
    
    func bet(playerBet: Int) -> Int{
        playerToken = playerToken - playerBet
        return playerToken
    }
    
    func winBet(prize: Int) -> Int{
        playerToken = playerToken + prize
        return playerToken
    }
    
    func equalBet(player: Joueur){
        player.playerToken = player.playerToken + player.playerBetTable
    }
    
    func winAssur(player: Joueur){
        player.playerToken = player.playerToken + player.playerBetTable + player.assurance
    }
    
    func loseAssur(player: Joueur){
        player.assurance = 0
        player.playerBetTable = 0
    }
    func winAssurLoseBet(player: Joueur){
        player.playerToken = player.playerToken + player.assurance
    }
    
    func playerBet(player: Joueur){
        // Miser
        print("A vous de miser " + player.JoueurName)
        print("Vous avez le choix entre miser 1, 2, 5, 10 euros")// Ne peut miser qu'un jeton !!
        var newBet:String? = readLine()// Récupère la valeur du jeton choisi
        var theBet:Int = bet(newBet.hashValue)
        return theBet
    }
    
    func betDouble(player : Joueur){
        player.playerBetTable = player.playerBetTable + player.playerBetTable
        player.playerToken = player.playerToken - player.playerBetTable
    }
    
    func playerAssur(player : Joueur){
        self.playerAssurance = player.playerBetTable / 2   // Arrondir au nombre au dessus
        player.playerBetTable = player.playerBetTable + ( player.playerBetTable / 2 )
    }
}