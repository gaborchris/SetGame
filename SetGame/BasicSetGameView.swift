//
//  BasicSetGameView.swift
//  SetGame
//
//  Created by Christian Gabor on 4/29/20.
//  Copyright © 2020 Christian Gabor. All rights reserved.
//

// TODO:
// Set: 3^4 cards = 81
// compare code to proj2 for reference
// Create model for Set Game
// create basic card view with cardify
// Create simple view for grid of cards
// Verify logic works
// work on view of game
// Add extra credit

import SwiftUI

struct StandardSetGameView: View {
    @ObservedObject var viewModel: StandardSetGame
    
    var body: some View {
        VStack {
            NewGameButton(viewModel: viewModel)
            Grid(viewModel.cards) { card in
                withAnimation(.linear) {
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.2)) {
                        self.viewModel.choose(card: card)
                    }
                }
                    .padding(5)
                }
            }
            .padding()
            MoreCardsButton(viewModel: viewModel)
            .padding(5)
            
        }
    }
    
    struct NewGameButton: View {
        var viewModel: StandardSetGame
        
        var body: some View {
            Button(action: {
                print("New Game")
                self.viewModel.startNewGame()
                }, label: {
                Text("New Game")
                    .foregroundColor(Color.primary)
                    .padding(5)
                    .background(Color.clear)
                    .font(.title)
                    .border(Color.primary, width: 2).opacity(0.6)
                }
            )
        }
    }
    
    struct MoreCardsButton: View {
        var viewModel: StandardSetGame
        
        var body: some View {
            Button(action: {
                self.viewModel.addNewCards()
                }, label: {
                Text("More Cards")
                    .foregroundColor(Color.primary)
                    .padding(5)
                    .background(Color.clear)
                    .font(.body)
                    .border(Color.primary, width: 2).opacity(0.6)
                }
            )
        }
    }
}

struct CardView: View {
    var card: SetModel.Card
    
    var body: some View {
        card.symbols.padding().cardify(isSelected: card.isSelected, isMatched: card.isMatched, isMisMatched: card.isMisMatched)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StandardSetGameView(viewModel: StandardSetGame())
    }
}
