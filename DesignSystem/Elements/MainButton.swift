//
//  MainButton.swift
//  eShop
//
//  Created by tornike <parunashvili on 30.01.25.
//

import SwiftUI

struct MainButton: View {
    var buttonText: String

    var body: some View {
        Text(buttonText)
            .fontWeight(.semibold)
            .kerning(Sizes.Kerning.regular)
            .frame(minWidth: .zero, maxWidth: .infinity)
            .padding()
            .foregroundColor(.babyBlue)
            .background(Color.cottonWhite)
            .cornerRadius(Sizes.Spacing.xl4)
            .padding(.horizontal, Sizes.Spacing.m)
    }
}
