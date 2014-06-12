//
//  SetCard.swift
//  Matchismo-Swift
//
//  Created by Atharv Vaish on 6/10/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

enum SetSymbol: String {
    case Diamond = "Diamond"
    case Squiggle = "Squiggle"
    case Oval = "Oval"
    
    static func validSymbols() -> SetSymbol[] {
        return [.Diamond, .Squiggle, .Oval]
    }
}

enum SetShading: String {
    case Solid = "Solid"
    case Striped = "Striped"
    case Open = "Open"
    
    static func validSymbols() -> SetShading[] {
        return [.Solid, .Striped, .Open]
    }
}

enum SetColor: String {
    case Red = "Red"
    case Green = "Green"
    case Blue = "Blue"
    
    static func validSymbols() -> SetColor[] {
        return [.Red, .Green, .Blue]
    }
}

class SetCard: Card {
    var number: Int
    var symbol: SetSymbol
    var shading: SetShading
    var color: SetColor
    
    override var contents: String {
    get {
        return "\(number) \(color.toRaw()) \(shading.toRaw()) \(symbol.toRaw())"
    }
    set { }
    }
    
    override var description: String {
    get {
        return self.contents
    }
    }
    
    init(number: Int, symbol: SetSymbol, shading: SetShading, color: SetColor) {
        self.number = number
        self.symbol = symbol
        self.shading = shading
        self.color = color
        
        super.init()
    }
    
    override func match(otherCards: Card[]) -> Int {
        let allCards = otherCards + [self]
        
        if allCards.count != 3 {
            return 0
        }
        
        var numbers = Set<Int>()
        var symbols = Set<SetSymbol>()
        var shadings = Set<SetShading>()
        var colors = Set<SetColor>()
        
        for card in allCards {
            if let setCard = card as? SetCard {
                numbers.add(setCard.number)
                symbols.add(setCard.symbol)
                shadings.add(setCard.shading)
                colors.add(setCard.color)
            } else {
                return 0
            }
        }
        
        let counts = [numbers.count, symbols.count, shadings.count, colors.count]
        if contains(counts, 2) {
            return 0
        } else {
            return 3
        }
    }
    
    class func maxNumber() -> Int {
        return 3
    }
}