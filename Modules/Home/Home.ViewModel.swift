//
//  Home.ViewModel.swift
//  eShop
//
//  Created by tornike <parunashvili on 20.02.25.
//

import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var bannerImages: [String] = []
    @Published var salesProducts: [ProductModel] = []
    @Published var cartItems: [ProductModel] = []
    
    private let storageService = StorageService()
    private let firestoreService = FirestoreService.shared

    
    var cartViewModel: CartViewModel?

    init(cartViewModel: CartViewModel? = nil) {
        if let cartViewModel = cartViewModel {
            self.cartViewModel = cartViewModel
        } else {
            self.cartViewModel = CartViewModel()
        }
        Task {
            await fetchBannerImages()
            await fetchSalesProducts()
        }
    }

    /// Fetch banner images from Firebase Storage
    func fetchBannerImages() async {
        do {
            let images = try await storageService.fetchBannerImages()
            bannerImages = images
        } catch {
            print("Failed to fetch banner images:", error.localizedDescription)
        }
    }

    /// Fetch sales products from Firestore
    func fetchSalesProducts() async {
        do {
            let products = try await firestoreService.fetchProducts()
            salesProducts = products.filter { $0.discount > .zero } /// Shows only discounted products
        } catch {
            print("Failed to fetch sales products:", error.localizedDescription)
        }
    }

    /// Add product to cart
    func addToCart(product: ProductModel) {
        print("addToCart in HomeViewModel triggered for product: \(product.name)")
        cartViewModel?.addToCart(product: product)
    }

    /// Update favorite status for a product
    func updateFavoriteStatus(on product: ProductModel, isFavorite: Bool) {
        firestoreService.updateFavoriteStatus(on: product, isFavorite: isFavorite)
    }
}
