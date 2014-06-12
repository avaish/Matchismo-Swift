//
//  SetCardTestCase.swift
//  Matchismo-Swift
//
//  Created by Atharv Vaish on 6/12/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

import XCTest
import Matchismo

class SetCardTestCase: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSetCardMatch() {
        var cards = [SetCard(number: 1, symbol: .Diamond, shading: .Solid, color: .Red),
                     SetCard(number: 1, symbol: .Diamond, shading: .Solid, color: .Green),
                     SetCard(number: 1, symbol: .Diamond, shading: .Solid, color: .Blue),
                     SetCard(number: 2, symbol: .Squiggle, shading: .Solid, color: .Red),
                     SetCard(number: 3, symbol: .Oval, shading: .Solid, color: .Red),
                     SetCard(number: 2, symbol: .Diamond, shading: .Striped, color: .Green),
                     SetCard(number: 3, symbol: .Diamond, shading: .Open, color: .Blue),
                     SetCard(number: 2, symbol: .Squiggle, shading: .Striped, color: .Green),
                     SetCard(number: 3, symbol: .Oval, shading: .Open, color: .Blue)]
        
        XCTAssert(cards[0].match([cards[1], cards[2]]) == 3, "Should match.")
        XCTAssert(cards[0].match([cards[3], cards[4]]) == 3, "Should match.")
        XCTAssert(cards[0].match([cards[5], cards[6]]) == 3, "Should match.")
        XCTAssert(cards[0].match([cards[7], cards[8]]) == 3, "Should match.")
        
        XCTAssert(cards[0].match([cards[1], cards[5]]) == 0, "Shouldn't match.")
        XCTAssert(cards[0].match([cards[2], cards[6]]) == 0, "Shouldn't match.")
        XCTAssert(cards[0].match([cards[3], cards[7]]) == 0, "Shouldn't match.")
        XCTAssert(cards[0].match([cards[4], cards[8]]) == 0, "Shouldn't match.")
    }
    
    func testSetCardProperties() {
        var card = SetCard(number: 1, symbol: .Diamond, shading: .Solid, color: .Red)
        
        XCTAssert(card.contents == "1 Red Solid Diamond", "Contents not overriden.")
        XCTAssert(card.description == "1 Red Solid Diamond", "Description not overriden.")
    }

}
