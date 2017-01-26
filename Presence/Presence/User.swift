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
    let incomingRequests : [Request]
    let sentRequests: [Request]
    //images?
    
    init(firstName: String, lastName: String, company: String, position: String, email: String, passWord: String, pictureIsPrivate: Bool, incomingRequests: [Request] = [], sentRequests: [Request] = []){
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
        self.position = position
        self.email = email
        self.password = passWord
        self.pictureIsPrivate = pictureIsPrivate
        self.incomingRequests = incomingRequests
        self.sentRequests = sentRequests
    }
    
    
    //need to add image functionality
    convenience init?(dictionary: [String: Any]){
        if let first = dictionary["firstName"] as? String,
            let last = dictionary["lastName"] as? String,
            let company = dictionary["company"] as? String,
            let position = dictionary["position"] as? String,
            let email = dictionary["email"] as? String,
            let passWord = dictionary["password"] as? String,
            let pictureIsPrivate = dictionary["pictureIsPrivate"] as? Bool
            {
                let sent = dictionary["sentRequests"] as? [Request] ?? []
                let incoming = dictionary["incomingRequests"] as? [Request] ?? []
                self.init(firstName: first, lastName: last, company: company, position: position, email: email, passWord: passWord, pictureIsPrivate: pictureIsPrivate, incomingRequests: incoming, sentRequests: sent)
        } else {
            return nil
        }
    }
   
    //need to add image functionality
    func toDictionary() -> [String: Any]{
        let dictionary: [String: Any] = [
            "firstName" : self.firstName,
            "lastName" : self.lastName,
            "company" : self.company,
            "positon" : self.position,
            "email" : self.email,
            "password" : self.password,
            "picureIsPrivate" : self.pictureIsPrivate
            //"sentRequests" : self.sentRequests.map { ($0.toDictionary) }
        ]
        return dictionary
    }
    
    //expand once data structure is set!
    public static func == (_ lhs: User, _ rhs: User) -> Bool {
        return lhs.email == rhs.email
    }
    
}
