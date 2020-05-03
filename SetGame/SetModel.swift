//
//  SetModel.swift
//  SetGame
//
//  Created by Christian Gabor on 5/1/20.
//  Copyright © 2020 Christian Gabor. All rights reserved.
//

import Foundation

struct SetModel {
    private var cards: Array<Card>
    private(set) var cardsInPlay: Array<Card>
    private var topCardOfDeckIndex: Int
    
    // Keeps a queue of cards that were chosen by the user
    private var chosenCards: Array<Card>
    
    // Holds a selection of a set of cards, either correctly or incorreclty matched
    private var setOfCards: Array<Card>
    private var isMatchedSet: Bool = false
    private var setFormed: Bool {
        get {
            return setOfCards.count > 0 ? true : false
        }
        set {
            if newValue == true {
                isMatchedSet = cardsFormSet(setOfCards)
                for card in setOfCards {
                    if let chosenIndex = cardsInPlay.firstIndex(matching: card) {
                        cardsInPlay[chosenIndex].isMatched = isMatchedSet ? true : false
                        cardsInPlay[chosenIndex].isMisMatched = isMatchedSet ? false : true
                        cardsInPlay[chosenIndex].isSelected = false
                    }
                }
            } else {
                cardsInPlay.removeAll(where: {$0.isMatched})
                for card in setOfCards {
                    if let chosenIndex = cardsInPlay.firstIndex(matching: card) {
                        cardsInPlay[chosenIndex].isMisMatched = false
                    }
                }
                setOfCards = []
            }
        }
    }
    
    private var numberOfChosenCards: Int
    {
        get {
            return chosenCards.count
        }
        set {
            if newValue == 3 {
                for card in chosenCards {
                    setOfCards.append(card)
                }
                setFormed = true
                chosenCards = []
            } else {
                setFormed = false
            }
        }
    }
    
    mutating func removeMisMatchedCards() {
        for card in cardsInPlay {
            if card.isMisMatched {
                let indexOfMisMatched = cardsInPlay.firstIndex(matching: card)!
                cardsInPlay[indexOfMisMatched].isMisMatched = false
                cardsInPlay[indexOfMisMatched].isSelected = false
            }
        }
    }
    
    
    struct Card: Identifiable {
        var isSelected: Bool = false
        var isMatched: Bool = false
        var isMisMatched: Bool = false
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
        // Comment out line below for easy debugging 😉
        // cards.shuffle()
        for i in 0..<12 {
            cardsInPlay.append(cards[i])
        }
        
        topCardOfDeckIndex = 12
        chosenCards = []
        setOfCards = []
    }
    
    func cardsFormSet(_ cards: [SetModel.Card]) -> Bool {
        return cardsFormSet(byFields: cards.map{$0.color}) &&
            cardsFormSet(byFields: cards.map{$0.shape}) &&
            cardsFormSet(byFields: cards.map{$0.shading}) &&
            cardsFormSet(byFields: cards.map{$0.count})
    }
    
    func cardsFormSet(byFields fields: [Int]) -> Bool {
        let same = fields.allSatisfy({ $0 == fields.first})
        let unique = Set(fields).count == 3
        return same || unique
    }

    
    mutating func chooseCard(card: SetModel.Card) {

        if let chosenIndex = cardsInPlay.firstIndex(matching: card) {
            if !cardsInPlay[chosenIndex].isMatched {
                // Toggle the card selection and card in the match queue
                if chosenCards.firstIndex(matching: card) == nil {
                    chosenCards.append(cardsInPlay[chosenIndex])
                    
                    cardsInPlay[chosenIndex].isSelected = true
                    
                } else {
                    chosenCards.remove(at: chosenCards.firstIndex(matching: card)!)
                    cardsInPlay[chosenIndex].isSelected = false
                }
                // Update the count in the match queue
                numberOfChosenCards = chosenCards.count
            }

            // Keep 12 cards in play
            if cardsInPlay.count < 12 {
                addMoreCards()
            }
        }
    }

    mutating func addMoreCards() {
        
        // Only deselect cards if match found (as what docs say?)
        if isMatchedSet {
            setFormed = false
        }
        
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





