//
//  Set.swift
//  Matchismo-Swift
//
//  Created by Atharv Vaish on 6/12/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

// TODO: Move to external module
// This class might be replaced by a built-in type in the future.
struct Set<ItemType: Hashable>: Sequence, Printable {
    var underlyingDict = Dictionary<ItemType, Bool>()
    
    var count: Int {
    get {
        return underlyingDict.count
    }
    }
    
    var description: String {
    get {
        var first = true
        var desc = "set("
        
        for item in self {
            if first {
                desc += "\(item)"
                first = false
            } else {
                desc += ", \(item)"
            }
        }
        desc += ")"
        
        return desc
    }
    }
    
    init() { }
    
    // TODO: Update with generics when Xcode stops crashing
    init<S: Sequence /* where S.GeneratorType.Element == ItemType */>(items: S) {
        for item in items {
            if item is ItemType {
                add(item as ItemType)
            }
        }
    }
    
    mutating func add(k: ItemType) -> () {
        underlyingDict[k] = true;
    }
    
    mutating func remove(k: ItemType) -> () {
        underlyingDict[k] = nil
    }
    
    func generate() -> SetGeneratorType<ItemType> {
        let dictGenerator = self.underlyingDict.generate()
        return SetGeneratorType<ItemType>(dictGenerator: dictGenerator)
    }
}

struct SetGeneratorType<ItemType: Hashable>: Generator {
    var underlyingDictGenerator: DictionaryGenerator<ItemType, Bool>
    
    init(dictGenerator: DictionaryGenerator<ItemType, Bool>) {
        self.underlyingDictGenerator = dictGenerator
    }
    
    mutating func next() -> ItemType? {
        let nextDictElement = underlyingDictGenerator.next()
        if let (item, _) = nextDictElement {
            return item
        } else {
            return nil
        }
    }
}