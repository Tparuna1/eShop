//
//  MainButton.swift
//  eShop
//
//  Created by tornike <parunashvili on 30.01.25.
//

import SwiftUI

struct MainButton: View {
    var buttonText: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(buttonText)
            .fontWeight(.semibold)
            .kerning(Sizes.Kerning.regular)
            .frame(minWidth: .zero, maxWidth: .infinity)
            .padding()
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(Sizes.Spacing.s)
            .padding(.horizontal, Sizes.Spacing.m)
    }
}
