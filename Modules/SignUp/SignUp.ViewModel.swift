//
//  SignUp.ViewModel.swift
//  eShop
//
//  Created by tornike <parunashvili on 31.01.25.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    private var signUpModel: SignUpModel {
        return SignUpModel(fullName: fullName, email: email, password: password)
    }
    
    func signUp() {
        guard !fullName.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            print("All fields must be filled.")
            return
        }
        
        guard password == confirmPassword else {
            print("Passwords do not match.")
            return
        }
        
        print("Signing up with name: \(fullName), email: \(email)")
    }
}
