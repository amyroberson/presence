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
    var request: URLRequest? = nil
    var endpoint:APIURL.EndPoint
    
    init(endpoint: APIURL.EndPoint){
        self.endpoint = endpoint
    }
    
    internal func fetchRequestsForUser(json: Data, completion: @escaping (ResourceResult<[Request]>) -> ()) {
        request = URLRequest(url: APIURL().fullURL(endPoint: endpoint))
        if var request = request {
            request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            request.httpMethod = "GET"
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
    }
    
    
    
    //func postAcceptRequest(
    
    //func postRejectRequest()
    
    //func postReactivateRequest()
    
    func postCreateRequest(json: Data, completion: @escaping (ResourceResult<Void>) -> ()) {
        request = URLRequest(url: APIURL().fullURL(endPoint: .createRequest))
        if var request = request{
            request.httpBody = json
            request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            request.httpMethod = "POST"
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            let task = session.dataTask(with: request) {(optionalData, optionalResponse, optionalError) in
                if let data = optionalData {
                    completion(Util.processBool(data: data))
                } else if let response = optionalResponse {
                    let error = Resource.http(response as! HTTPURLResponse)
                    completion(ResourceResult.failure(error))
                    
                } else {
                    completion(.failure(.system(optionalError!)))
                }
            }
            task.resume()
        }
    }
    
}
