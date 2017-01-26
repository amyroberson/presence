//
//  DataURL.swift
//  Presence
//
//  Created by Amy Roberson on 1/25/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation



internal struct DataURL {
    internal enum Error: Swift.Error {
        case invalidJSONData
    }
    
    internal static let baseURL: URL = URL(string: "https://reece-tiy-library.herokuapp.com")!
    
    //will have different appendins file names per request depending on request type
    
    
}
