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
                    Text(LocalizedStrings.Favproducts.Text.favouriteProductsListIsEmpty)
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: Grid.Spacing.m) {
                            ForEach(viewModel.likedProducts) { product in
                                ProductCard(product: product, favoriteAction: nil, isInCart: false)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(LocalizedStrings.Favproducts.Text.favouriteProducts)
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

