//
//  AppCoordinator.swift
//  eShop
//
//  Created by tornike <parunashvili on 31.01.25.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published private(set) var navigationStack: [AppScreen] = [.onboarding]
    
    /// Returns the current screen (last in the stack)
    var currentScreen: AppScreen {
        navigationStack.last ?? .onboarding
    }
    
    /// Navigates to a new screen by pushing it onto the stack
    func navigate(to screen: AppScreen) {
        navigationStack.append(screen)
    }
    
    /// Pops the last screen to navigate back
    func popScreen() {
        guard navigationStack.dropLast().last != nil else { return }
        navigationStack.removeLast()
    }
    
    /// New method to skip directly to the last onboarding page
    func goToLastOnboardingPage() {
        if navigationStack.last != .onboarding {
            navigationStack = [.onboarding]
        }
        navigationStack.append(.onboarding)
    }
}

