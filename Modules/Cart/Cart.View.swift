//
//  Cart.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 20.02.25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: Grid.Spacing.m),
        GridItem(.flexible(), spacing: Grid.Spacing.m)
    ]

    var body: some View {
        NavigationStack {
            VStack {
                if cartViewModel.cart.items.isEmpty {
                    Text(LocalizedStrings.Cart.Text.yourCartIsEmpty)
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: Grid.Spacing.m) {
                            ForEach(cartViewModel.cart.items) { product in
                                ProductCard(
                                    product: product,
                                    favoriteAction: { _, _ in },
                                    addToCartAction: { _ in },
                                    removeFromCartAction: { product in
                                        cartViewModel.removeFromCart(product: product)
                                    },
                                    isInCart: true
                                )
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(LocalizedStrings.Cart.Text.cart)
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
            .background(Color.darkBlue)
            .onAppear {
                cartViewModel.loadCartFromStorage()
            }
        }
    }
}

#Preview {
    CartView()
}




