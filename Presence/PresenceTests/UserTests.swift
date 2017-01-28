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
    
    func testInits(){
        let bob = User(firstName: "Paul", lastName: "Judge", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!)
        let dictionary = bob.toDictionary()
        let bob1 = User(dictionary: dictionary)
        XCTAssertNotNil(bob1)
        XCTAssertEqual((bob1), bob)
    }
    
   
    
    
    func testToJsonandBack(){
        let bob = User(firstName: "Paul", lastName: "Judge", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!)
        let x = bob.toDictionary()
        do {
            let y = try Util.toJson(dictionaryArray: [x])
            let result = Util.processResources(data: y, parse: User.init)
            switch result{
            case .success(let users):
                XCTAssertEqual(bob, users[0])
            default:
                XCTAssert(false)
            }
        } catch {
            XCTAssert(false)
        }
    }
    
    
    func testToJsonandBack1(){
        let bob = User(firstName: "Ann", lastName: "Smith", company: "PinDrop", position: "Programmer", email: "Ann@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!)
        let x = bob.toDictionary()
        do {
            let y = try Util.toJson(dictionaryArray: [x])
            let result = Util.processResources(data: y, parse: User.init)
            switch result{
            case .success(let users):
                XCTAssertEqual(bob, users[0])
            default:
                XCTAssert(false)
            }
        } catch {
            XCTAssert(false)
        }
    }
}

    

