//
//  CharacterViewModel.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 1/28/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class CharacterViewModel: ObservableObject {
    @Published var character = Character()
    @Published var characterList = [Character]()
//    func saveCharacter(character: Character) async -> Bool {
//        let db = Firestore.firestore()
//        guard let uid = Auth.auth().currentUser?.uid else { return false }
//        if let id = character.id {
//            do {
//                try await db.collection("users").document(uid).collection("characters").document(id).setData(character.dictionary)
//                print("Data updated successfully")
//                return true
//            } catch {
//                print("ERROR: Could not update data in characters \(error.localizedDescription)")
//                return false
//            }
//        } else {
//            do {
//                try await db.collection("users").document(uid).collection("characters").document().setData(character.dictionary)
//                print("Data added successfully")
//                return true
//            } catch {
//                print("ERROR: could not create character \(error.localizedDescription)")
//                return false
//            }
//        }
//    }
    func saveCharacter(name: String, characterClass: String, race: String, background: String, alignment: String){
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid ?? "none"
        db.collection("users").document(uid).collection("characters").addDocument(data: ["name": name, "characterClass": characterClass, "race": race, "background": background, "alignment": alignment]) { error in
            if error == nil {
                self.getCharacters()
            }
            else {
                print("failed")
            }
        }
    }
    func getCharacters(){
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid ?? "none"
        db.collection("users").document(uid).collection("characters").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.characterList = snapshot.documents.map { d in
                            return Character(id: d.documentID, name: d["name"] as? String ?? "", characterClass: d["characterClass"] as? String ?? "", race: d["race"] as? String ?? "", background: d["background"] as? String ?? "", alignment: d["alignment"] as? String ?? "")
                        }
                    }
                    
                }
            } else {
                print("failed")
            }
            
        }
//        db.collection("users").document(uid ?? "none").collection("characters")
//            .getDocuments() { (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    for document in querySnapshot!.documents {
//                        print("\(document.documentID) => \(document.data())")
//                    }
//                }
//
//            }
    }
}
