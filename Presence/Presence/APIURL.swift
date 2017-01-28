//
//  APIURL.swift
//  Presence
//
//  Created by Amy Roberson on 1/26/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

struct APIURL {
    
    internal static let baseURL: URL = URL(string: "https://presence-app.herokuapp.com/")!
    
    func fullURL(endPoint: EndPoint) -> URL{
        return APIURL.baseURL.appendingPathComponent(endPoint.pathComponents)
    }
    
    func createRequest(endpoint: EndPoint) -> URLRequest {
        fatalError()
    }
    
    
    enum EndPoint{
        case addUser
        case getEvents
        case getUser
        
        
        var pathComponents: String {
            switch self{
            case .addUser:
                return "add_user.json"
            case .getEvents:
                return "get_events.json"
            case .getUser:
                return "get_user.json"
            }
        }
        
        var httpMethod: String {
            switch self{
            case .addUser:
                return "POST"
            case .getEvents:
                return "GET"
            case .getUser:
                return "POST"
            }
        }
    }
    
}

