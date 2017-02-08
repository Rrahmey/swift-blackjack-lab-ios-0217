//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Raquel Rahmey on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation


class Deck {
    var undealtCard:[Card] = []
    var dealtCards: [Card] = []
    var description: String {
        var cardDescrip = ""
        if dealtCards.isEmpty {
            cardDescrip = "Cards Remaining: \(undealtCard.count) and the cards are \(descriptionFor(cardArray: undealtCard)) and Cards Dealt: 0"
        } else {
            cardDescrip =  "Cards Remaining: \(undealtCard.count) and the cards are \(descriptionFor(cardArray: undealtCard)) \n The number of cards dealt is \(dealtCards) and the cards are \(descriptionFor(cardArray: dealtCards))"
        }
        return cardDescrip
    }
    
    init () {
        self.undealtCard = fillCardDeck()
    }
    
    
    
    //Fills a new variable with a brand new deck
    func fillCardDeck() -> [Card]{
        let suits = ["♣︎","♠︎","♥︎","♦︎"]
        let ranks = ["K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2", "A"]
        
        for rank in ranks {
            for suit in suits {
                undealtCard.append(Card(suit:"\(suit)", rank: "\(rank)"))
            }
        }
        return undealtCard
    }
    
    func drawCard() -> Card{
        if undealtCard.isEmpty != true {
            dealtCards.insert(undealtCard[0], at: 0)
            undealtCard.remove(at: 0)
        }
        return dealtCards[0]
        
    }
    
    
    func shuffle() {
        var gatheredCards = undealtCard + dealtCards
        undealtCard = []
        let cardCount = gatheredCards.count - 1
        for i in 0...cardCount  {
            let randomNumber: Int = Int(arc4random_uniform(UInt32(((gatheredCards.count-1)))))
            let grabbedCard:Card = gatheredCards[randomNumber]
            undealtCard.append(grabbedCard)
            gatheredCards.remove(at: randomNumber)
        }
    }

    
    
    
    
    
}
