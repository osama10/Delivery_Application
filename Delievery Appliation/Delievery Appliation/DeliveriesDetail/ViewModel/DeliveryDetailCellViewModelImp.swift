//
//  DeliveryDetailCellViewModelImp.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class DeliveryDetailCellViewModelImp : DeliveryDetailCellViewModel{
    var data: DetailViewListModel
    
    init(data : DetailViewListModel) {
        self.data = data
    }
}
