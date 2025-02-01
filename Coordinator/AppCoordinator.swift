//
//  AppCoordinator.swift
//  eShop
//
//  Created by tornike <parunashvili on 31.01.25.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var currentScreen: AppScreen = .onboarding
    
    func navigate(to screen: AppScreen) {
        currentScreen = screen
    }
}
