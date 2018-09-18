//
//  LocationModel+CoreDataClass.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//
//

import Foundation
import CoreData

@objc(LocationModel)
public class LocationModel: NSManagedObject {
    
    init(context : NSManagedObjectContext ) {
        let entityDesc = NSEntityDescription.entity(forEntityName: "LocationModel", in: context)
        super.init(entity: entityDesc!, insertInto: context)
    }
    
    init(location : LocationDTO , context : NSManagedObjectContext){
        let entityDesc = NSEntityDescription.entity(forEntityName: "LocationModel", in: context)
        super.init(entity: entityDesc!, insertInto: context)
        
        self.lat = location.lat!
        self.lng = location.lng!
        self.address = location.address
       
    }
}
