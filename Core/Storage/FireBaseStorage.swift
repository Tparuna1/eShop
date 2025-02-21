//
//  FireBaseStorage.swift
//  eShop
//
//  Created by tornike <parunashvili on 21.02.25.
//

import Foundation
import FirebaseStorage

final class StorageService {
    private let storage = Storage.storage().reference()
    
    /// Fetches all banner image URLs from Firebase Storage
    func fetchBannerImages() async throws -> [String] {
        let bannerFolder = storage.child("Banner")
        let result = try await bannerFolder.listAll()
        
        var imageUrls: [String] = []
        
        for item in result.items {
            let url = try await item.downloadURL()
            imageUrls.append(url.absoluteString)
        }
        
        return imageUrls
    }
}


