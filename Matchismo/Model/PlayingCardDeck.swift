//
//  PlayingCardDeck.swift
//  Matchismo-Swift
//
//  Created by Atharv Vaish on 6/18/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

class PlayingCardDeck: Deck {
    init() {
        super.init()
        
        for suit in Suit.allSuits() {
            for rankNum in 1...Rank.maxRank {
                if let rank = Rank.fromRaw(rankNum) {
                    self.addCard(PlayingCard(rank: rank, suit: suit))
                }
            }
        }
    }
}