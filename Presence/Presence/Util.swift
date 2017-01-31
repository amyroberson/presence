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
    case sucess(Bool)
    case failure(Resource)
    
    /*var innerType: Any? {
        switch self{
        case .success(let object):
            return object
        case .failure(let object):
            return object
        default:
            return nil
        }
    }*/
    
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
    
    
    
    static func processBool(data: Data) -> ResourceResult<Void> {
        if let dictionary = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any],
            let success = dictionary["success"] as? Bool,
            success == true {
            return .success(())
        } else {
            return .failure(.API(.invalidJSONData))
        }
        
    }
    
    //universal processors
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
    
    private static var dateFormatter: DateFormatter?
    
    static func getDateFormatter() -> DateFormatter {
        
        if dateFormatter == nil {
            dateFormatter = DateFormatter()
            dateFormatter?.dateStyle = .long
            dateFormatter?.timeStyle = .long
            dateFormatter?.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter?.dateFormat = "MM-dd-yyyy hh:mm"
            dateFormatter?.timeZone = TimeZone(secondsFromGMT: 0)
        }
        
        return dateFormatter!
    }
    
}

extension Date {
    public func toString() -> String {
        let formatter = Util.getDateFormatter()
        return formatter.string(from: self)
    }
}

