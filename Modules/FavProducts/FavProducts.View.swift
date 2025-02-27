//
//  FavProducts.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 27.02.25.
//

import SwiftUI

struct FavProductsView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var viewModel = FavProductsViewModel()

    private let columns = [
        GridItem(.flexible(), spacing: Grid.Spacing.m),
        GridItem(.flexible(), spacing: Grid.Spacing.m)
    ]

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.likedProducts.isEmpty {
                    Text("No favorite products available.")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: Grid.Spacing.m) {
                            ForEach(viewModel.likedProducts) { product in
                                ProductCard(product: product, favoriteAction: nil)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Favorite Products")
            .background(Color.darkBlue)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        coordinator.popScreen()
                    }) {
                        Image.arrowLeft
                            .foregroundColor(.white)
                    }
                }
            }
            .onAppear {
                viewModel.fetchFavoriteProducts()
            }
        }
    }
}

#Preview {
    FavProductsView()
}

