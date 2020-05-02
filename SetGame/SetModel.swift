//
//  SetModel.swift
//  SetGame
//
//  Created by Christian Gabor on 5/1/20.
//  Copyright © 2020 Christian Gabor. All rights reserved.
//

import Foundation

struct SetModel {
    private(set) var cards: Array<Card>
    private(set) var cardsInPlay: Array<Card>
    private(set) var topCardOfDeckIndex: Int
    
    struct Card: Identifiable {
        var isSelected: Bool = true
        var isSet: Bool = false
        var color: Int
        var shape: Int
        var shading: Int
        var count: Int
        var id: Int
    }
    
    init() {
        cards = Array<Card>()
        cardsInPlay = Array<Card>()
        var id = 0
        for color in 0..<3  {
            for shading in 0..<3 {
                for shape in 0..<3 {
                    for i in 1...3 {
                        cards.append(
                            Card(color: color,
                                 shape: shape,
                                 shading: shading,
                                 count: i,
                                 id: id))
                        id+=1
                    }
                }
            }
        }
        cards.shuffle()
        for i in 0..<12 {
            cardsInPlay.append(cards[i])
        }
        
        topCardOfDeckIndex = 12
    }
    
    mutating func chooseCard(cardId: Int) {
        if let chosenIndex = cardsInPlay.firstIndex(matchingId: cardId) {
            cardsInPlay[chosenIndex].isSelected = !cardsInPlay[chosenIndex].isSelected
        }
        
        
    }
    
    mutating func addMoreCards() {
        for _ in 0..<3 {
            if topCardOfDeckIndex < 81 {
                cardsInPlay.append(cards[topCardOfDeckIndex])
            }
            topCardOfDeckIndex+=1
        }
    }
    
}

extension Array where Element == SetModel.Card {
    
    func firstIndex(matchingId: Int) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matchingId {
                return index
            }
        }
        return nil
    }
}


