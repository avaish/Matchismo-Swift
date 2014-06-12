//
//  Set.swift
//  Matchismo-Swift
//
//  Created by Atharv Vaish on 6/12/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

class Set<T: Hashable> {
    var underlyingDict = Dictionary<T, Bool>()
    
    var count: Int {
    get {
        return underlyingDict.count
    }
    }
    
    func add(k: T) -> () {
        underlyingDict[k] = true;
    }
    
    func contains(k: T) -> Bool {
        return underlyingDict[k] == nil
    }
    
    func remove(k: T) -> () {
        underlyingDict[k] = nil
    }
}