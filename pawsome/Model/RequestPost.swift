//
//  RequestPost.swift
//  pawsome
//
//  Created by Roch on 29/03/2022.
//

import Foundation

struct RequestPost: Codable {
    var _id: String
    var message: String
    var userId:String
    var userName: String!
    var createdDate: String
}
