//
//  RequestStore.swift
//  Presence
//
//  Created by Amy Roberson on 1/29/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

internal final class RequestStore {
    
    fileprivate let session: URLSession = {
        return URLSession(configuration: .default)
    }()
    var request: URLRequest
    var endpoint:APIURL.EndPoint
    
    init(endpoint: APIURL.EndPoint){
        request = URLRequest(url: APIURL().fullURL(endPoint: endpoint))
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        self.endpoint = endpoint
    }

    internal func fetchRequestsForUser(completion: @escaping (ResourceResult<[Request]>) -> ()) {
        let task = session.dataTask(with: APIURL().fullURL(endPoint: endpoint)) {
            (optionalData, optionalResponse, optionalError) in
            
            if let data = optionalData {
                completion(Util.processResources(data: data, parse: Request.init))
            } else if let response = optionalResponse {
                let error = Resource.http(response as! HTTPURLResponse)
                completion(ResourceResult.failure(error))
            } else {
                completion(.failure(.system(optionalError!)))
            }
        }
        task.resume()
    }
    
    
    
    //func postAcceptRequest(
    
    //func postRejectRequest()
    
    //func postReactivateRequest()
    
    //func postCreateRequest()
}
