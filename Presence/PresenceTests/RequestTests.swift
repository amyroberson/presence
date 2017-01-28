//
//  RequestTests.swift
//  Presence
//
//  Created by Amy Roberson on 1/27/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import Presence

class RequestTests: XCTestCase {
    
    func testInits(){
        let bob = User(firstName: "Paul", lastName: "Judge", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!)
        let jack = User(firstName: "Kevin", lastName: "Judge", company: "Drop", position: "CEO", email: "Paul@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!)
        
        let dictionary: [String : Any] = [
            "toUser" : bob,
            "fromUser" : jack,
            "isActive" : true
        ]
        let request = Request(data: dictionary)
        let rDictionary = request?.toDictionary()
        
        XCTAssertEqual((rDictionary?["isActive"] as? Bool), true)
        XCTAssertEqual(User(dictionary: (rDictionary?["toUser"] as? [String: Any])!), (bob))
    }
    
}
