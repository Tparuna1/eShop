//
//  FirebaseService.swift
//  eShop
//
//  Created by tornike <parunashvili on 21.02.25.
//

import FirebaseFirestore
import FirebaseStorage

class FirestoreService {
    static let shared = FirestoreService()  // Singleton instance
    private let db = Firestore.firestore()

    // Add Product to Firestore using async/await
    func addProduct(product: ProductModel) async throws {
        do {
            let _ = try db.collection("products").document(product.id).setData(from: product)
        } catch {
            throw error
        }
    }
    
    // Fetch Products from Firestore (optional) using async/await
    func fetchProducts() async throws -> [ProductModel] {
        let snapshot = try await db.collection("products").getDocuments()
        
        var products: [ProductModel] = []
        for document in snapshot.documents {
            do {
                let product = try document.data(as: ProductModel.self)
                products.append(product)
            } catch {
                throw error
            }
        }
        return products
    }
}
