//
//  SignIn.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 31.01.25.
//

import SwiftUI

//MARK: - Sign In View
struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    @EnvironmentObject private var coordinator: AppCoordinator

    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: Grid.Spacing.xl) {
                    Image.eShop3DImage
                        .frame(width: Grid.Size.medium.width, height: Grid.Size.medium.height)
                    
                    Spacer()

                    InputView(text: $viewModel.email,
                              title: LocalizedStrings.SignIn.Text.emailAddress,
                              placeholder: LocalizedStrings.SignIn.Text.sampleEmailAddress)
                        .autocapitalization(.none)

                    InputView(text: $viewModel.password,
                              title: LocalizedStrings.SignIn.Text.password,
                              placeholder: LocalizedStrings.SignIn.Text.samplePassword,
                              isSecureField: true)

                    MainButton(buttonText: LocalizedStrings.SignIn.Button.signIn,
                               backgroundColor: .mediumBlue,
                               textColor: .cottonWhite)
                        .onTapGesture {
                            viewModel.login()
                            coordinator.navigate(to: .profile)
                        }
                    Spacer()

                    SecondaryButton(title: LocalizedStrings.SignIn.Button.doNotHaveAnAccountSignUp,
                                    textColor: .mediumBlue) {
                        coordinator.navigate(to: .signUp)
                    }
                }
                .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        coordinator.goToLastOnboardingPage()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                    }
                }
            }
            .onAppear {
                if coordinator.navigationStack.last != .signIn {
                    coordinator.navigate(to: .signIn)
                }
            }
        }
    }
}

#Preview {
    SignInView()
}
