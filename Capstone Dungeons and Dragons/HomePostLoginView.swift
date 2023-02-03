//
//  HomePostLoginView.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 1/28/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseAuth

struct HomePostLogin: View {
//    @FirestoreQuery(collectionPath: "characters") var characters: [Character]
    @ObservedObject var charVM = CharacterViewModel()
    let db = Firestore.firestore()
    let uid = Auth.auth().currentUser?.uid
    
//    private var characterStruct = db.collection(uid).collection("characters")
    @State private var sheetIsPresented = false
    @Environment(\.dismiss) private var dismiss
//    var _ = getAllCharacters()
    var body: some View {
        NavigationStack {
            List(charVM.characterList) { character in
                NavigationLink {
                    CharacterDetailView(characterVM: charVM, character: character)
                } label: {
                    Text(character.name)
                        .font(.title2)
                }
//                Text(character.name)
            }
            .listStyle(.plain)
            .navigationTitle("Characters")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sign Out") {
                        do {
                            try Auth.auth().signOut()
                            print("Log out successful")
                            dismiss()
                        } catch {
                            print("ERROR: Could not sign out!")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
//                        getAllCharacters()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    CharacterDetailView(characterVM: charVM, character: Character())
                }
            }
            .onAppear(perform: self.charVM.getCharacters)
        }
    }
    init() {
        charVM.getCharacters()
    }
}


//func getAllCharacters(){
//    let db = Firestore.firestore()
//    let uid = Auth.auth().currentUser?.uid
//    print("here")
//    db.collection("users").document(uid ?? "none").collection("characters")
//        .getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//
//        }
//
//
//}

struct HomePostLogin_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomePostLogin()
        }
    
    }
}
