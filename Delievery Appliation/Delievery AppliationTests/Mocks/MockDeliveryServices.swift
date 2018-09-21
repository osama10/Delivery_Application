//
//  MockDeliveryServices.swift
//  DeliveryApplication
//
//  Created by Osama Bin Bashir on 21/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class MockSuccessDeliveryServices : DeliveryServices{
    var networkManager: NetworkManager
    
    var deliveryRepository: DeliveryRepository
    
    init(deliveryRepository : DeliveryRepository, networkManager : NetworkManager) {
        self.deliveryRepository = deliveryRepository
        self.networkManager = networkManager
    }
    
    func getDeliveries(request: DeliveryRequest, response: @escaping response) {
        let locationData = LocationDTO(lat: 2.0, lng: 2.0, address: "Hong kong")
      
        let deliveryData1 = DeliveryDTO(id: 1, description: "Deliver it to hong kong", imageUrl: "delivery1", location: locationData)
        let deliveryData2 = DeliveryDTO(id: 2, description: "Deliver it to hong kong", imageUrl: "delivery2", location: locationData)
        let deliveryData3 = DeliveryDTO(id: 3, description: "Deliver it to hong kong", imageUrl: "delivery3", location: locationData)
        let mockData = [deliveryData1, deliveryData2, deliveryData3]
        
        response(mockData, nil)
    }
    
    
}
