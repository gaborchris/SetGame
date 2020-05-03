//
//  Cardify.swift
//  SetGame
//
//  Created by Christian Gabor on 5/1/20.
//  Copyright © 2020 Christian Gabor. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var isSelected: Bool
    var isMatched: Bool
    var isMisMatched: Bool
    func body(content: Content) -> some View {
        ZStack {
            Group {
                if isMatched {
                    RoundedRectangle(cornerRadius: 10).fill(Color.green).opacity(0.6)
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3).foregroundColor(Color.green)
                } else if isMisMatched {
                    RoundedRectangle(cornerRadius: 10).fill(Color.red).opacity(0.6)
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3).foregroundColor(Color.red)
                } else if isSelected{
                    RoundedRectangle(cornerRadius: 10).fill(Color.yellow).opacity(0.15)
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 5).foregroundColor(Color.yellow)
                }
                 else {
                    RoundedRectangle(cornerRadius: 10).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                }

                content
            }
        }.aspectRatio(2/3, contentMode: .fit)
    }
}

extension View {
    func cardify(isSelected: Bool, isMatched: Bool, isMisMatched: Bool) -> some View {
        self.modifier(Cardify(isSelected: isSelected, isMatched: isMatched, isMisMatched: isMisMatched))
    }
}

struct Cardify_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
