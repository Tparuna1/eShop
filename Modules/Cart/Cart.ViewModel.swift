//
//  Cart.ViewModel.swift
//  eShop
//
//  Created by tornike <parunashvili on 20.02.25.
//

import SwiftUI

class CartViewModel: ObservableObject {
    @Published var cart: CartModel = CartModel(items: [])
    
    private let storageKey = "cart_items"
    
    init() {
        loadCartFromStorage()
    }
    
    /// Add product to cart and persist it
    func addToCart(product: ProductModel) {
        cart.addProduct(product)
        saveCartToStorage()
    }
    
    /// Remove product from cart
    func removeFromCart(product: ProductModel) {
        cart.removeProduct(product)
        saveCartToStorage()
    }
    
    /// Save cart to persistent storage
    private func saveCartToStorage() {
        if let encoded = try? JSONEncoder().encode(cart) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
    
    /// Load cart from persistent storage
    func loadCartFromStorage() {
        if let savedData = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode(CartModel.self, from: savedData) {
            cart = decoded
        }
    }
}
