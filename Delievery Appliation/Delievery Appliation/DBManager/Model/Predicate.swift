//
//  Predicate.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

struct Predicate{
    var format : String
    var arguments : [Any]
    init(format : String , arguments : [Any]) {
        self.format = format
        self.arguments = arguments
    }
}
