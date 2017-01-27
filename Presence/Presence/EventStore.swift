//
//  EventStore.swift
//  Presence
//
//  Created by Amy Roberson on 1/26/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation


import Foundation


internal final class EventStore {
    
    fileprivate let session: URLSession = {
        return URLSession(configuration: .default)
    }()
    
    internal func fetchEvents(completion: @escaping (ResourceResult<[Event]>) -> ()) {
        let task = session.dataTask(with: APIURL().fullURL(endPoint: .getEvents)) {
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
