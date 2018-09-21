//
//  DeliveryListTableCellViewModel.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 19/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol DeliveryListTableCellViewModel {
    var delivery : DeliveryDTO { get }
    var fontSize : Double { get }

}
