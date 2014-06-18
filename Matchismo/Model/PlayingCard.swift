//
//  PlayingCard.swift
//  Matchismo
//
//  Created by Atharv Vaish on 6/8/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

enum Suit: String, Printable {
    case Diamonds = "♦️"
    case Hearts = "♥️"
    case Spades = "♠️"
    case Clubs = "♣️"
    
    var description: String {
    get {
        return self.toRaw()
    }
    }
    
    static func allSuits() -> Suit[] {
        return [.Diamonds, .Hearts, .Spades, .Clubs]
    }
}

enum Rank: Int, Printable {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    var description: String {
    get {
        switch self {
        case .Ace:
            return "A"
        case .Jack:
            return "J"
        case .Queen:
            return "Q"
        case .King:
            return "K"
        default:
            return String(toRaw())
        }
    }
    }
    
    static var maxRank = 13
}

class PlayingCard: Card {
    var suit: Suit
    var rank: Rank
    
    override var contents: String {
    get {
        return "\(rank)\(suit)"
    }
    set { }
    }
    
    // TODO: remove upon bugfix
    override var description: String {
    get {
        return self.contents
    }
    }
    
    init(rank: Rank, suit: Suit) {
        self.suit = suit
        self.rank = rank
        
        super.init()
    }
    
    override func match(otherCards: Card[]) -> Int {
        let allCards = otherCards + [self]
        let testMatches = {
            () -> (Card, Card[])[] in
            
            var result: (Card, Card[])[] = []
            
            for i in 0..allCards.count {
                result += (allCards[i], Array(allCards[0..i] + allCards[(i + 1)..allCards.count]))
            }
            
            return result
            
        }()
        
        let scores = testMatches.map({
            (card, otherCards) -> Int in
            if let playingCard = card as? PlayingCard {
                var rankValue = 1.0
                var suitValue = 1.0
                
                for matchCard in otherCards {
                    if let matchPlayingCard = matchCard as? PlayingCard {
                        if (matchPlayingCard.rank == playingCard.rank) {
                            rankValue *= 8;
                        } else {
                            rankValue /= 2;
                        }
                        
                        if (matchPlayingCard.suit == playingCard.suit) {
                            suitValue *= 2;
                        } else {
                            suitValue /= 2;
                        }
                    }
                }
                
                if rankValue >= 1.0 {
                    return Int(rankValue)
                } else if suitValue >= 1.0 {
                    return Int(suitValue)
                } else {
                    return 0
                }
            } else {
                return 0
            }
        })
        
        return scores.reduce(Int.min, combine: { max($0, $1) });
    }
}