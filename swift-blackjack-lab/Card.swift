//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Raquel Rahmey on 2/7/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    var suit: String
    var rank: String
    var cardLabel: String
    var cardValue: UInt = 0
    var description: String {
        return cardLabel
    }
    
    
    init(suit:String, rank:String) {
        self.suit = suit
        self.rank = rank
        self.cardLabel = "\(suit)\(rank)"
        self.cardValue = determineCardValue(rank:rank)
    }
    
    func validSuits() -> [String] {
        let validSuits = ["♠︎","♣︎","♥︎","♦︎"]
        return validSuits
    }
    
    func validRanks() -> [String] {
        let validRanksArray = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        return validRanksArray
    }
    
    //assigning values to the cards 
    func determineCardValue(rank:String)-> UInt{
        var theCardValue = UInt()
        switch rank {
        case "A":
            theCardValue = 1
        case "2":
            theCardValue = 2
        case "3":
            theCardValue = 3
        case "4":
            theCardValue = 4
        case "5":
            theCardValue = 5
        case "6":
            theCardValue = 6
        case "7":
            theCardValue = 7
        case "8":
            theCardValue = 8
        case "9":
            theCardValue = 9
        case "10":
            theCardValue = 10
        case "J":
            theCardValue = 10
        case "Q":
            theCardValue = 10
        case "K":
            theCardValue = 10
        default:
            print("That is not a value")
        }
        return theCardValue
    }
    
    

}

func descriptionFor(cardArray:[Card]) -> String {
    
    var hearts:[Card] = []
    var spades:[Card] = []
    var diamonds:[Card] = []
    var clubs:[Card] = []
    var clubdescription:String = ""
    var heartdescript:String = ""
    var spadedescript: String = ""
    var diamondDescript: String = ""
    var final: String = ""
    
    
    // sort into suits
    for card in cardArray {
        switch card.suit {
        case "♥︎":
            hearts.append(card)
        case "♣︎":
            spades.append(card)
        case "♦︎":
            diamonds.append(card)
        default:
            clubs.append(card)
        }
    }
    
    
    // sort by rank and added to individual sentences
    diamonds.sort { $0.cardValue < $1.cardValue }
    for card in diamonds {
        diamondDescript += "\(card.description) "
    }
    clubs.sort { $0.cardValue < $1.cardValue }
    for card in clubs {
        clubdescription += "\(card.description) "
    }
    spades.sort { $0.cardValue < $1.cardValue }
    for card in spades {
        spadedescript += "\(card.description) "
    }
    hearts.sort { $0.cardValue < $1.cardValue }
    for card in hearts {
        heartdescript += "\(card.description) "
    }
    final = heartdescript + "\n" + spadedescript + "\n" + diamondDescript + "\n" + clubdescription
    return final
}


