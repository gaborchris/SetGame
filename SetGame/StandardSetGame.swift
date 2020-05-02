//
//  BasicSetGame.swift
//  SetGame
//
//  Created by Christian Gabor on 5/1/20.
//  Copyright © 2020 Christian Gabor. All rights reserved.
//

import SwiftUI

class StandardSetGame: ObservableObject {
    @Published private var setGame = StandardSetGame.createSetGame()


    private static func createSetGame() -> SetModel {
        return SetModel()
    }
    

    
    // MARK: - Access the model
    
    var cards: Array<SymbolCard> {
        return setGame.cardsInPlay.map {card in

            let shape = StandardSymbols.Shapes(rawValue: card.shape)
            let color = StandardSymbols.Colors(rawValue: card.color)
            let shading = StandardSymbols.Shadings(rawValue: card.shading)
            let symbols = StandardSymbol(shape: shape!,
                                          color: color!,
                                          shading: shading!,
                                          count: card.count)
            
            return SymbolCard(symbols: symbols, id: card.id, isSelected: card.isSelected)
            
        }
    }
    
    struct SymbolCard: Identifiable {
        var symbols: StandardSymbol
        var id: Int
        var isSelected: Bool
    }
    
    // MARK: - Intents
    
    func startNewGame() {
        setGame = StandardSetGame.createSetGame()
    }
    
    func addNewCards() {
        setGame.addMoreCards()
    }
    
    func choose(card: SymbolCard) {
        setGame.chooseCard(cardId: card.id)
    }
    
    
    
}


