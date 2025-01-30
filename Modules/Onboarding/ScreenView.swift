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
    var index: Int
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
                        currentPage = totalPages - 1
                    }, label: {
                        Text(LocalizedStrings.Onboarding.Button.skip)
                            .fontWeight(.semibold)
                            .kerning(Sizes.Kerning.regular)
                    })
                }
                .padding()
                .foregroundColor(.black)
                
                Spacer(minLength: .zero)
                
                Text(page.details)
                    .font(.body)
                    .fontWeight(.regular)
                    .kerning(Sizes.Kerning.regular)
                    .multilineTextAlignment(.center)
                
                let buttonText = index < totalPages - 1 ?
                    LocalizedStrings.Onboarding.Button.next :
                    LocalizedStrings.Onboarding.Button.getStarted
                
                MainButton(buttonText: buttonText)
                    .onTapGesture {
                        if index < totalPages - 1 {
                            currentPage += 1
                        } else {
                            print("Onboarding finished")
                        }
                    }
            }
        }
        .tag(index)
    }
}
