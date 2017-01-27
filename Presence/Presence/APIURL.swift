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
    
    enum EndPoint{
        case addUser
        case getEvents
        
        
        var pathComponents: String {
            switch self{
            case .addUser:
                return ".add_user"
            case .getEvents:
                return ".getEvents"
            }
        }
    }
}

