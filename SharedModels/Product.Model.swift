//
//  Product.Model.swift
//  eShop
//
//  Created by tornike <parunashvili on 21.02.25.
//

import Foundation

struct ProductModel: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let imageURL: String
    let price: Int
    let company: String
    let rating: Int
    let type: String
    let isFavorite: Bool
    let color: String
    let size: String
    let discount: Int
}

