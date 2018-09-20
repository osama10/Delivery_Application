//
//  DeliveryDetailViewModel.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol DeliveryDetailViewModel {
    
    var totalRows : Int { get }
    var deleivery : DeliveryDTO { get }
    var title : String{ get }
    
    func getDeliveryDetailListViewModel(of index : Int)->DeliveryDetailCellViewModel
    func getMapViewModel()->MapViewCellViewModel
}
