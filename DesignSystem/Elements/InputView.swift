//
//  InputView.swift
//  eShop
//
//  Created by tornike <parunashvili on 03.02.25.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: Grid.Spacing.s) {
            Text(title)
                .foregroundColor(.secondary)
                .font(.footnote)
                .fontWeight(.semibold)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: Grid.Spacing.s)
                    .fill(Color(.systemGray6))
                    .overlay(
                        RoundedRectangle(cornerRadius: Grid.Spacing.s)
                            .stroke(isFocused ? Color.blue : Color.clear, lineWidth: Grid.BorderWidth.regular)
                    )
                
                if isSecureField {
                    SecureField(placeholder, text: $text)
                        .focused($isFocused)
                        .padding(Grid.Spacing.s)
                        .font(.system(size: Grid.Spacing.m))
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                } else {
                    TextField(placeholder, text: $text)
                        .focused($isFocused)
                        .padding(Grid.Spacing.s)
                        .font(.system(size: Grid.Spacing.m))
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
            }
            .frame(height: Grid.Spacing.xl5)
        }
        .padding(.horizontal)
        .animation(.easeInOut(duration: 0.2), value: isFocused)
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "example@gmail.com")
}
