//
//  Deck.swift
//  Matchismo-Swift
//
//  Created by Atharv Vaish on 6/12/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

import Foundation

class Deck {
    var cards = Card[]()
    
    var description: String {
    get {
        return "Deck of \(cards.count) Card(s)"
    }
    }
    
    func addCard(card: Card, atTop: Bool = false) -> () {
        if atTop {
            cards.insert(card, atIndex: 0)
        } else {
            cards.append(card)
        }
    }
    
    func drawRandomCard() -> Card? {
        if cards.count > 0 {
            let index = Int(arc4random()) % cards.count
            let returnCard = cards[index]
            cards.removeAtIndex(index)
            return returnCard
        }
        
        return nil
    }
}