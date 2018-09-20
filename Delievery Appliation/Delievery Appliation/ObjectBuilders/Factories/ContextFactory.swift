//
//  ContextFactory.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 19/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit
import CoreData

enum ContextType {
    case parent
    case mainQueue
    case privateQueue
}

struct ContextFacotry {
    static func makeContext(type : ContextType)->NSManagedObjectContext{
        var context : NSManagedObjectContext!
        switch type {
        case .parent:
           context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        case .mainQueue:
            context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        case .privateQueue:
            context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            
        }
        return context
    }
}
