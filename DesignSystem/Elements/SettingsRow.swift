//
//  SettingsRow.swift
//  eShop
//
//  Created by tornike <parunashvili on 10.02.25.
//

import SwiftUI

struct SettingsRow: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: Grid.Spacing.s) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black )
        }
    }
}

#Preview {
    SettingsRow(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
}
