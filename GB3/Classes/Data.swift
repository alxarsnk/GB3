//
//  Data.swift
//  GB3
//
//  Created by Александр Арсенюк on 23.11.2021.
//

import Foundation

struct UserResponse {
    var status: Int
    var time: String
    var data: [User]
}

class User: Codable {
    let id: Int
    var name: String
    var username: String
    var email: String
    var address: Address?
    var phone: String
    var website: String
    var company: Company?
}

class Address: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo?
}

class Geo: Codable {
    var latitude: String
    var longtitude: String
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longtitude = "lng"
    }
}

class Company: Codable {
    var name: String
    var catchPhrase: String
    var text: String
    var phone: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case catchPhrase
        case text = "bs"
        case phone
    }
    
}
