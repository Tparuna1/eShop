//
//  Login.ViewModel.swift
//  eShop
//
//  Created by tornike <parunashvili on 31.01.25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    private var loginModel: LoginModel {
        return LoginModel(email: email, password: password)
    }
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            print("Email or Password cannot be empty.")
            return
        }
        print("Logging in with email: \(email) and password: \(password)")
    }
}

