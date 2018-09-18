//
//  Extensions.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 18/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

extension Int{
    var toString: String{
        return String(self)
    }
    
    var toDouble : Double{
        return Double(self)
    }
}

extension Double{
    var toString: String{
        return String(self)
    }
    
    var toInt : Int{
        return Int(self)
    }
}

extension String {
    var toDouble : Double{
        return Double(self) ?? 0.0
    }
    
    var toInt : Int{
        return Int(self) ?? 0
    }
}
