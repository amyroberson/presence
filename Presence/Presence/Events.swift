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
    
    init?(data: [String: Any]){
        guard let name = data["name"] as? String,
            let location = data["location"] as? String,
            let time = data["time"] as? Date else {return nil }
        self.name = name
        self.location = location
        self.time = time
        
    }
    
    
    /*init(name: String, location: String, time: Date, attendants: [User]){
     self.name = name
     self.location = location
     self.time = time
     self.attendants = attendants
     }*/
 
 
    //toDictionary
    func toDictionary() -> [String : Any]{
        let dictionary: [String: Any] = [
            "name" : self.name,
            "location" : self.location,
            "time" : self.time //will likely need to be converted
        ]
        return dictionary
    }
    
   
    
}
