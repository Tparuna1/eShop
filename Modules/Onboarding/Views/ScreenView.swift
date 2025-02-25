//
//  ScreenView.swift
//  eShop
//
//  Created by tornike <parunashvili on 30.01.25.
//

import SwiftUI

//MARK: - Onboarding Screens
struct ScreenView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    var page: OnboardingModel
    @Binding var currentPage: Int
    var totalPages: Int
    
    var body: some View {
        ZStack {
            page.image
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(page.title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.darkBlue)
                        .kerning(Grid.Kerning.thick)
                    
                    Spacer()
                    
                    SecondaryButton(title: LocalizedStrings.Onboarding.Button.skip, textColor: .darkBlue) {
                        if page.isFinalPage {
                            coordinator.navigate(to: .mainTab)
                        } else {
                            currentPage = totalPages - 1
                        }
                    }
                }
                .padding()
                .foregroundColor(.black)
                
                Spacer(minLength: .zero)
                
                if let details = page.details {
                    Text(details)
                        .font(.body)
                        .fontWeight(.regular)
                        .kerning(Grid.Kerning.regular)
                        .multilineTextAlignment(.center)
                } else {
                    VStack(spacing: Grid.Spacing.m) {
                        MainButton(buttonText: LocalizedStrings.SignIn.Button.signIn,
                                   backgroundColor: .cottonWhite,
                                   textColor: .darkBlue)
                        .onTapGesture {
                            coordinator.navigate(to: .signIn)
                        }
                        
                        MainButton(buttonText: LocalizedStrings.SignIn.Button.signUp,
                                   backgroundColor: .cottonWhite,
                                   textColor: .darkBlue)
                        .onTapGesture {
                            coordinator.navigate(to: .signUp)
                        }
                    }
                }
                
                if !page.isFinalPage {
                    MainButton(buttonText: LocalizedStrings.Onboarding.Button.next,
                               backgroundColor: .cottonWhite,
                               textColor: .darkBlue)
                    .onTapGesture {
                        currentPage += 1
                    }
                }
            }
        }
    }
}

