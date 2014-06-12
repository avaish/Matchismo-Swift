//
//  Card.swift
//  Matchismo
//
//  Created by Atharv Vaish on 6/8/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

class Card {
    var contents = ""
    var chosen = false
    var matched = false
    
    var description: String {
    get {
        return self.contents
    }
    }
    
    func match(otherCards: Card[]) -> Int {
        var score = 0
        
        for card in otherCards {
            if card.contents == contents {
                score += 1
            }
        }
        
        return score
    }
}