//
//  Response.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ResponseMapper : class{
    associatedtype response
    static func map(data : Any)->[response]
}
