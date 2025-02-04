//
//  Onboarding.ViewModel.swift
//  eShop
//
//  Created by tornike <parunashvili on 30.01.25.
//

import Foundation

//MARK: OnboardingViewModel
class OnboardingViewModel: ObservableObject {
    @Published var pages: [OnboardingModel] = [
        OnboardingModel(image: .onboarding1, title: LocalizedStrings.Onboarding.Text.welcomeMessage, details: LocalizedStrings.Onboarding.Text.findYourFavClothes),
        OnboardingModel(image: .onboarding2, title: LocalizedStrings.Onboarding.Text.fastSecure, details: LocalizedStrings.Onboarding.Text.enjoyWithShopping),
        OnboardingModel(image: .onboarding3, title: LocalizedStrings.Onboarding.Text.createAcount, details: nil, isFinalPage: true)
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

