//
//  SignUp.ViewModel.swift
//  eShop
//
//  Created by tornike <parunashvili on 31.01.25.
//

import Foundation

// MARK: - SignUp ViewModel
class SignUpViewModel: ObservableObject {
    @Published var signUpModel = SignUpModel(fullName: "", email: "", password: "")
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String?
    @Published var passwordMeetsRequirements: Bool = true
    @Published var passwordsMatch: Bool = true
    @Published var isPasswordEmpty: Bool = true
    @Published var isConfirmPasswordEmpty: Bool = true
    
    private let authService = FirebaseAuthentification()
    
    @MainActor
    func signUp() async {
        errorMessage = nil
        
        guard !signUpModel.fullName.isEmpty, !signUpModel.email.isEmpty, !signUpModel.password.isEmpty, !confirmPassword.isEmpty else {
            self.errorMessage = LocalizedStrings.SignIn.Alert.allFieldsMustBeFilled
            return
        }
        
        guard signUpModel.password == confirmPassword else {
            self.errorMessage = LocalizedStrings.SignIn.Alert.passwordsDoNotMatch
            return
        }
        
        do {
            let user: () = try await authService.createAccount(withEmail: signUpModel.email, password: signUpModel.password, fullname: signUpModel.fullName)
            self.errorMessage = nil
        } catch let error as NSError {
            self.errorMessage = "Error creating account: \(error.localizedDescription)"
        }
    }
    
    func validatePassword() {
        passwordMeetsRequirements = signUpModel.password.count >= 6
        passwordsMatch = signUpModel.password == confirmPassword
    }
    
    func updateFieldStatus() {
        isPasswordEmpty = signUpModel.password.isEmpty
        isConfirmPasswordEmpty = confirmPassword.isEmpty
    }
}


