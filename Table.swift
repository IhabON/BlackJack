//
//  Table.swift
//  BlackJack
//
//  Created by Supinfo on 16/05/2016.
//  Copyright © 2016 Supinfo. All rights reserved.
//

import Foundation

class Table {
    var betPlayer: Int
    var player: Int

    init(playerName : String){
        player = playerName
        betPlayer = 0
    }

func tableBet() {
    
}

func cleanTable() {
    for i in betPlayer {
        betPlayer[i] = 0
    }
}

func showTableBet(i: int) {
    return betPlayer[i]
}

func betForBank() {
    
}
}