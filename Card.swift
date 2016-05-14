//
//  Card.swift
//  BlackJack
//
//  Created by Supinfo on 14/05/2016.
//  Copyright © 2016 Supinfo. All rights reserved.
//

import Foundation


    
    enum Couleur: Character{
        case Pique = "♠", Coeur = "♡", Carre = "♢", Trefle = "♣"
    }
    
    enum Numero: Int {
        case Deux = 2, Trois = 3, Quatre = 4, Cinq = 5, Six = 6, Sept = 7, Huit = 8, Neuf = 9, Dix = 10
        case Valet, Reine, Roi, As
        
        struct Values {
            let first: Int, second: Int?
        }
        
        //Valeur des cartes, on met deux valeur pour chaque carte car l'AS a deux valeur différentes selon le cas soit 1 ou 11
        var valeur: Values{
            switch self {
            case .As:
                return Values(first: 1, second: 11)
            case .Valet, .Reine, .Roi:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }

struct Card{
    var currentCard:Int = 0
    var couleur: Couleur
    var numero: Numero
    var hidden:Bool = false
    
    init(numero: Numero, couleur: Couleur) {
        self.numero = numero
        self.couleur = couleur
    }
    var description: String {
        var output = "la couleur est \(couleur.rawValue),"
        output += "la valeur de la carte est \(numero.valeur.first)"
        if let second = numero.valeur.second {
            output += " ou \(second)"
        }
        return output
    }
}
