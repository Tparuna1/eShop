//
//  Home.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 20.02.25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if !viewModel.bannerImages.isEmpty {
                    BannerCarousel(images: viewModel.bannerImages)
                        .frame(height: Grid.Height.medium)
                        .padding(.top)
                }

                ScrollView {
                    Text("Products Section Here")
                        .padding()
                }
            }
            .navigationTitle("Home")
            .background(Color.darkBlue)
            
            VStack {
                
            }
        }
    }
}


#Preview {
    HomeView()
}
