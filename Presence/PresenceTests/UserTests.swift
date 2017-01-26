//
//  UserTests.swift
//  Presence
//
//  Created by Amy Roberson on 1/25/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import Presence

class UserTests: XCTestCase {
    
    func textInits(){
        let bob = User(firstName: "Paul", lastName: "Judge", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", passWord: "notThis", pictureIsPrivate: true)
        let dictionary = bob.toDictionary()
        let bob1 = User(dictionary: dictionary)
        XCTAssertEqual((bob1)!, bob)
    }
    
    
    
}
