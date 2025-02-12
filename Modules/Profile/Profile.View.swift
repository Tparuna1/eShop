//
//  Profile.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 10.02.25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text(User.MOCK_USER.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: Grid.Size.small.width, height: Grid.Size.small.height)
                        .background(Color(.systemGray))
                        .clipShape(.circle)
                    
                    VStack(alignment: .leading, spacing: Grid.Spacing.xs2) {
                        Text(User.MOCK_USER.fullname)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, Grid.Spacing.xs2)
                        
                        Text(User.MOCK_USER.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
            Section("General") {
                HStack {
                    SettingsRow(imageName: "gear",
                                title: "Version",
                                tintColor: Color(.systemGray)
                    )
                    
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
            }
            
            Section("Account") {
                Button {
                    print("Sign out..")
                } label: {
                    SettingsRow(imageName: "arrow.left.circle.fill",
                                title: "Sign Out",
                                tintColor: .red
                    )
                }
                
                Button {
                    print("Delete Account...")
                } label: {
                    SettingsRow(imageName: "xmark.circle.fill",
                                title: "Delete Account",
                                tintColor: .red
                    )
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
