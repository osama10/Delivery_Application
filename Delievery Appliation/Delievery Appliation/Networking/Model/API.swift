//
//  API.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

import Foundation

public struct API {
    let baseURL: BaseURL
    let path: [String]
    
    public init(baseURL: BaseURL, path: [String] = []) {
        self.baseURL = baseURL
        self.path = path
    }
    
    public var url: URL {
        var components = URLComponents()
        components.scheme = self.baseURL.scheme
        components.host = self.baseURL.host
        components.port = self.baseURL.port
        components.path = "/" + self.path.joined(separator: "/")
        
        return components.url!
    }
}
