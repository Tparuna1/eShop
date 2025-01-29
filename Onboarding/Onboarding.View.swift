//
//  Onboarding.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 29.01.25.
//

import SwiftUI

struct Onboarding: View {
    @State private var currentPage = 0
    
    var body: some View {
        TabView(selection: $currentPage) {
            ScreenView(image: "Onboarding1", title: "Welcome to eShop", details: "Find your favourite Clothes with Us", currentPage: $currentPage, index: 0, totalPages: 2)
            
            ScreenView(image: "Onboarding2", title: "Fast & Secure", details: "Enjoy a smooth and secure shopping experience", currentPage: $currentPage, index: 1, totalPages: 2)
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}

#Preview {
    Onboarding()
}

struct ScreenView: View {
    var image: String
    var title: String
    var details: String
    @Binding var currentPage: Int
    var index: Int
    var totalPages: Int
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                    
                    Spacer()
                    
                    Button(action: {
                        currentPage = totalPages - 1
                    }, label: {
                        Text("Skip")
                            .fontWeight(.semibold)
                            .kerning(1.2)
                    })
                }
                .padding()
                .foregroundColor(.black)
                
                Spacer(minLength: .zero)
                
                Text(details)
                    .font(.body)
                    .fontWeight(.regular)
                    .kerning(1.2)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    if index < totalPages - 1 {
                        currentPage += 1
                    } else {
                        print("Onboarding finished")
                    }
                }, label: {
                    Text(index < totalPages - 1 ? "Next" : "Get Started")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                        .frame(minWidth: .zero, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .cornerRadius(40)
                        .padding(.horizontal, 16)
                })
            }
        }
        .tag(index)
    }
}

