//
//  RequestProvider.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

import Foundation
import ObjectMapper

public protocol RequestProvider {
    typealias Response = Any
    var request: Request{ get }
}
