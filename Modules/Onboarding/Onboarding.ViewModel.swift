//
//  Onboarding.ViewModel.swift
//  eShop
//
//  Created by tornike <parunashvili on 30.01.25.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var pages: [OnboardingPage] = [
        OnboardingPage(image: .onboarding1, title: LocalizedStrings.Onboarding.Text.welcomeMessage, details: LocalizedStrings.Onboarding.Text.findYourFavClothes),
        OnboardingPage(image: .onboarding2, title: LocalizedStrings.Onboarding.Text.fastSecure, details: LocalizedStrings.Onboarding.Text.enjoyWithShopping),
        OnboardingPage(image: .onboarding3, title: LocalizedStrings.Onboarding.Text.createAcount, details: nil, isFinalPage: true)
    ]
    
    @Published var currentPage = 0
    
    private func goToNextPage() {
        if currentPage < pages.count - 1 {
            currentPage += 1
        } else {
            print("Onboarding finished")
        }
    }
    
    private func skipOnboarding() {
        currentPage = pages.count - 1
    }
}

