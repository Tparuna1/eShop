//
//  Onboarding.ViewModel.swift
//  eShop
//
//  Created by tornike <parunashvili on 30.01.25.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var pages: [OnboardingPage] = [
        OnboardingPage(image: .onboarding1, title: LocalizedStrings.Onboarding.welcomeMessage, details: LocalizedStrings.Onboarding.findYourFavClothes),
        OnboardingPage(image: .onboarding2, title: LocalizedStrings.Onboarding.fastSecure, details: LocalizedStrings.Onboarding.enjoyWithShopping),
        OnboardingPage(image: .onboarding3, title: LocalizedStrings.Onboarding.createAcount, details: nil, isFinalPage: true)
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

