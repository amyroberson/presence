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
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        self.endpoint = endpoint
    }
    
    internal func fetchRequestsForUser(json: Data, completion: @escaping (ResourceResult<[Request]>) -> ()) {
        request.httpMethod = "POST"
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
    
    func postCreateRequest(json: Data, completion: @escaping (ResourceResult<Any>) -> ()) {
        request.httpBody = json
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let task = session.dataTask(with: request) {(optionData, optionalResponse, optionalError) in
            if let response = optionalResponse {
                if let _response = response as? HTTPURLResponse{
                    if _response.statusCode == 200{
                        completion(.success(true))
                    } else {
                        let error = Resource.http(response as! HTTPURLResponse)
                        completion(ResourceResult.failure(error))
                    }
                } else {
                    completion(.failure(.system(optionalError!)))
                }
                
            }
        }
        task.resume()
    }
    
}
