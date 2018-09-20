//
//  DeliveryServices.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 19/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class DeliveryServicesImp : DeliveryServices{

    var networkManager: NetworkManager
    var deliveryRepository: DeliveryRepository
    
    init(networkManager : NetworkManager, deliveryRepository : DeliveryRepository) {
        self.networkManager = networkManager
        self.deliveryRepository = deliveryRepository
    }
    
    func getDeliveries(request: DeliveryRequest, response: @escaping response) {
        self.getDeliveriesFromServer(request: request, response: response)
    }
    
    
    func getDeliveriesFromServer(request : DeliveryRequest, response : @escaping response)
    {
        self.networkManager.request(request: request) {  [weak self] (result) in
            guard let `self` = self else { return }

            switch result{
            case .success(let data):
                let deliveries = DeliveryMapper.map(data: data)
                response(deliveries, nil)
            case .error(let error):
                let deliveries = self.getDeliveriesFromLocalPersistance()
                response(deliveries, error)
            }
            
        }
    }
    
    func getDeliveriesFromLocalPersistance() -> [DeliveryDTO] {
        return self.deliveryRepository.getAll()
    }
}
