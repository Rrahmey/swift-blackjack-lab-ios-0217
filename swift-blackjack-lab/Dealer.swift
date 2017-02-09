//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Raquel Rahmey on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var deck =  Deck()
    var house =  House(name:"House")
    var player = House(name: "Player")
    var bet:UInt = 0
    
    func place(bet:UInt) -> Bool {
        if house.canPlace(bet: bet) && player.canPlace(bet: bet) {
            self.bet = bet
            return true
        } else {
            return false
        }
    }
    
    func deal() {
        player.cards = []
        house.cards = []
        house.stayed = false
        player.stayed = false 
        deck.shuffle()
        for i in 0...1 {
            player.cards.append(deck.drawCard())
            house.cards.append(deck.drawCard())
        }
    }
    
    func turn(house: House) {
        if house.busted != true && house.blackjack != true && house.stayed != true && house.mayHit{
            if house.mustHit {
                house.cards.append(deck.drawCard())
            } else {
                house.stayed = true
            }
        }
        
        
    }
  
    func winner() -> String{
        if player.busted {
            return "house"
        } else if house.busted {
            return "player"
        }else if player.blackjack{
            return "player"
        }else if house.blackjack{
            return "house"
        }else if player.cards.count == 5 {
            return "player"
        } else if player.stayed && house.stayed && player.handscore <= house.handscore {
            return "house"
        } else if player.stayed && house.stayed && player.handscore > house.handscore{
            return "player"
        } else {
            return "no"
        }
        
    }
    
    func award() -> String {
        var winner: String = self.winner()
        if winner == "player" {
            player.didWin(bet: bet)
            house.didLose(bet: bet)
            return "The player wins \(bet)"
        } else if winner == "house" {
            house.didWin(bet: bet)
            player.didLose(bet: bet)
            return "The house wins \(bet)"
        } else {
            return "There is no current winner"
        }
    
    }
    
    
    
}
