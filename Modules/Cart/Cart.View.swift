//
//  Cart.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 20.02.25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            if cartViewModel.cartItems.isEmpty {
                Text("Your cart is empty.")
                    .foregroundColor(.gray)
            } else {
                List(cartViewModel.cartItems) { product in
                    ProductCard(product: product)
                }
            }
        }
        .navigationTitle("Cart")
    }
}

#Preview {
    CartView()
}
