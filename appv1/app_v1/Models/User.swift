//
//  User.swift
//  app_v1
//
//  Created by Saif Nassar on 29/11/2022.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var fname: String
    var lname: String
    var email: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case fname
        case lname
        case email
    }
        

}
