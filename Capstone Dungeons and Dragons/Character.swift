//
//  Character.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 1/28/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Character: Identifiable, Codable {
    @DocumentID var id: String?
    var name = ""
    var characterClass = ""
    var race = ""
    var alignment = ""
    
    
    var dictionary: [String: Any] {
        return ["name": name, "characterClass": characterClass, "race": race, "alignment": alignment]
    }
}
