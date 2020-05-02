//
//  Diamond.swift
//  SetGame
//
//  Created by Christian Gabor on 5/1/20.
//  Copyright © 2020 Christian Gabor. All rights reserved.
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let top = CGPoint(
            x: center.x,
            y: center.y + rect.height / 2
        )
        let left = CGPoint(
            x: center.x - rect.width / 2,
            y: center.y
        )
        let bottom = CGPoint(
            x: center.x,
            y: center.y - rect.height / 2
        )
        let right = CGPoint(
            x: center.x + rect.width / 2,
            y: center.y
        )
        var p = Path()
        p.move(to: top)
        p.addLine(to: left)
        p.addLine(to: bottom)
        p.addLine(to: right)
        p.addLine(to: top)
        return p
    }
}
