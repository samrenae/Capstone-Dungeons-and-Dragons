//
//  UserViewModel.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 1/28/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class UserViewModel: ObservableObject {
    @Published var user = User()
    
    func saveUser(user: User) async -> Bool {
        let db = Firestore.firestore()
        print(user.id ?? "default")
        guard let userId = Auth.auth().currentUser?.uid else { return false }
        do {
            try await db.collection("users").document(userId).setData(user.dictionary)
            print("Data updated successfully")
            return true
        } catch {
            print("ERROR: Could not update data in users \(error.localizedDescription)")
            return false
        }
    }
}
