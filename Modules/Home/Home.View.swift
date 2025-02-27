//
//  Home.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 20.02.25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @EnvironmentObject private var coordinator: AppCoordinator

    var body: some View {
        NavigationStack {
            VStack {
                if !viewModel.bannerImages.isEmpty {
                    BannerCarousel(images: viewModel.bannerImages)
                        .frame(height: Grid.Height.medium)
                        .padding(.top)
                }

                ScrollView {
                    VStack(alignment: .leading) {
                        if !viewModel.salesProducts.isEmpty {
                            Text(LocalizedStrings.Home.Text.salesProducts)
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)

                            SalesProductsView(
                                products: viewModel.salesProducts,
                                favoriteAction: viewModel.updateFavoriteStatus,
                                addToCartAction: viewModel.addToCart
                            )
                        }
                    }
                }
            }
            .navigationTitle(LocalizedStrings.Home.Text.home)
            .background(Color.darkBlue)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        coordinator.navigate(to: .favProducts)
                    }) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

struct SalesProductsView: View {
    let products: [ProductModel]
    var favoriteAction: ((ProductModel, Bool) -> Void)?
    var addToCartAction: ((ProductModel) -> Void)?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: Grid.Spacing.m) {
                ForEach(products) { product in
                    ProductCard(
                        product: product,
                        favoriteAction: favoriteAction,
                        addToCartAction: addToCartAction, isInCart: false
                    )
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}


