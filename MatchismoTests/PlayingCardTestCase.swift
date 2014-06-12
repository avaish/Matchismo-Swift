//
//  PlayingCardTestCase.swift
//  Matchismo-Swift
//
//  Created by Atharv Vaish on 6/10/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

import XCTest
import Matchismo

class PlayingCardTestCase: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPlayingCardMatch() {
        var cards = [PlayingCard(rank: .Ace, suit: .Spades),
                     PlayingCard(rank: .Two, suit: .Hearts),
                     PlayingCard(rank: .Three, suit: .Diamonds),
                     PlayingCard(rank: .Four, suit: .Spades),
                     PlayingCard(rank: .Five, suit: .Spades),
                     PlayingCard(rank: .Ace, suit: .Hearts),
                     PlayingCard(rank: .Ace, suit: .Diamonds)]
        
        XCTAssert(cards[0].match([cards[1], cards[2]]) == 0, "Score should be 0.")
        XCTAssert(cards[0].match([cards[3], cards[2]]) == 1, "Score should be 1.")
        XCTAssert(cards[0].match([cards[3], cards[4]]) == 4, "Score should be 4.")
        XCTAssert(cards[0].match([cards[5], cards[2]]) == 4, "Score should be 4.")
        XCTAssert(cards[0].match([cards[5], cards[6]]) == 64, "Score should be 64.")
        XCTAssert(cards[0].match([cards[3], cards[5]]) == 4, "Score should be 4.")
    }
    
    func testPlayingCardProperties() {
        var card = PlayingCard(rank: .Ace, suit: .Spades)
        
        XCTAssert(card.contents == "A♠️", "Contents not overriden.")
        XCTAssert(card.description == "A♠️", "Description not overriden.")
    }
}
