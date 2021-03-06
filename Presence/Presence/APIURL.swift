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
    
    // func fullURL(endPoint: EndPoint) -> URL{
    //   return APIURL.baseURL.appendingPathComponent(endPoint.pathComponents)
    //}
    
    func fullURL(endPoint: EndPoint) -> URL {
        let urlWithComponents = APIURL.baseURL.appendingPathComponent(endPoint.pathComponents)
        if let queryItems = endPoint.queryItems {
            var urlComponents = URLComponents(url: urlWithComponents, resolvingAgainstBaseURL: true)!
            urlComponents.queryItems = queryItems
            return urlComponents.url!
        } else {
            return urlWithComponents
        }
    }
    
    
    
    enum EndPoint{
        case addUser
        case getEvents
        case getUser
        case checkIn
        case login
        case createRequest
        case getContactsForUser
        case getRequestsForUser(String)
        
        
        var pathComponents: String {
            switch self{
            case .addUser:
                return "add_user.json"
            case .getEvents:
                return "get_events.json"
            case .getUser: ///////////////
                return "get_user.json"
            case .checkIn:
                return "check_in_event.json"
            case .login:
                return "login_user.json"
            case .createRequest:
                return "request_contact.json"
            case .getContactsForUser:
                return "get_contacts_for_user.json"
            case .getRequestsForUser:
                return "get_all_requests.json?guestEmailAddress="
            }
        }
        
        var queryItems: [URLQueryItem]? {
            switch self{
            case .getRequestsForUser(let string):
                return [URLQueryItem(name: "emailAddress", value: string)]
            default:
                return nil
            }
        }
    }
    
}

