//
//  eShopApp.swift
//  eShop
//
//  Created by tornike <parunashvili on 24.01.25.
//

import SwiftUI
import Firebase

@main
struct eShopApp: App {
    @StateObject private var coordinator = AppCoordinator()
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(coordinator)
        }
    }
}

struct RootView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var cartViewModel = CartViewModel()

    var body: some View {
        switch coordinator.currentScreen {
        case .onboarding:
            Onboarding()
        case .signUp:
            SignUpView()
        case .signIn:
            SignInView()
        case .mainTab:
            MainTabView()
                .environmentObject(homeViewModel)
                .environmentObject(cartViewModel)
        case .favProducts:
            FavProductsView()
        }
    }
}
