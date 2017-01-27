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
        let bob = User(firstName: "Paul", lastName: "Judge", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", password: "notThis", pictureIsPrivate: true)
        let dictionary = bob.toDictionary()
        let bob1 = User(dictionary: dictionary)
        XCTAssertNotNil(bob1)
        XCTAssertEqual((bob1), bob)
    }
    
    func testToJson(){
        let bob = User(firstName: "Paul", lastName: "Judge", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", password: "notThis", pictureIsPrivate: true)
        let x = bob.toDictionary()
        do {
            let data = try Util.toJson(dictionaryArray: [x])
            let result = Util.processResources(data: data, parse: User.init)
            print(result)
        } catch {
            XCTAssert(false)
        }
    }
    
    
    func testToJsonandBack(){
        let bob = User(firstName: "Paul", lastName: "Judge", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", password: "notThis", pictureIsPrivate: true)
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

    

