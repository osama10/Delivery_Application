//
//  DeliveryModel+CoreDataClass.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//
//

import Foundation
import CoreData

@objc(DeliveryModel)
public class DeliveryModel: NSManagedObject {
   
    @objc
    private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    init(context : NSManagedObjectContext ) {
        let entityDesc = NSEntityDescription.entity(forEntityName: "DeliveryModel", in: context)
        super.init(entity: entityDesc!, insertInto: context)
    }
    
    init(delivery : DeliveryDTO , context : NSManagedObjectContext){
        
        let entityDesc = NSEntityDescription.entity(forEntityName: "DeliveryModel", in: context)
        super.init(entity: entityDesc!, insertInto: context)
        
        self.id = String(delivery.id!)
        self.desc = delivery.description
        self.imageUrl = delivery.imageUrl
        self.location = LocationModel(location: delivery.location!, context: context)
        
        
    }
}
