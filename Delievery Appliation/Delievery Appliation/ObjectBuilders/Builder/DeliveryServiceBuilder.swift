//
//  DeliveryServiceBuilder.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class DeliveryServiceBuilder{
    var networkManager : NetworkManager!
    var deliveryRepository : DeliveryRepository!
    
    func withNetworkManager(networkManager : NetworkManager)->DeliveryServiceBuilder{
        self.networkManager = networkManager
        return self
    }
    
    func withDeliveryRepository(deliveryRepository : DeliveryRepository)->DeliveryServiceBuilder{
        self.deliveryRepository = deliveryRepository
        return self
    }
    
    func build() -> DeliveryServices {
        return DeliveryServicesImp(networkManager: self.networkManager, deliveryRepository: self.deliveryRepository)
    }
}
