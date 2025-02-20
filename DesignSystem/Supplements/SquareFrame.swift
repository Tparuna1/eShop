//
//  SquareFrame.swift
//  eShop
//
//  Created by tornike <parunashvili on 03.02.25.
//

import SwiftUI

public extension CGSize {
    /// Custom initializer for square frames
    init(squareFrame side: CGFloat) {
        self.init(width: side, height: side)
    }
}

