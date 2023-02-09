//
//  SecondCharacterView.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 2/6/23.
//

import SwiftUI
//struct customColor {
//    static let startingRed = Color("StartingGradientRed")
//    static let endingRed = Color("EndingGradientRed")
//}
let secondCharacterBackgroundGradient = LinearGradient(
    colors: [Color("StartingGradientRed"), Color("EndingGradientRed")],
    startPoint: .top, endPoint: .bottom)

struct SecondCharacterView: View {
    @State var character: Character
    
//    @State private var sheetIsPresented = false
    var body: some View {
        ZStack{
            secondCharacterBackgroundGradient
                .ignoresSafeArea()
            VStack{
                
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
            .font(.custom("Cinzel", size: 20))
            
            
        }
    }
}

struct SecondCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        SecondCharacterView(character: Character())
    }
}
