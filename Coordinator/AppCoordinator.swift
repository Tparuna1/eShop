//
//  AppCoordinator.swift
//  eShop
//
//  Created by tornike <parunashvili on 31.01.25.
//

import SwiftUI

/// `AppCoordinator` is responsible for managing navigation across the app.
/// It holds the current screen and updates it when navigation occurs.
class AppCoordinator: ObservableObject {
    
    /// The currently active screen in the app.
    /// Using `@Published` ensures that SwiftUI views listening to this property will update when it changes.
    @Published var currentScreen: AppScreen = .onboarding
    
    /// Updates `currentScreen` to navigate to a different screen.
    /// - Parameter screen: The new screen to navigate to.
    func navigate(to screen: AppScreen) {
        currentScreen = screen
    }
}
