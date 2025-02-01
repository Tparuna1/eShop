//
//  Onboarding.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 29.01.25.
//

import SwiftUI

struct Onboarding: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @StateObject private var viewModel = OnboardingViewModel()

    var body: some View {
        TabView(selection: $viewModel.currentPage) {
            ForEach(0..<viewModel.pages.count, id: \.self) { index in
                ScreenView(
                    page: viewModel.pages[index],
                    currentPage: $viewModel.currentPage,
                    totalPages: viewModel.pages.count
                )
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}


#Preview {
    Onboarding()
}
