//
//  FirebaseAuthentification.swift
//  eShop
//
//  Created by tornike <parunashvili on 12.02.25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// MARK: - Firebase Authentication
class FirebaseAuthentification: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    init() {
        userSession = auth.currentUser
        Task { await fetchUser() }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        let result = try await auth.signIn(withEmail: email, password: password)
        self.userSession = result.user
        await fetchUser()
    }
    
    func createAccount(withEmail email: String, password: String, fullname: String) async throws {
        let result = try await auth.createUser(withEmail: email, password: password)
        self.userSession = result.user
        let user = User(id: result.user.uid, fullname: fullname, email: email)
        
        let userData = [
            "id": user.id,
            "fullname": user.fullname,
            "email": user.email
        ]
        try await db.collection("users").document(user.id).setData(userData)
        await fetchUser()
    }
    
    @MainActor
    func signOut() {
        try? auth.signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    @MainActor
    func deleteAccount() async throws {
        guard let user = auth.currentUser else { return }
        try await db.collection("users").document(user.uid).delete()
        try await user.delete()
        signOut()
    }
    
    @MainActor
    func fetchUser() async {
        guard let uid = auth.currentUser?.uid else { return }
        
        do {
            let snapshot = try await db.collection("users").document(uid).getDocument()
            if let data = snapshot.data() {
                self.currentUser = User(id: uid, fullname: data["fullname"] as? String ?? "", email: data["email"] as? String ?? "")
            }
        } catch {
            print("Error fetching user: \(error.localizedDescription)")
        }
    }
}
