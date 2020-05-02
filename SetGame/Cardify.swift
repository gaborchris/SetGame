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
    func body(content: Content) -> some View {
        ZStack {
            Group {
                if isSelected {
                    RoundedRectangle(cornerRadius: 10).fill(Color.green).opacity(0.2)
                } else {
                    RoundedRectangle(cornerRadius: 10).fill(Color.white)
                }
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                content
            }
        }.aspectRatio(2/3, contentMode: .fit)
    }
}

extension View {
    func cardify(isSelected: Bool) -> some View {
        self.modifier(Cardify(isSelected: isSelected))
    }
}

struct Cardify_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
