//
//  Profile.View.swift
//  eShop
//
//  Created by tornike <parunashvili on 10.02.25.
//

import SwiftUI

// MARK: - Profile View
struct ProfileView: View {
    @StateObject private var authService = FirebaseAuthentification()
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text(authService.currentUser?.initials ?? "?")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: Grid.Size.extraSmall.width,
                               height: Grid.Size.extraSmall.height)
                        .background(Color.spaceGrey)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(authService.currentUser?.fullname ?? LocalizedStrings.SignIn.Text.unknown)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text(authService.currentUser?.email ?? LocalizedStrings.SignIn.Text.unknown)
                            .font(.footnote)
                            .foregroundColor(.spaceGrey)
                    }
                }
            }
            
            Section(LocalizedStrings.SignIn.Text.account) {
                Button(action: { authService.signOut(); coordinator.navigate(to: .onboarding) }) {
                    SettingsRow(icon: .arrowLeftCircleFill,
                                title: LocalizedStrings.SignIn.Button.signOut,
                                tintColor: .red)
                }
                Button(action: { Task { try? await authService.deleteAccount(); coordinator.navigate(to: .onboarding) } }) {
                    SettingsRow(icon: .xmarkCircleFill,
                                title: LocalizedStrings.SignIn.Button.deleteAccount,
                                tintColor: .red)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
