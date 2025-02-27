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

    var body: some View {
        NavigationStack {
            VStack {
                ProductGridView(
                    items: cartViewModel.cart.items,
                    productCardAction: { product in
                        cartViewModel.removeFromCart(product: product)
                    }, emptyText: LocalizedStrings.Cart.Text.yourCartIsEmpty,
                    productCard: { product in
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
                )
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




