//
//  Onboarding.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 29.01.25.
//

import SwiftUI

struct Onboarding: View {
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.currentPage) {
            ForEach(0..<viewModel.pages.count, id: \.self) { index in
                ScreenView(
                    page: viewModel.pages[index],
                    currentPage: $viewModel.currentPage,
                    index: index,
                    totalPages: viewModel.pages.count
                )
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}


#Preview {
    Onboarding()
}
