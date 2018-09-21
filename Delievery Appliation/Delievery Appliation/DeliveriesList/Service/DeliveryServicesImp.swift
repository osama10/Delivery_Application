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
                self.savingDelivierisHandler(deliveries: deliveries)
                response(deliveries, nil)
            case .error(let error):
                let deliveries = self.getDeliveriesFromLocalPersistance()
                response(deliveries, error)
            }
        }
    }
    
    func deleteAllDeliveries(){
        let _ = self.deliveryRepository.deleteAll()
    }
    
    func saveDeliveriesToLocalPersistence(deliveries : [DeliveryDTO]){
        deliveries.forEach { (delivery) in
            let _ = self.deliveryRepository.add(data: delivery)
        }
    }
    
    func getDeliveriesFromLocalPersistance() -> [DeliveryDTO] {
        return self.deliveryRepository.getAll()
    }
    
    func savingDelivierisHandler(deliveries : [DeliveryDTO]){
        if(deliveries.count > 0) {
            if(deliveries.first?.id == 0){
                self.deleteAllDeliveries()
            }
            self.saveDeliveriesToLocalPersistence(deliveries: deliveries)
        }
    }
}
