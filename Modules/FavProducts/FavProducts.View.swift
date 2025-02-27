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

    var body: some View {
        NavigationStack {
            VStack {
                ProductGridView(
                    items: viewModel.likedProducts,
                    productCardAction: { _ in }, emptyText: LocalizedStrings.Favproducts.Text.favouriteProductsListIsEmpty,
                    productCard: { product in
                        ProductCard(
                            product: product,
                            favoriteAction: nil,
                            isInCart: false
                        )
                    }
                )
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

