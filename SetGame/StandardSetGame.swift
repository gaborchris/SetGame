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
    
    var cards: Array<SetModel.Card> {
        return setGame.cardsInPlay
    }
    
    // MARK: - Intents
    
    func startNewGame() {
        setGame = StandardSetGame.createSetGame()
    }
    
    func addNewCards() {
        setGame.addMoreCards()
    }
    
    func choose(card: SetModel.Card) {
        setGame.chooseCard(card: card)
    }
    
    
    
}


