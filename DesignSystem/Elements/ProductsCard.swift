//
//  ProductsCard.swift
//  eShop
//
//  Created by tornike <parunashvili on 27.02.25.
//

import SwiftUI

struct ProductCard: View {
    let product: ProductModel
    @State private var isLiked: Bool = false
    var favoriteAction: ((ProductModel, Bool) -> Void)?
    var addToCartAction: ((ProductModel) -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: Grid.Spacing.xs) {
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: product.imageURL)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(width: Grid.Size.mediumSmall.width,
                               height: Grid.Size.semiMedium.height)
                        .cornerRadius(Grid.Spacing.xs)
                } placeholder: {
                    Color.gray.opacity(Grid.BorderWidth.thin)
                        .frame(width: Grid.Size.mediumSmall.width,
                               height: Grid.Size.semiMedium.height)
                        .cornerRadius(Grid.Spacing.xs)
                }

                Button(action: {
                    isLiked.toggle()
                    favoriteAction?(product, isLiked)
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .gray)
                        .padding(8)
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                .padding(8)
            }

            Text(product.name)
                .font(.headline)
                .lineLimit(1)

            HStack {
                Text("$\(product.price)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .strikethrough(product.discount > .zero)

                if product.discount > .zero {
                    Text("$\(product.price - (product.price * product.discount / 100))")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }

            Button(action: {
                addToCartAction?(product) // Trigger add to cart
            }) {
                Text("Add to Cart")
                    .font(.footnote)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .frame(width: Grid.Size.mediumSmall.width)
        .onAppear {
            isLiked = product.isFavorite
        }
    }
}

