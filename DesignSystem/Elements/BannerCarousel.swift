//
//  BannerCarousel.swift
//  eShop
//
//  Created by tornike <parunashvili on 21.02.25.
//

import SwiftUI

struct BannerCarousel: View {
    let images: [String]
    @State private var currentIndex = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(images.indices, id: \.self) { index in
                AsyncImage(url: URL(string: images[index])) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(Grid.BorderWidth.thin)
                }
                .frame(width: UIScreen.main.bounds.width - Grid.Spacing.xl4, height: Grid.Height.medium)
                .clipShape(RoundedRectangle(cornerRadius: Grid.CornerRadius.small))
                .padding(.horizontal, Grid.Spacing.l)
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % images.count
            }
        }
    }
}
