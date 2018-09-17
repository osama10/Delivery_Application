//
//  Delivery.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

struct Delivery : Mappable {
    var id : Int?
    var description : String?
    var imageUrl : String?
    var location : Location?
    
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        description <- map["description"]
        imageUrl <- map["imageUrl"]
        location <- map["location"]
    }
}
