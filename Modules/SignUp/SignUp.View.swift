//
//  SignUp.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 31.01.25.
//

import SwiftUI

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
                    
                    InputView(text: $viewModel.fullName,
                              title: LocalizedStrings.SignIn.Text.fullName,
                              placeholder: LocalizedStrings.SignIn.Text.sampleFullName)
                    
                    InputView(text: $viewModel.email,
                              title: LocalizedStrings.SignIn.Text.emailAddress,
                              placeholder: LocalizedStrings.SignIn.Text.sampleEmailAddress)
                    .autocapitalization(.none)
                    
                    InputView(text: $viewModel.password,
                              title: LocalizedStrings.SignIn.Text.password,
                              placeholder: LocalizedStrings.SignIn.Text.samplePassword,
                              isSecureField: true)
                    
                    InputView(text: $viewModel.confirmPassword,
                              title: LocalizedStrings.SignIn.Text.confirmPassword,
                              placeholder: LocalizedStrings.SignIn.Text.sampleConfirmPassword,
                              isSecureField: true)
                    
                    MainButton(buttonText: LocalizedStrings.SignIn.Button.signUp,
                               backgroundColor: .mediumBlue,
                               textColor: .cottonWhite)
                    .onTapGesture {
                        viewModel.signUp()
                        coordinator.navigate(to: .profile)
                    }
                    Spacer()
                }
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
