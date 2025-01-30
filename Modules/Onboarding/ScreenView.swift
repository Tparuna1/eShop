//
//  ScreenView.swift
//  eShop
//
//  Created by tornike <parunashvili on 30.01.25.
//

import SwiftUI

struct ScreenView: View {
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
                            print("Handle final onboarding skip action")
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
                        MainButton(buttonText: LocalizedStrings.Onboarding.Button.signUp)
                            .onTapGesture {
                                print("Navigate to Sign Up")
                            }
                        
                        MainButton(buttonText: LocalizedStrings.Onboarding.Button.logIn)
                            .onTapGesture {
                                print("Navigate to Log In")
                            }
                    }
                }
                
                if !page.isFinalPage {
                    MainButton(buttonText: LocalizedStrings.Onboarding.Button.next)
                        .onTapGesture {
                            currentPage += 1
                        }
                }
            }
        }
    }
}

