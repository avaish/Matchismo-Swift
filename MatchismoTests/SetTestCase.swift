//
//  SetTestCase.swift
//  Matchismo-Swift
//
//  Created by Atharv Vaish on 6/17/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

import XCTest
import Matchismo

class SetTestCase: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSetAdditions() {
        var setOne = Set<Int>()
        XCTAssert(setOne.count == 0, "Empty set not empty.")
        setOne.add(1)
        XCTAssert(setOne.count == 1, "Item addition failure.")
        setOne.add(2)
        XCTAssert(setOne.count == 2, "Item addition failure.")
        setOne.add(1)
        XCTAssert(setOne.count == 2, "Item duplicate not caught.")
        
        let setTwo = Set<Int>(items: [1, 2, 3, 2])
        XCTAssert(setTwo.count == 3, "Sequence initializer failed.")
        
        let setThree = Set<Int>(items: setOne)
        XCTAssert(setThree.count == 2, "Sequence initializer failed.")
    }
    
    func testSetContainsAndRemoves() {
        var set = Set<Int>(items: [1, 2, 3])
        XCTAssert(contains(set, 2) == true, "Should contain 2.")
        XCTAssert(contains(set, 4) == false, "Should not contain 4.")
        XCTAssert(set.count == 3, "Sequence initializer failed.")
        
        set.remove(2)
        XCTAssert(contains(set, 2) == false, "Should not contain 2.")
        XCTAssert(contains(set, 4) == false, "Should (still) not contain 4.")
        XCTAssert(set.count == 2, "Remove failed.")
    }
    
    func testSetGenerator() {
        let truthSet = Set<Int>(items: [1, 2, 3])
        var copySet = Set<Int>()
        for num in truthSet {
            copySet.add(num)
        }
        XCTAssert(contains(copySet, 1) == true, "Should contain 1.")
        XCTAssert(contains(copySet, 2) == true, "Should contain 2.")
        XCTAssert(contains(copySet, 3) == true, "Should contain 3.")
    }
    
    func testSetProperties() {
        let set = Set<Int>(items: [1, 2])
        XCTAssert(set.description == "set(1, 2)" || set.description == "set(2, 1)")
        
        println("\(set)")
    }

}
