//
//  SecondaryButton.swift
//  eShop
//
//  Created by tornike <parunashvili on 03.02.25.
//

import SwiftUI

//MARK: - Secondary button as textButton
struct SecondaryButton: View {
    var title: String
    var textColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .kerning(Grid.Kerning.regular)
                .foregroundColor(textColor)
        }
    }
}

#Preview {
    SecondaryButton(title: "Skip", textColor: .mediumBlue, action: {})
}
