//
//  Cart.ViewModel.swift
//  eShop
//
//  Created by tornike <parunashvili on 20.02.25.
//

import SwiftUI

class CartViewModel: ObservableObject {
    @Published var cartItems: [ProductModel] = []
    
    func addToCart(product: ProductModel) {
        print("addToCart in CartViewModel triggered for product: \(product.name)")
        
        if !cartItems.contains(where: { $0.id == product.id }) {
            cartItems.append(product)
            print("Product added to cart: \(product.name)")
        } else {
            print("Product is already in cart: \(product.name)")
        }
    }

    func removeFromCart(product: ProductModel) {
        cartItems.removeAll { $0.id == product.id }
    }
}

