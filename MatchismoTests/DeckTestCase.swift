//
//  DeckTestCase.swift
//  Matchismo-Swift
//
//  Created by Atharv Vaish on 6/12/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

import XCTest
import Matchismo

class DeckTestCase: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDeckManipulation() {
        let cardOne = Card()
        cardOne.contents = "One"
        let cardTwo = Card()
        cardTwo.contents = "Two"
        var cards = [cardOne, cardTwo]
        
        var deck = Deck()
        deck.addCard(cardTwo)
        deck.addCard(cardOne, atTop: true)
        
        var drawnCard = deck.drawRandomCard()
        XCTAssert((drawnCard?.contents == "One") || (drawnCard?.contents == "Two"), "Draw error.")
        
        if drawnCard?.contents == "One" {
            cards = [cardTwo]
        } else {
            cards = [cardOne]
        }
        
        drawnCard = deck.drawRandomCard()
        XCTAssert(drawnCard?.contents == cards[0].contents, "Draw error.")
        
        drawnCard = deck.drawRandomCard()
        XCTAssert(drawnCard?.contents == nil, "Draw error.")
    }
    
    func testDeckProperties() {
        let cardOne = Card()
        cardOne.contents = "One"
        let cardTwo = Card()
        cardTwo.contents = "Two"
        
        var deck = Deck()
        deck.addCard(cardTwo)
        deck.addCard(cardOne, atTop: true)
        XCTAssert(deck.description == "Deck of 2 Card(s)", "Incorrect description")
        
        var drawnCard = deck.drawRandomCard()
        XCTAssert(deck.description == "Deck of 1 Card(s)", "Incorrect description")
        
        drawnCard = deck.drawRandomCard()
        XCTAssert(deck.description == "Deck of 0 Card(s)", "Incorrect description")
        
        drawnCard = deck.drawRandomCard()
        XCTAssert(deck.description == "Deck of 0 Card(s)", "Incorrect description")
        
        println("Deck: \(deck)")
    }

}
