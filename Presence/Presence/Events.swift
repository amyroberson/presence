//
//  Events.swift
//  Presence
//
//  Created by Amy Roberson on 1/25/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

class Event {
    let name: String
    let location: String
    let time: Date
    let attendants: [User]
    
    init(name: String, location: String, time: Date, attendants: [User]){
        self.name = name
        self.location = location
        self.time = time
        self.attendants = attendants
    }
    
    //toDictionary
    func toDictionary() -> [String : Any]{
        let dictionary: [String: Any] = [
            "name" : self.name,
            "location" : self.location,
            "attendants" : self.attendants.map {( $0.toDictionary)}
        ]
        return dictionary
    }
    
    
    
    //init?(from dictionary: [String:Any]) need to know time
    
}
