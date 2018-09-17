//
//  LocationModel+CoreDataProperties.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//
//

import Foundation
import CoreData


extension LocationModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocationModel> {
        return NSFetchRequest<LocationModel>(entityName: "LocationModel")
    }

    @NSManaged public var lat: Double
    @NSManaged public var lng: Double
    @NSManaged public var address: String?

}
