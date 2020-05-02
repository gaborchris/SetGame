//
//  Array+Only.swift
//  SetGame
//
//  Created by Christian Gabor on 5/1/20.
//  Copyright © 2020 Christian Gabor. All rights reserved.
//


import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
