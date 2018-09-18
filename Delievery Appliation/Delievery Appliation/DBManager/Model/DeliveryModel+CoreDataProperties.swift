//
//  DeliveryModel+CoreDataProperties.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//
//

import Foundation
import CoreData


extension DeliveryModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeliveryModel> {
        return NSFetchRequest<DeliveryModel>(entityName: "DeliveryModel")
    }

    @NSManaged public var id: String?
    @NSManaged public var desc: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var location: LocationModel?

}
