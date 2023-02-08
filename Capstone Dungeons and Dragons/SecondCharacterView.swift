//
//  SecondCharacterView.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 2/6/23.
//

import SwiftUI

struct SecondCharacterView: View {
    @State var character: Character
//    @State private var sheetIsPresented = false
    var body: some View {
        
        List {
            HStack{
                Text("Name: ")
                Text(character.name)
            }
            HStack{
                Text("Class: ")
                Text(character.characterClass)
            }
            HStack{
                Text("Race: ")
                Text(character.race)
            }
            HStack{
                Text("Alignment: ")
                Text(character.alignment)
            }
        }
    }
}

struct SecondCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        SecondCharacterView(character: Character())
    }
}
