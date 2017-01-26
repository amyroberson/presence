//
//  Request.swift
//  Presence
//
//  Created by Amy Roberson on 1/25/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation


class Event {
    var location: String
    var time: Date
    var attendents: [User]
    
    init(location: String, time: Date, attendents: [User]){
        self.location = location
        self.time = time
        self.attendents = attendents
    }
    
    //toDictionary
    //init?
    
}
