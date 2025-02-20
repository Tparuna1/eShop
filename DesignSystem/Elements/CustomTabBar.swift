//
//  CustomTabBar.swift
//  eShop
//
//  Created by tornike <parunashvili on 20.02.25.
//

import SwiftUI

// MARK: - Floating Custom Tab Bar
struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \ .self) { tab in
                Spacer()
                Button(action: {
                    withAnimation(.spring()) {
                        selectedTab = tab
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                }) {
                    VStack {
                        Image(systemName: tab.icon)
                            .font(.system(size: Grid.Spacing.l))
                            .foregroundColor(selectedTab == tab ? .babyBlue : .spaceGrey)
                            .scaleEffect(selectedTab == tab ? Grid.Kerning.regular : Grid.Kerning.thin)
                            .animation(.spring(), value: selectedTab)
                        
                        if selectedTab == tab {
                            Circle()
                                .frame(width: Grid.Spacing.xs, height: Grid.Spacing.xs)
                                .foregroundColor(.babyBlue)
                                .offset(y: Grid.Spacing.xs2)
                        }
                    }
                }
                Spacer()
            }
        }
        .frame(height: Grid.Spacing.xl7)
        .background(
            RoundedRectangle(cornerRadius: Grid.Spacing.xl4)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(Grid.BorderWidth.superThin), radius: Grid.Spacing.xs, x: .zero, y: Grid.Spacing.xs2)
                .blur(radius: Grid.BorderWidth.thick)
        )
        .padding(.horizontal, Grid.Spacing.l)
        .padding(.bottom, Grid.Spacing.l)
    }
}
