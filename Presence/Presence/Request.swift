//
//  Request.swift
//  Presence
//
//  Created by Amy Roberson on 1/25/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation


class Request {
    let toUserName: String
    let fromUserName: String
    let toUserEmail: String
    let fromUserEmail: String
    var isActive: Bool
    
    init(toUserName: String, fromUserName: String, toUserEmail: String, fromUserEmail: String, isActive: Bool){
        self.toUserName = toUserName
        self.fromUserName = fromUserName
        self.toUserEmail = toUserEmail
        self.fromUserEmail = fromUserEmail
        self.isActive = isActive
    }

    //test this
    func toDictionary() -> [String : Any]{
        let dictionary: [String : Any] = [
            "toUserName" : self.toUserName,
            "fromUserName" : self.fromUserName,
            "toUserEmail" : self.toUserEmail,
            "fromUserEmail" : self.fromUserEmail,
            "isActive" : self.isActive
        ]
        return dictionary
    }
    
    
    
}
