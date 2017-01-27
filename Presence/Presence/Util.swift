//
//  Util.swift
//  Presence
//
//  Created by Amy Roberson on 1/26/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

enum ResourceResult<A> {
    case success(A)
    case failure(Resource)
}

enum Resource: Swift.Error{
    case http(HTTPURLResponse)
    case system(Swift.Error)
    case API(Util.Error)
}

struct Util {
    
    internal enum Error: Swift.Error {
        case invalidJSONData
    }
    
    //universal processor
    static func processResources<A>(data: Data, parse: ([String: Any]) -> A?) -> ResourceResult<[A]> {
        if let dictionary = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
            let objects = dictionary.flatMap(parse)
            return .success(objects)
            
        } else {
            return .failure(.API(.invalidJSONData))
        }
    }
    
    static func processResource<A>(data: Data, parse: ([String: Any]) -> A?) -> ResourceResult<A> {
        if let dictionary = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any],
            let object = parse(dictionary) {
                return ResourceResult<A>.success(object)
            
        } else {
            return .failure(.API(.invalidJSONData))
        }
    }
    
    static func toJson(dictionaryArray: [[String: Any]]) throws -> Data{
        let jsonRepresentation = try JSONSerialization.data(withJSONObject: dictionaryArray, options: [])
        return jsonRepresentation
    }
    
    static func toJson(dictionary: [String: Any]) throws -> Data{
        let jsonRepresentation = try JSONSerialization.data(withJSONObject: dictionary, options: [])
        return jsonRepresentation
    }
}
