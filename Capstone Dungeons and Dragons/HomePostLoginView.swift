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

let loginBackgroundGradient = LinearGradient(
    colors: [Color("StartingGradientRed"), Color("EndingGradientRed")],
    startPoint: .top, endPoint: .bottom)


struct HomePostLogin: View {

    @ObservedObject var charVM = CharacterViewModel()
    let db = Firestore.firestore()
    let uid = Auth.auth().currentUser?.uid

    @State private var sheetIsPresented = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack{
            loginBackgroundGradient
                .ignoresSafeArea()
            HStack{
                NavigationStack {
                    List(charVM.characterList) { character in
                        NavigationLink {
                            SecondCharacterView(character: character)
                        } label: {
                            
                            Text(character.name)
                                .font(.custom("Cinzel", size: 20))
                        }

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

                            } label: {
                                Image(systemName: "plus")
                            }

                        }
                    }
                    .sheet(isPresented: $sheetIsPresented) {
                        NavigationStack {
                            CharacterDetailView(characterVM: charVM, characterRM: CharacterRaceModel(), characterCM: CharacterClassModel(), characterAM: CharacterAlignmentModel(), character: Character())
                        }
                    }
                    .onAppear(perform: self.charVM.getCharacters)
                }
                .font(.custom("Cinzel", size: 20))
            }
            
        }
        
    }
    init() {
        charVM.getCharacters()
    }
}


struct HomePostLogin_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomePostLogin()
        }
    
    }
}
