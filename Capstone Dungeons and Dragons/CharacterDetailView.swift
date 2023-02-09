//
//  CharacterDetailView.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 1/28/23.
//

import SwiftUI

let characterBackgroundGradient = LinearGradient(
    colors: [Color("StartingGradientRed"), Color("EndingGradientRed")],
    startPoint: .top, endPoint: .bottom)

struct CharacterDetailView: View {
    
    @ObservedObject var characterVM: CharacterViewModel
    @ObservedObject var characterRM: CharacterRaceModel
    @ObservedObject var characterCM: CharacterClassModel
    @ObservedObject var characterAM: CharacterAlignmentModel
    @State var character: Character
    @Environment(\.dismiss) private var dismiss
    @State var name = ""
    @State var characterClass = "Barbarian"
    @State var race = "Dragonborn"
    
    @State var alignment = "Chaotic Evil"
    
    
    var body: some View {
        ZStack{
            characterBackgroundGradient
                .ignoresSafeArea()
            VStack {
                
                Section{
                    TextField("Character Name", text: $name)
                        .font(.title)
                    HStack{
                        Text("Please select a Class: ")
                        Picker("Class", selection: $characterClass) {
                            ForEach(characterCM.classArray, id: \.self) { charClass in
                                Text(charClass.name).tag(charClass.name)
                            }
                        }.onAppear {
                            Task {
                                await characterCM.getData()
                            }
                        }
                        .accentColor(Color.black)
                        
                    }
                    
                    HStack{
                        Text("Please select a Race: ")
                        Picker("Race", selection: $race) {
                            ForEach(characterRM.raceArray, id: \.self) { race in
                                Text(race.name).tag(race.name)
                            }
                        }.onAppear {
                            Task{
                                await characterRM.getData()
                            }
                            
                        }
                        .accentColor(Color.black)
                        
                    }
                    HStack{
                        Text("Please select an alignment: ")
                        Picker("Alignment", selection: $alignment){
                            ForEach(characterAM.alignmentArray, id: \.self) { alignment in
                                Text(alignment.name).tag(alignment.name)
                            }
                        }.onAppear {
                            Task{
                                await characterAM.getData()
                            }
                            
                        }
                        .accentColor(Color.black)
                    }
                    
                }
                .disabled(character.id == nil ? false : true)
                .textFieldStyle(.roundedBorder)

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
                        Button {
                            characterVM.saveCharacter(name: name, characterClass: characterClass, race: race, alignment: alignment)
                            dismiss()
                            
                        } label: {
                            Text("Save")
                        }

                    }
                }
            }
            .font(.custom("Cinzel", size: 20))
        }
        
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CharacterDetailView(characterVM: CharacterViewModel(), characterRM: CharacterRaceModel(), characterCM: CharacterClassModel(), characterAM: CharacterAlignmentModel(), character: Character())

        }
        
    }
}
