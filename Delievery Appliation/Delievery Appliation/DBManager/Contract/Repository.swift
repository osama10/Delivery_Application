//
//  Repository.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol Repository{
   
    associatedtype T
    

    
    func add(data : T)->Bool
    func update(data : T)->Bool
    func delete(data : T)->Bool
    func deleteAll()->Bool
    func get(by predicate : Predicate?)->[T]
    func getAll()->[T]
    func contains(data : T)->T?
}
