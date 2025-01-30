//
//  Sizes.swift
//  eShop
//
//  Created by tornike <parunashvili on 30.01.25.
//

import Foundation

public enum Sizes {
    public enum Spacing {
        public static let xs4: CGFloat = 1.0
        public static let xs3: CGFloat = 2.0
        public static let xs2: CGFloat = 4.0
        public static let xs: CGFloat = 8.0
        public static let s: CGFloat = 12.0
        public static let m: CGFloat = 16.0
        public static let l: CGFloat = 20.0
        public static let xl: CGFloat = 24.0
        public static let xl2: CGFloat = 28.0
        public static let xl3: CGFloat = 32.0
        public static let xl4: CGFloat = 40.0
        public static let xl5: CGFloat = 48.0
    }

    public enum BorderWidth {
        public static let thin: CGFloat = 0.5
        public static let regular: CGFloat = 1.0
        public static let thick: CGFloat = 2.0
    }
    
    public enum Kerning {
        public static let thin: CGFloat = 1
        public static let regular: CGFloat = 1.2
        public static let thick: CGFloat = 1.4
    }

    public enum CornerRadius {
        public static let textField: CGFloat = 10.0
        public static let button: CGFloat = 24.0
    }
}
