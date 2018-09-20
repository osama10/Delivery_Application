//
//  DeliveryListViewModelBuilder.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class DeliveryRepositoryBuilder{
    var dbManager : CoreDataManger!
    var entityName : String!
   
    func withDBManager(dbManager : CoreDataManger)->DeliveryRepositoryBuilder{
        self.dbManager = dbManager
        return self
    }
    
    func withEntityName(entityName : String)->DeliveryRepositoryBuilder{
        self.entityName = entityName
        return self
    }
    
    func build()->DeliveryRepository{
        return DeliveryRepository(dbManager: dbManager, entityName: entityName)
    }
}
