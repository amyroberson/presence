//
//  Events.swift
//  Presence
//
//  Created by Amy Roberson on 1/25/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

class Event {
    let eventName: String
    let location: String
    let address: String
    let time: Date
    var guests: [User]
    
    init?(data: [String: Any]){
        
        guard let name = data["eventName"] as? String,
            let location = data["location"] as? String,
            let address = data["address"] as? String,
            let time = data["time"] as? TimeInterval,
        let contacts = data["guests"] as? [[String: Any]]
        
        else {return nil }
        let guests = contacts.flatMap {( User(dictionary: $0))}
        let x = Date(timeIntervalSince1970: time / 1000)
        let parts = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: x)
        let theDate = Calendar.current.date(from: parts)
        if let date = theDate {
            self.eventName = name
            self.location = location
            self.time = date
            self.address = address
            self.guests = guests
        } else {
            return nil
        }
    }
 
 
    //toDictionary
    func toDictionary() -> [String : Any]{
        let dictionary: [String: Any] = [
            "name" : self.eventName,
            "location" : self.location,
            "time" : self.time.timeIntervalSince1970 * 1000,
            "address" : self.address,
            "guests" : self.guests.map { $0.toDictionary }
        ]
        return dictionary
    }
    
   
    
}
