//
//  Request.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

import Foundation

public typealias Params = [String: String]
public typealias Headers = [String: String]

public struct Request{
    var api: API
    var method: HTTPMethods = .get
    var headers: Headers?
    var params : Params? = nil
    
    init(api : API, method : HTTPMethods, headers : Headers? = nil, params : Params? = nil) {
        self.api = api
        self.method = method
        self.headers = headers
        self.params = params
    }
}

enum HTTPMethods : String {
    case get = "GET"
    case post = "POST"
}
