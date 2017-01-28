//
//  Request.swift
//  Presence
//
//  Created by Amy Roberson on 1/25/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation


class Request {
    let toUser: User
    let fromUser: User
    var isActive: Bool
    
    init?(data: [String: Any]){
        guard let toUser = data["toUser"] as? User,
            let fromUser = data["fromUser"] as? User,
            let isActive = data["isActive"] as? Bool
            else {return nil}
        self.toUser = toUser
        self.fromUser = fromUser
        self.isActive = isActive
    }
    
    func toDictionary() -> [String : Any]{
        let dictionary: [String : Any] = [
            "toUser": self.toUser.toDictionary(),
            "fromUser": self.fromUser.toDictionary(),
            "isActive" : self.isActive
        ]
        return dictionary
    }
    
    
    
}
