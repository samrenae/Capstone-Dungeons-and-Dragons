//
//  User.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 1/28/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    
    var email = ""
    var password = ""
    
    var dictionary: [String: Any] {
        return ["id":id ?? "Can't find it", "email":email, "password":password]
    }
}
