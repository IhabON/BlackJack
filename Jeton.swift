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
    var playerBetTable: Int = 0
    
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
}