//
//  SignUp.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 31.01.25.
//

import SwiftUI

//MARK: - Sign Up View
struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: Grid.Spacing.xl) {
                    Image.eShop3DImage
                        .frame(width: Grid.Size.medium.width,
                               height: Grid.Size.medium.height)
                    
                    InputView(text: $viewModel.signUpModel.fullName,
                              title: LocalizedStrings.SignIn.Text.fullName,
                              placeholder: LocalizedStrings.SignIn.Text.sampleFullName)
                        .onChange(of: viewModel.signUpModel.fullName) { _ in
                            viewModel.errorMessage = nil
                        }
                    
                    InputView(text: $viewModel.signUpModel.email,
                              title: LocalizedStrings.SignIn.Text.emailAddress,
                              placeholder: LocalizedStrings.SignIn.Text.sampleEmailAddress)
                        .autocapitalization(.none)
                        .onChange(of: viewModel.signUpModel.email) { _ in
                            viewModel.errorMessage = nil
                        }
                    
                    InputView(text: $viewModel.signUpModel.password,
                              title: LocalizedStrings.SignIn.Text.password,
                              placeholder: LocalizedStrings.SignIn.Text.samplePassword,
                              isSecureField: true)
                        .onChange(of: viewModel.signUpModel.password) { _ in
                            viewModel.validatePassword()
                            viewModel.updateFieldStatus()
                            viewModel.errorMessage = nil
                        }
                    
                    InputView(text: $viewModel.confirmPassword,
                              title: LocalizedStrings.SignIn.Text.confirmPassword,
                              placeholder: LocalizedStrings.SignIn.Text.sampleConfirmPassword,
                              isSecureField: true)
                        .onChange(of: viewModel.confirmPassword) { _ in
                            viewModel.validatePassword()
                            viewModel.updateFieldStatus()
                            viewModel.errorMessage = nil
                        }

                    if !viewModel.isPasswordEmpty {
                        if !viewModel.passwordMeetsRequirements {
                            Text(LocalizedStrings.SignIn.Alert.passwordMustBeAtLeastSixCharacters)
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }

                    if !viewModel.isConfirmPasswordEmpty {
                        if !viewModel.passwordsMatch {
                            Text(LocalizedStrings.SignIn.Alert.passwordsDoNotMatch)
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }

                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.top, Grid.Spacing.xs)
                    }

                    MainButton(buttonText: LocalizedStrings.SignIn.Button.signUp,
                               backgroundColor: .mediumBlue,
                               textColor: .cottonWhite)
                    .onTapGesture {
                        Task {
                            await viewModel.signUp()
                            if viewModel.errorMessage == nil {
                                coordinator.navigate(to: .mainTab)
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        coordinator.goToLastOnboardingPage()
                    }) {
                        Image.arrowLeft
                            .foregroundColor(.black)
                    }
                }
            }
            .onAppear {
                if coordinator.navigationStack.last != .signUp {
                    coordinator.navigate(to: .signUp)
                }
            }
        }
    }
}

#Preview {
    SignUpView()
}
