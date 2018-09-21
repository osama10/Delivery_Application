//
//  MockDeliveryRepository.swift
//  DeliveryApplication
//
//  Created by Osama Bin Bashir on 21/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class MockDeliveryRepository : DeliveryRepository{
 
    var dataAdded = false
    var dataDeleted = false
    var getAllCalled = false
 
    required init(dbManager: CoreDataManger, entityName: String) {
        super.init(dbManager: Singleton.shared.dbManager, entityName: "DeliveryModel")
    }
    init() {  super.init(dbManager: Singleton.shared.dbManager, entityName: "DeliveryModel") }
    override func add(data: DeliveryDTO)->Bool{
        dataAdded = true
        return true
    }
    
    override func deleteAll()->Bool{
        dataDeleted = true
        return true
    }
    
    override func getAll()->[DeliveryDTO]{
        let locationData = LocationDTO(lat: 2.0, lng: 2.0, address: "Hong kong")
        let deliveryData1 = DeliveryDTO(id: 1, description: "Deliver it to hong kong", imageUrl: "delivery1", location: locationData)
        let deliveryData2 = DeliveryDTO(id: 2, description: "Deliver it to hong kong", imageUrl: "delivery2", location: locationData)
        let deliveryData3 = DeliveryDTO(id: 3, description: "Deliver it to hong kong", imageUrl: "delivery3", location: locationData)
        getAllCalled = true
        let mockData = [deliveryData1, deliveryData2, deliveryData3]
        return mockData
    }
    
   
}
