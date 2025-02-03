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
    
    func login() {
        // Handle login logic here
    }
}
