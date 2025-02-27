//
//  FavProductsViewModel.swift
//  eShop
//
//  Created by tornike <parunashvili on 27.02.25.
//

import Foundation
import FirebaseFirestore

class FavProductsViewModel: ObservableObject {
    @Published var likedProducts: [ProductModel] = []

    private let firestoreService = FirestoreService.shared

    /// Fetch favorite products from Firebase
    func fetchFavoriteProducts() {
        Task {
            do {
                likedProducts = try await firestoreService.fetchFavoriteProducts()
            } catch {
                print("Error fetching favorite products: \(error.localizedDescription)")
            }
        }
    }
}
