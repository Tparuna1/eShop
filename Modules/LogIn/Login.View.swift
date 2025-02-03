//
//  Login.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 31.01.25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: Sizes.Spacing.xl) {
                    InputView(text: $viewModel.email,
                              title: LocalizedStrings.LogIn.Text.emaisAddress,
                              placeholder: LocalizedStrings.LogIn.Text.sampleEmaisAddress)
                    .autocapitalization(.none)
                    
                    InputView(text: $viewModel.password,
                              title: LocalizedStrings.LogIn.Text.password,
                              placeholder: LocalizedStrings.LogIn.Text.samplePassword,
                              isSecureField: true)
                    
                    MainButton(buttonText: LocalizedStrings.LogIn.Button.signIn,
                               backgroundColor: .mediumBlue,
                               textColor: .cottonWhite)
                        .onTapGesture {
                            coordinator.navigate(to: .signUp)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    LoginView()
}
