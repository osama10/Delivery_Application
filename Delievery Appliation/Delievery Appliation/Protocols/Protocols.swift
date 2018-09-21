//
//  Protocols.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 18/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit


protocol Injectable {
    /**
     For injecting dependencies to ViewControllers .
     
     - T : Generic Param
     - inject : function recieves dependency
     */
    
    associatedtype T
    func inject(_: T)
}

protocol AlertsPresentable : class {     /**
     For Showing alert. It has a protocol extensions in extension file
     */
}


