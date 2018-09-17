//
//  DeliveryRequest.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class  DeliveryRequest {
    let offset : Int
    let limit : Int
    
    init(offset : Int, limit : Int) {
        self.offset = offset
        self.limit = limit
    }
}

extension DeliveryRequest : RequestProvider{
    
    var request: Request{
        return Request(api: .deliveries,
                       method: .get,
                       params: ["offset" : "\(offset)", "limit" : "\(limit)"]
        )
    }
    
    
}
