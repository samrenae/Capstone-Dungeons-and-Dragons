//
//  AbilityScores.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 2/3/23.
//

import Foundation
import FirebaseFirestoreSwift

struct AbilityScore: Identifiable, Codable {
    @DocumentID var id: String?
    var strength = ""
    var  dexterity = ""
    var constitution = ""
    var intelligence = ""
    var wisdom = ""
    var charisma = ""
    
    var dictionary: [String: Any] {
        return ["stength": strength, "dexterity": dexterity, "constitution": constitution, "intelligence": intelligence, "wisdom": wisdom, "charisma": charisma]
    }
}
