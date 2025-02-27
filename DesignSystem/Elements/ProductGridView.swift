//
//  ProductGridView.swift
//  eShop
//
//  Created by tornike <parunashvili on 27.02.25.
//

import SwiftUI

struct ProductGridView: View {
    let items: [ProductModel]
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: Grid.Spacing.m),
        GridItem(.flexible(), spacing: Grid.Spacing.m)
    ]
    var productCardAction: (ProductModel) -> Void
    var emptyText: String
    var productCard: (ProductModel) -> ProductCard

    var body: some View {
        VStack {
            if items.isEmpty {
                Text(emptyText)
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: Grid.Spacing.m) {
                        ForEach(items) { product in
                            productCard(product)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
