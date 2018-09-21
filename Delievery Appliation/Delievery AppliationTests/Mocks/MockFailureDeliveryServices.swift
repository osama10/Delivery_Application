//
//  MockFailureDeliveryServices.swift
//  DeliveryApplication
//
//  Created by Osama Bin Bashir on 21/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class MockFailureDeliveryServices : DeliveryServices{
    var networkManager: NetworkManager
    
    var deliveryRepository: DeliveryRepository
    
    init(){
        self.deliveryRepository = MockDeliveryRepository()
        self.networkManager = MockSuccessNetworkManager()
    }
    
    func getDeliveries(request: DeliveryRequest, response: @escaping response) {
        response([], NetworkError.requestCreation)
    }
    
    
}
