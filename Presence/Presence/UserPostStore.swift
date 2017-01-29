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
    
    init(endpoint: APIURL.EndPoint?){
        request = URLRequest(url: APIURL().fullURL(endPoint: (endpoint)!))
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData // should this change?
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }
    
    
    internal func pushPostRegister(json: Data, completion: @escaping (ResourceResult<Any>) -> ()) {
        request.httpBody = json
        let task = session.dataTask(with: request) {(optionalData, optionalResponse, optionalError) in
            if let data = optionalData {
                completion(Util.processResource(data: data, parse: User.init))
            } else if let response = optionalResponse {
                let error = Resource.http(response as! HTTPURLResponse)
                completion(ResourceResult.failure(error))
            } else {
                completion(.failure(.system(optionalError!)))
            }
        }
        task.resume()
    }
    
    /*internal func fetchUsers(completion: @escaping (ResourceResult<[Any]>) -> ()) {
        let task = session.dataTask(with: APIURL().fullURL(endPoint: .getUser)) {
            (optionalData, optionalResponse, optionalError) in
            
            if let data = optionalData {
                completion(Util.processResources(data: data, parse: User.init))
            } else if let response = optionalResponse {
                let error = Resource.http(response as! HTTPURLResponse)
                completion(ResourceResult.failure(error))
            } else {
                completion(.failure(.system(optionalError!)))
            }
        }
        task.resume()
    }*/
    
    func fetchContactsForUser(json:Data,  completion: @escaping (ResourceResult<[Any]>) -> ()) {
        request.httpBody = json
        let task = session.dataTask(with: request) {(optionalData, optionalResponse, optionalError) in
            if let data = optionalData {
                completion(Util.processResources(data: data, parse: User.init))
            } else if let response = optionalResponse {
                let error = Resource.http(response as! HTTPURLResponse)
                completion(ResourceResult.failure(error))
            } else {
                completion(.failure(.system(optionalError!)))
            }
        }
        task.resume()
    }
    
    
    func postUserLogin(json: Data, completion: @escaping (ResourceResult<Any>) -> ()) {
        request.httpBody = json
        let task = session.dataTask(with: request) {(optionalData, optionalResponse, optionalError) in
            if let data = optionalData {
                completion(Util.processResource(data: data, parse: User.init))
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
