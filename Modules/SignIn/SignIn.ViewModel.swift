//
//  SignIn.ViewModel.swift
//  eShop
//
//  Created by tornike <parunashvili on 31.01.25.
//

import Foundation

// MARK: - SignIn ViewModel
class SignInViewModel: ObservableObject {
    @Published var signInModel = SignInModel(email: "", password: "")
    @Published var errorMessage: String?
    
    private let authService = FirebaseAuthentification()
    
    @MainActor
    func signIn() async {
        guard !signInModel.email.isEmpty, !signInModel.password.isEmpty else {
            errorMessage = LocalizedStrings.SignIn.Alert.emailOrPasswordCannotBeEmpty
            return
        }
        
        do {
            try await authService.signIn(withEmail: signInModel.email, password: signInModel.password)
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

