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

                    InputView(text: $viewModel.signInModel.email,
                              title: LocalizedStrings.SignIn.Text.emailAddress,
                              placeholder: LocalizedStrings.SignIn.Text.sampleEmailAddress)
                        .autocapitalization(.none)

                    InputView(text: $viewModel.signInModel.password,
                              title: LocalizedStrings.SignIn.Text.password,
                              placeholder: LocalizedStrings.SignIn.Text.samplePassword,
                              isSecureField: true)

                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.top, Grid.Spacing.xs)
                    }

                    MainButton(buttonText: LocalizedStrings.SignIn.Button.signIn,
                               backgroundColor: .darkBlue,
                               textColor: .cottonWhite)
                        .onTapGesture {
                            Task {
                                await viewModel.signIn()
                                if viewModel.errorMessage == nil {
                                    coordinator.navigate(to: .mainTab)
                                }
                            }
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
                        Image.arrowLeft
                            .foregroundColor(.darkBlue)
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
