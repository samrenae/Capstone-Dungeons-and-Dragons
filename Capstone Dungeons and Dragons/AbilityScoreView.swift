//
//  AbilityScoreView.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 2/2/23.
//

import SwiftUI

struct AbilityScoreView: View {
    @State private var selection = "15"
    let availableScores = ["15", "14", "13", "12", "10", "8"]
//    @State var character: Character
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        VStack {
            Spacer()
            Text("Please select a score for each ability. Keep in mind these scores will determine your bonuses on saving throws! Only one score should be used at a time!")
            Spacer()
            Text("Current proficiency bonus is: (fill in prof bonus)")
            Spacer()
            Group{
                HStack{
                    Text("Strength")
                    Picker("Select starting ability score", selection: $selection) {
                        ForEach(availableScores, id: \.self) {score in
                            Text(score).tag(score)
                        }
                    }
                }
                HStack{
                    Text("Dexterity")
                    Picker("Select starting ability score", selection: $selection) {
                        ForEach(availableScores, id: \.self) {score in
                            Text(score).tag(score)
                        }
                    }
                }
                HStack{
                    Text("Constitution")
                    Picker("Select starting ability score", selection: $selection) {
                        ForEach(availableScores, id: \.self) {score in
                            Text(score).tag(score)
                        }
                    }
                }
                HStack{
                    Text("Intelligence")
                    Picker("Select starting ability score", selection: $selection) {
                        ForEach(availableScores, id: \.self) {score in
                            Text(score).tag(score)
                        }
                    }
                }
                HStack{
                    Text("Wisdom")
                    Picker("Select starting ability score", selection: $selection) {
                        ForEach(availableScores, id: \.self) {score in
                            Text(score).tag(score)
                        }
                    }
                }
                HStack{
                    Text("Charisma")
                    Picker("Select starting ability score", selection: $selection) {
                        ForEach(availableScores, id: \.self) {score in
                            Text(score).tag(score)
                        }
                    }
                }
                Spacer()
                
            }
        }

    }
}

struct AbilityScoreView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityScoreView()
    }
}
