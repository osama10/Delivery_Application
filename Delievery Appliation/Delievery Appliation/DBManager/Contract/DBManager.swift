//
//  File.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol DBManager {
   
    associatedtype T
    associatedtype E
   
    func save( _ : T , _ : E )->Bool
    func fetchObject( _ : E ,  predicate : Predicate? )->[T]?
    func deleteObjects( _ : E ,  predicate : Predicate? )->Bool
    func doesThisObjectExist(_ : E ,  predicate : Predicate)->T?
}
