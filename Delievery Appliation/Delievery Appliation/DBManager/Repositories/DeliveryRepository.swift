//
//  DeliveryRepository.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 18/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import CoreData

class DeliveryRepository :  Repository{
   
    var dbManager : CoreDataManger
    var entityName : String
   
    required init(dbManager : CoreDataManger, entityName : String) {
        self.dbManager = dbManager
        self.entityName = entityName
    }
   
    func add(data: DeliveryDTO)->Bool{
        let dataModel = DeliveryModel(delivery: data , context: dbManager.context)
        return dbManager.save(dataModel, entityName)
    }
    
    func update(data: DeliveryDTO)->Bool{
        let format = "%k == %@"
        let arguments : [Any] = ["uid" , String(data.id!)]
        let predicate = Predicate(format: format, arguments: arguments)
        var result = false
       
        if let dataModel = dbManager.doesThisObjectExist(entityName, predicate: predicate) as? DeliveryModel {
            dataModel.id = data.id!.toString
            dataModel.desc = data.description!
            dataModel.imageUrl = data.imageUrl!
            dataModel.location = LocationModel(location: data.location!, context: dbManager.context)
            result = dbManager.save(dataModel, entityName)
        }
        
        return result
    }
    
    func delete(data: DeliveryDTO)->Bool{
        let format = "%k == %@"
        let arguments : [Any] = ["uid" , String(data.id!)]
        let predicate = Predicate(format: format, arguments: arguments)
        
        return dbManager.deleteObjects(entityName, predicate: predicate)

    }
    
    func deleteAll()->Bool{
        return dbManager.deleteObjects(entityName)
    }
    
    func get(by predicate: Predicate? = nil)->[DeliveryDTO]{
        var deliveries = [DeliveryDTO]()
        
        if let data = dbManager.fetchObject(entityName, predicate: predicate) as? [DeliveryModel]{
            data.forEach { (delivery) in
                
                let locationDTO = LocationDTO(lat: (delivery.location?.lat)!,
                                           lng: (delivery.location?.lng)!,
                                           address: (delivery.location?.address)!
                )
                
                let deliveryDTO = DeliveryDTO(id: delivery.id!.toInt, description: delivery.desc!, imageUrl: delivery.imageUrl!, location: locationDTO)
                
                deliveries.append(deliveryDTO)
            }
        }
        return deliveries
    }
    
    func getAll()->[DeliveryDTO]{
        return self.get()
    }
    
    func contains(data: DeliveryDTO)->DeliveryDTO?{
        let format = "%k == %@"
        let arguments : [Any] = ["uid" , String(data.id!)]
        let predicate = Predicate(format: format, arguments: arguments)
        var deliveryDTO : DeliveryDTO?
        
        if let dataModel = dbManager.doesThisObjectExist(entityName, predicate: predicate) as? DeliveryModel {
            
            let locationDTO = LocationDTO(lat: (dataModel.location?.lat)!,
                                          lng: (dataModel.location?.lng)!,
                                          address: (dataModel.location?.address)!
            )
            
            deliveryDTO = DeliveryDTO(id: dataModel.id!.toInt, description: dataModel.desc!, imageUrl: dataModel.imageUrl!, location: locationDTO)
            
        }
        return deliveryDTO

    }
    
}


