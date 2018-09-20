//
//  DeliveryServices.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 19/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
typealias response  = ([DeliveryDTO], NetworkError?)->(Void)

protocol DeliveryServices{
    
    var networkManager : NetworkManager { get }
    var deliveryRepository : DeliveryRepository { get }
    
    func getDeliveries(request : DeliveryRequest, response : @escaping response)
   
}
