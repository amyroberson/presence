//
//  User.swift
//  Presence
//
//  Created by Amy Roberson on 1/25/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

class User : Equatable{
    let firstName: String
    let lastName: String
    let company: String
    let position: String
    let email: String
    let password: String
    let pictureIsPrivate: Bool
    
    
    init?(dictionary: [String: Any]){
        guard let first = dictionary["firstName"] as? String,
            let last = dictionary["lastName"] as? String,
            let company = dictionary["company"] as? String,
            let position = dictionary["position"] as? String,
            let email = dictionary["email"] as? String,
            let password = dictionary["password"] as? String,
            let pictureIsPrivate = dictionary["pictureIsPrivate"] as? Bool else {return nil}
        self.firstName = first
        self.lastName = last
        self.company = company
        self.position = position
        self.email = email
        self.password = password
        self.pictureIsPrivate = pictureIsPrivate
    }
    
    
    //need to add image functionality
    convenience init(firstName: String, lastName: String, company: String, position: String, email: String, password: String, pictureIsPrivate: Bool){
        let dictionary : [String: Any] = [
            "firstName" : firstName,
            "lastName" : lastName,
            "company" : company,
            "position" : position,
            "email" : email,
            "password" : password,
            "pictureIsPrivate" : pictureIsPrivate]
        self.init(dictionary: dictionary)!
    }
   
    //need to add image functionality
    func toDictionary() -> [String: Any]{
        let dictionary: [String: Any] = [
            "firstName" : self.firstName,
            "lastName" : self.lastName,
            "company" : self.company,
            "position" : self.position,
            "email" : self.email,
            "password" : self.password,
            "pictureIsPrivate" : self.pictureIsPrivate,
        ]
        return dictionary
    }
    
    
    //expand once data structure is set!
    public static func == (_ lhs: User, _ rhs: User) -> Bool {
        return lhs.email == rhs.email && lhs.firstName == rhs.firstName
    }
    
}
