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
    
    struct DefaultSets {
        var shapes: [String] = ["Rectangle", "Oval", "Diamond"]
        var shadings: [String] = ["stripe", "solid", "clear"]
        var colors: [String] = ["green", "red", "purple"]
    }
    
    // MARK: - Access the model
    
    var cards: Array<SetModel.Card> {
        return setGame.cardsInPlay
    }
}


