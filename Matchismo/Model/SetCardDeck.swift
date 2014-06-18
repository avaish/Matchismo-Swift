//
//  SetCardDeck.swift
//  Matchismo-Swift
//
//  Created by Atharv Vaish on 6/18/14.
//  Copyright (c) 2014 Atharv Vaish. All rights reserved.
//

class SetCardDeck: Deck {
    init() {
        super.init()
        
        for symbol in SetSymbol.validSymbols() {
            for shading in SetShading.validShadings() {
                for color in SetColor.validColors() {
                    for number in 1...SetCard.maxNumber() {
                        self.addCard(SetCard(number: number,
                                             symbol: symbol,
                                            shading: shading,
                                              color: color))
                    }
                }
            }
        }
    }
}