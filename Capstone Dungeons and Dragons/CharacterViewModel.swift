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
    
    
    
    @Published var characterList = [Character]()

    func saveCharacter(name: String, characterClass: String, race: String, background: String, alignment: String, level: String){
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid ?? "none"
        db.collection("users").document(uid).collection("characters").addDocument(data: ["name": name, "characterClass": characterClass, "race": race, "background": background, "alignment": alignment, "level": level]) { error in
            if error == nil {
                print("we made it")
                
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
                            return Character(id: d.documentID, name: d["name"] as? String ?? "", characterClass: d["characterClass"] as? String ?? "", race: d["race"] as? String ?? "", background: d["background"] as? String ?? "", alignment: d["alignment"] as? String ?? "", level: d["level"] as? String ?? "")
                        }
                    }
                    
                }
            } else {
                print("failed")
            }
            
        }
    }
}
