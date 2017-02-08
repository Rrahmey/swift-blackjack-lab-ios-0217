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
        return "The number of cards remaining is \(undealtCard.count) and the cards are \(descriptionFor(cardArray: undealtCard)) \n The number of cards dealt is \(dealtCards) and the cards are \(descriptionFor(cardArray: dealtCards))"
    }
    
    init () {
        self.undealtCard = fillCardDeck()
    }
    
    
    
    //Fills a new variable with a brand new deck
    func fillCardDeck() -> [Card]{
        
    var undealtCard: [Card] = []
    let suits = ["♠️","♣️","♥️","♦️"]
    let ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    
        for rank in ranks {
            for suit in suits {
                undealtCard.append(Card(suit:"\(suit)", rank: "\(rank)"))
            }
        }
        return undealtCard
    }
    
    func drawcard() -> Card{
        dealtCards.insert(undealtCard[0], at: 0)
        undealtCard.remove(at: 0)
        return dealtCards[0]
    }

    
    func shuffle(dealtcard: [Card]) -> [Card]{
        var dealtCards = dealtcard
        undealtCard = []
        for card in dealtCards {
            let randomNumber:Int = Int(arc4random_uniform(UInt32(dealtCards.count)))
            let grabbedCard:Card = dealtCards[randomNumber]
            undealtCard.append(grabbedCard)
            dealtCards.remove(at: randomNumber)
        }
        return undealtCard
    }
    


    
    
}
