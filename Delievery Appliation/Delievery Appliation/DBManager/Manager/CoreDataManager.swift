//
//  CoreDataManager.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 18/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManger{
    
    var context : NSManagedObjectContext!
    
    init(context : NSManagedObjectContext) {
        self.context = context
    }
    
    func save(_ object : NSManagedObject ,  _ entity : String )->Bool{
        var objectSaved = true
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                objectSaved = false
                print("CD - save object error occured")
            }
        }
        return objectSaved
    }
    
    func fetchObject(_ entity : String ,  predicate : Predicate? = nil)->[NSManagedObject]?{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        var data : [NSManagedObject]?
        if(predicate != nil){
            fetchRequest.predicate = NSPredicate(format: predicate!.format, argumentArray: predicate!.arguments)
        }
        do{
            data = try context.fetch(fetchRequest) as? [NSManagedObject]
        }catch{
            print("CD - fetch object error occured")
        }
        return data
    }
    
    func deleteObjects(_ entity : String ,  predicate : Predicate? = nil)->Bool{
        let data = self.fetchObject(entity, predicate: predicate)
        var result = false
        
        if let dataToDelete = data {
            dataToDelete.forEach({ (_data) in
                context.delete(_data)
            })
            do {
                try context.save()
                result = true
            }catch{
                print("CD - delete object error occured")
            }
        }
        return result
    }
    
    func doesThisObjectExist(_ entity : String ,  predicate : Predicate)->NSManagedObject?{
        let data = self.fetchObject(entity, predicate: predicate)
        var object : NSManagedObject? = nil
        if let _data = data {
            object = (_data.count <= 0) ? data?.first : nil
        }
        return object
    }
}



