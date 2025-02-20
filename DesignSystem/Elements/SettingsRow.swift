//
//  SettingsRow.swift
//  eShop
//
//  Created by tornike <parunashvili on 10.02.25.
//

import SwiftUI

struct SettingsRow: View {
    let icon: Image
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: Grid.Spacing.s) {
            icon
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

//#Preview {
//    SettingsRow(icon: "gear", title: "Version", tintColor: Color(.systemGray))
//}
