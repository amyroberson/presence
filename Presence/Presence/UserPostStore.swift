//
//  UserPostStore.swift
//  Presence
//
//  Created by Amy Roberson on 1/26/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation


final class UserPostStore {
    enum Error: Swift.Error{
        case http(HTTPURLResponse)
        case system(Swift.Error)
        case API(Util.Error)
    }
    let session: URLSession = URLSession.shared
    
    var request: URLRequest
    
    init(){
        request = URLRequest(url: APIURL().fullURL(endPoint: .addUser))
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData // should this change?
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }
    
    
    
    
    
    
}
