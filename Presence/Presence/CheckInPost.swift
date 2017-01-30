//
//  CheckInPost.swift
//  Presence
//
//  Created by Amy Roberson on 1/29/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

internal final class CheckInPost{
    
    let session: URLSession = URLSession.shared
    var request: URLRequest
    
    init(){
        request = URLRequest(url: APIURL().fullURL(endPoint: .checkIn))
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }
    
    internal func pushPostCheckIn(json: Data, completion: @escaping (ResourceResult<Event>) -> ()) {
        request.httpBody = json
        let task = session.dataTask(with: request) {(optionalData, optionalResponse, optionalError) in
            if let data = optionalData {
                completion(Util.processResource(data: data, parse: Event.init))
            }
            if let response = optionalResponse {
                let error = Resource.http(response as! HTTPURLResponse)
                completion(ResourceResult.failure(error))
                
            } else {
                completion(.failure(.system(optionalError!)))
            }
            
            
        }
        task.resume()
    }
}
