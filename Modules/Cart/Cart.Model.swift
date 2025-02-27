//
//  Cart.Model.swift
//  eShop
//
//  Created by tornike <parunashvili on 20.02.25.
//

import Foundation

/// A model to represent the cart with items and total price.
struct CartModel: Codable {
    var items: [ProductModel]
    var totalPrice: Int {
        items.reduce(0) { $0 + $1.price }
    }
    
    /// Add a product to the cart
    mutating func addProduct(_ product: ProductModel) {
        if !items.contains(where: { $0.id == product.id }) {
            items.append(product)
        }
    }
    
    /// Remove a product from the cart
    mutating func removeProduct(_ product: ProductModel) {
        items.removeAll { $0.id == product.id }
    }
}
