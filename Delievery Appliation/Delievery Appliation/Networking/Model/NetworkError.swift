//
//  NetworkError.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case requestCreation
    case server(Error)
    case internetError(String)
}
