//
//  ScreenView.swift
//  eShop
//
//  Created by tornike <parunashvili on 30.01.25.
//

import SwiftUI

struct ScreenView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    var page: OnboardingPage
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
                        .kerning(Sizes.Kerning.thick)
                    
                    Spacer()
                    
                    Button(action: {
                        if page.isFinalPage {
                            coordinator.navigate(to: .signUp)
                        } else {
                            currentPage = totalPages - 1
                        }
                    }, label: {
                        Text(LocalizedStrings.Onboarding.Button.skip)
                            .fontWeight(.semibold)
                            .kerning(Sizes.Kerning.regular)
                    })
                }
                .padding()
                .foregroundColor(.black)
                
                Spacer(minLength: .zero)
                
                if let details = page.details {
                    Text(details)
                        .font(.body)
                        .fontWeight(.regular)
                        .kerning(Sizes.Kerning.regular)
                        .multilineTextAlignment(.center)
                } else {
                    VStack(spacing: Sizes.Spacing.m) {
                        MainButton(buttonText: LocalizedStrings.LogIn.Button.signIn,
                                   backgroundColor: .cottonWhite,
                                   textColor: .babyBlue)
                        .onTapGesture {
                            coordinator.navigate(to: .logIn)
                        }
                        
                        MainButton(buttonText: LocalizedStrings.LogIn.Button.signUp,
                                   backgroundColor: .cottonWhite,
                                   textColor: .babyBlue)
                        .onTapGesture {
                            coordinator.navigate(to: .signUp)
                        }
                    }
                }
                
                if !page.isFinalPage {
                    MainButton(buttonText: LocalizedStrings.Onboarding.Button.next,
                               backgroundColor: .cottonWhite,
                               textColor: .babyBlue)
                    .onTapGesture {
                        currentPage += 1
                    }
                }
            }
        }
    }
}

