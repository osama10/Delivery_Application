//
//  DeliveryResponse.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

class DeliveryResponse : Response {
    
    var data: Any
    init(data : Any) {
        self.data = data
    }
    func map() -> [Mappable] {
        let deleiveryJSON = self.data as! [[String : AnyObject]]
        let data = Mapper<DeliveryDTO>().mapArray(JSONArray: deleiveryJSON)
        print("count : \(data.count)")
        return data
    }
    
}
