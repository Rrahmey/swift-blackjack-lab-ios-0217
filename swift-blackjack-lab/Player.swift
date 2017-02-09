//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Raquel Rahmey on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    var name:String
    var cards: [Card] = []
    var handscore: UInt {
        var totalCardScore: UInt = 0
        var trueOrFalse: Bool = checkForAce(card: cards)
        
        
        for card in cards {
            totalCardScore += card.cardValue
        }

        
        if trueOrFalse == true && totalCardScore <= 11 {
            totalCardScore += 10
        }
        return totalCardScore
    }
    var blackjack: Bool{
        if handscore == 21 && cards.count == 2 {
            return true
        } else {
            return false
        }
    }
    var busted: Bool {
        guard handscore > 21 else {return false}
        return true
    }
    var stayed: Bool

    var mayHit: Bool {
        if blackjack != true && busted != true && stayed != true{
            return true
        } else {
            return false
        }
        
    }
    var tokens: UInt
    var description: String {
    var blackjackSentence = ""
        if blackjack == true {
            blackjackSentence = "do"
        } else {
            blackjackSentence = "do not"
        }
    var bustedSentence = ""
        if busted == true {
            bustedSentence = "did"
        } else {
            bustedSentence = "do not"
        }
    var stayedSentence = ""
        if stayed == true {
            stayedSentence = "have"
        } else {
            stayedSentence = "have not"
        }
        return "The player \(name) has cards \(cards.description) with a handscore of \(handscore). They \(blackjackSentence) have blackjack, they \(bustedSentence) busted, and they \(stayedSentence) stayed. They current have tokens:\(tokens)."
    }
    
    init(name:String) {
        self.name = name
        self.stayed = false
        self.tokens = 100
    }
    
    
    
    // check for ace 
    func checkForAce(card: [Card]) -> Bool{
        var isThereAnAce = false
        for newcard in card {
            if newcard.rank.contains("A"){
                isThereAnAce = true
                break
            }
        }
        return isThereAnAce
    }
    
    func canPlace(bet:UInt) -> Bool{
        if bet <= tokens{
            return true
        } else {
            return false
        }
    }
    
    func didWin(bet:UInt) {
        tokens += bet
    }
    
    func didLose(bet:UInt) {
        tokens -= bet
    }
    
    
    
    
    
}
