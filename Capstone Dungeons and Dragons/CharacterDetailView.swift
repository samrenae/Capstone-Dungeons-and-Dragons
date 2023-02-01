//
//  CharacterDetailView.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 1/28/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @EnvironmentObject var characterVM: CharacterViewModel
    @State var character: Character
    @Environment(\.dismiss) private var dismiss
    @State var name = ""
    @State var characterClass = ""
    @State var race = ""
    @State var background = ""
    @State var alignment = ""
    var body: some View {
        VStack {
            
            Group{
                TextField("Character Name", text: $name)
                    .font(.title)
                TextField("Character Class", text: $characterClass)
                    .font(.title2)
                TextField("Race", text: $race)
                    .font(.title2)
                TextField("Background", text: $background)
                    .font(.title2)
                TextField("Alignment", text: $alignment)
                    .font(.title2)
            }
            .disabled(character.id == nil ? false : true)
            .textFieldStyle(.roundedBorder)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.5), lineWidth: character.id == nil ? 2 : 0)
            }
            .padding(.horizontal)
            
            Spacer()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        
        .navigationBarBackButtonHidden(character.id == nil)
        .toolbar {
            if character.id == nil {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Save") {
//                        characterVM.saveCharacter(name: name, characterClass: characterClass, race: race, background: background, alignment: alignment)
//                        dismiss()
//                    }
                    Button {
                        characterVM.saveCharacter(name: name, characterClass: characterClass, race: race, background: background, alignment: alignment)
                        dismiss()
                    } label: {
                        Text("Save")
                    }

                }
            }
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CharacterDetailView(character: Character())
                .environmentObject(CharacterViewModel())
        }
        
    }
}
