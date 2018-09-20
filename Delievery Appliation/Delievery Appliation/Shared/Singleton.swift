//
//  Singleton.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 19/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import CoreData

struct Singleton {
    let networkManager : NetworkManager = AlamofireManager()
    let dbManager = CoreDataManger(context: ContextFacotry.makeContext(type: .parent))
    
   static var shared = {
        return Singleton()
    }()
    private init(){}
}
