//
//  StandardSymbols.swift
//  SetGame
//
//  Created by Christian Gabor on 5/1/20.
//  Copyright © 2020 Christian Gabor. All rights reserved.
//

import SwiftUI

struct StandardSymbols {
    enum Shapes: Int {
        case rect, oval, diamond
    }
    enum Shadings: Int {
        case stripe, solid, clear
    }
    enum Colors: Int {
        case red, green, purple
    }
}

struct StandardSymbol: View {
    var shape: StandardSymbols.Shapes
    var color: StandardSymbols.Colors
    var shading: StandardSymbols.Shadings
    var count: Int
    
    var body: some View {
        var fillColor: Color
        var opacity: Float
        
        
        switch color {
        case .red:
            fillColor = Color.red
        case .green:
            fillColor = Color.green
        case .purple:
            fillColor = Color.purple
        }
        
        switch shading {
        case .clear:
            opacity = 0
        case .solid:
            opacity = 1
        case .stripe:
            opacity = 0.25
        }
        
        let symbols = VStack {
            ForEach(0..<count) { _ in
                self.symbol(shape: self.shape, color: fillColor, opacity: opacity)
                    .aspectRatio(2, contentMode: .fit)
            }
        }
        return symbols
                

    }

    func symbol(shape: StandardSymbols.Shapes, color: Color, opacity: Float) -> some View {
        switch shape {
        case .rect:
            return AnyView(
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(color).opacity(Double(opacity))
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(lineWidth: 3).foregroundColor(color)
                })

        case .oval:
            return AnyView(
                ZStack {
                Capsule(style: .circular)
                    .fill(color).opacity(Double(opacity))
                Capsule(style: .circular)
                    .stroke(lineWidth: 3).foregroundColor(color)
                }
            )
        case .diamond:
            return AnyView(
                ZStack {
                Diamond()
                    .fill(color).opacity(Double(opacity))
                Diamond()
                    .stroke(lineWidth: 3).foregroundColor(color)
                }
            )
        }
    }
}






