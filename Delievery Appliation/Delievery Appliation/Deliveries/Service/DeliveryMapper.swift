//
//  DeliveryMapper.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 19/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

class DeliveryMapper : ResponseMapper{
    class func map(data: Any) -> [DeliveryDTO] {
        let deleiveryJSON = data as! [[String : AnyObject]]
        let data = Mapper<DeliveryDTO>().mapArray(JSONArray: deleiveryJSON)
        return data
    }
}
