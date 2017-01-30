//
//  EventStore.swift
//  Presence
//
//  Created by Amy Roberson on 1/26/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation




internal final class EventStore {
    
    fileprivate let session: URLSession = {
        return URLSession(configuration: .default)
    }()
    var request : URLRequest
    var endpoint:APIURL.EndPoint
    
    init(endpoint: APIURL.EndPoint){
        request = URLRequest(url: APIURL().fullURL(endPoint: endpoint))
        self.endpoint = endpoint
    }
    
    
    internal func fetchEvents(completion: @escaping (ResourceResult<[Event]>) -> ()) {
        request.httpMethod = "GET"
        let task = session.dataTask(with: APIURL().fullURL(endPoint: endpoint)) {
            (optionalData, optionalResponse, optionalError) in

            if let data = optionalData {
                completion(Util.processResources(data: data, parse: Event.init))
            } else if let response = optionalResponse {
                let error = Resource.http(response as! HTTPURLResponse)
                completion(.failure(error))
            } else {
                completion(.failure(.system(optionalError!)))
            }
            
        }
        task.resume()
    }
    
    
    
}
