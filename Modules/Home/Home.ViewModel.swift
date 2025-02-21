//
//  Home.ViewModel.swift
//  eShop
//
//  Created by tornike <parunashvili on 20.02.25.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var bannerImages: [String] = []
    private let storageService = StorageService()

    init() {
        Task {
            await fetchBannerImages()
        }
    }
    
    // Fetches banner images from Firebase Storage
    func fetchBannerImages() async {
        do {
            let images = try await storageService.fetchBannerImages()
            bannerImages = images
        } catch {
            print("Failed to fetch banner images:", error.localizedDescription)
        }
    }
    
    // Add a sample product to Firestore using async/await
    func addSampleProduct() async {
        let newProduct = ProductModel(
            id: UUID().uuidString,
            name: "Sample Product",
            description: "This is a sample product",
            imageURL: "https://your-image-url.com", // Add your image URL here
            price: 1999,
            company: "Sample Company",
            rating: 4,
            type: "T-Shirt",
            isFavorite: false,
            color: "Red",
            size: "M",
            discount: 10
        )
        
        do {
            try await FirestoreService.shared.addProduct(product: newProduct)
            print("Product added successfully")
        } catch {
            print("Error adding product: \(error.localizedDescription)")
        }
    }
}


