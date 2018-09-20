//
//  DeliveryListViewModel.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 19/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol DeliveryListViewModel {
    
    var deliveryService : DeliveryServices{ get }
    var totalRows : Int{ get }
    var rowHeight : Double{ get }
    var title : String { get }
    var deliveries : [DeliveryDTO]?{ get set }
    
    var animateLoader : ((Bool)->())?{ get set }
    var showAlert : ((String, String)->())?{ get set }
    var refreshData : (()->())?{ get set}
    var showDetailView : ((DeliveryDTO)->())? { get set}
    
    func didTapOnList(at index : Int)
    func getDeliveries()
    func didTapOnShowMore()
    func getDeliveryListCellViewModel(of index : Int)->DeliveryListTableCellViewModelImp
}
