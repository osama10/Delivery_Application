//
//  DeliveryListTableCellViewModelImp.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 19/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

struct DeliveryListTableCellViewModelImp : DeliveryListTableCellViewModel {
    var delivery: DeliveryDTO
    
    init(delivery : DeliveryDTO) {
        self.delivery = delivery
    }
}
