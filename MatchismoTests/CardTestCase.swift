//
//  CardTestCase.swift
//  Matchismo
//
//  Created by Atharv Vaish on 6/9/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

import XCTest
import Matchismo

class CardTestCase: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCardMatch() {
        var card = Card()
        var otherCard = Card()
        var thirdCard = Card()
        card.contents = "Test Card"
        otherCard.contents = "Test Card"
        thirdCard.contents = "Test Card"
        
        XCTAssert(card.match([otherCard]) == 1, "Cards did not match.")
        XCTAssert(otherCard.match([card, thirdCard]) == 2, "Cards did not match.")
    }
    
    func testCardMismatch() {
        var card = Card()
        var otherCard = Card()
        var thirdCard = Card()
        card.contents = "Test Card"
        otherCard.contents = "Test Card 2"
        thirdCard.contents = "Test Card"
        
        XCTAssert(card.match([otherCard]) == 0, "Different cards matched.")
        XCTAssert(thirdCard.match([card, otherCard]) == 1, "Partial match failed.")
    }
    
    func testCardProperties() {
        var card = Card()
        card.contents = "Test Card"
        
        XCTAssert(card.contents == "Test Card", "Contents getter error.")
        XCTAssert(card.description == "Test Card", "Description getter error.")
        
        println("Card: \(card)")
    }

}
