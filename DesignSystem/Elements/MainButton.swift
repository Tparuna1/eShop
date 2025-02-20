//
//  MainButton.swift
//  eShop
//
//  Created by tornike <parunashvili on 30.01.25.
//

import SwiftUI

//MARK: - Main button
struct MainButton: View {
    var buttonText: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(buttonText)
            .fontWeight(.semibold)
            .kerning(Grid.Kerning.regular)
            .frame(minWidth: .zero, maxWidth: .infinity)
            .padding()
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(Grid.Spacing.s)
            .padding(.horizontal, Grid.Spacing.m)
    }
}
