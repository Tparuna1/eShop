//
//  MainTabView.swift
//  eShop
//
//  Created by tornike <parunashvili on 20.02.25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(Tab.home)
                ShopView()
                    .tag(Tab.shop)
                CartView()
                    .tag(Tab.cart)
                ProfileView()
                    .tag(Tab.profile)
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

// MARK: - Tab Enum
enum Tab: CaseIterable {
    case home, shop, cart, profile
    
    var icon: String {
        switch self {
        case .home: return Image.houseFill
        case .shop: return Image.bagFill
        case .cart: return Image.cartFill
        case .profile: return Image.personFill
        }
    }
}


#Preview {
    MainTabView()
}
