//
//  EventTests.swift
//  Presence
//
//  Created by Amy Roberson on 1/27/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import Presence

class EventTests: XCTestCase {
    
    func testInt(){
        let x = Date()
        let parts = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: x)
        let theDate = Calendar.current.date(from: parts)
        let dictionary: [String: Any] = [
            "name" : "IronPints",
            "address" : "here",
            "location": "M.Rich Building",
            "time": ( (theDate?.timeIntervalSince1970)! *  1000),
            "contacts" : [User(firstName: "Paul", lastName: "Judge", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!)]
        ]
        let event = Event(data: dictionary)
        XCTAssertEqual(event?.location, "M.Rich Building")
        XCTAssertEqual(event?.time, theDate)
        XCTAssertEqual(event?.name, "IronPints")
    }
    
    
    
    func testDictionary  (){
        let x = Date()
        let parts = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: x)
        let theDate = Calendar.current.date(from: parts)
        let dictionary: [String: Any] = [
            "name" : "IronPints",
            "address" : "here",
            "location": "M.Rich Building",
            "time": ( (theDate?.timeIntervalSince1970)! *  1000),
            "contacts" : [User(firstName: "Paul", lastName: "Judge", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!)]
        ]
        let event = Event(data: dictionary)
        let theDictionary = event?.toDictionary()
        XCTAssertEqual((theDictionary?["time"])! as? TimeInterval, ( (theDate?.timeIntervalSince1970)! *  1000))
    }
    
    
    
    
}
