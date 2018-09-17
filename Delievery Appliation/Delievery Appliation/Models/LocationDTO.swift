//
//  LocationModel.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

struct LocationDTO : Mappable {
    var lat : Double?
    var lng : Double?
    var address : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        lat <- map["lat"]
        lng <- map["lng"]
        address <- map["address"]
    }
}
