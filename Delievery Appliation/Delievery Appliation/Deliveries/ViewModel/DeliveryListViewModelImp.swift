//
//  DeliveryListViewModel.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 19/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
class DeliveryListViewModelImp : DeliveryListViewModel {
    
    var deliveryService: DeliveryServices
    var deliveries: [DeliveryDTO]?
    var totalRows: Int {
        return deliveries?.count ?? 0
    }
    var rowHeight: Double {
        return 100
    }
    
    var title: String{
        return "Delivery List"
    }
    var offset = 0
    var limit = 20
    
    
    var animateLoader: ((Bool) -> ())?
    var showAlert: ((String, String) -> ())?
    var refreshData: (() -> ())?
    var showDetailView: ((DeliveryDTO) -> ())?
    
    init(deliveryService : DeliveryServices) {
        self.deliveryService = deliveryService
    }
    
    func didTapOnList(at index: Int) {
        self.showDetailView?(deliveries![index])
    }
    
    func getDeliveries() {
        let request = DeliveryRequest(offset: offset, limit: limit)
        self.animateLoader?(true)
        self.deliveryService.getDeliveries(request: request) { [weak self] (data, error) -> (Void) in
            guard let `self` = self else { return }
            self.deliveries = data
            self.refreshData?()
            self.animateLoader?(false)
            if(error != nil){ self.showAlert(errorType: error!) }
        }
    }
    
    func didTapOnShowMore() {
        
    }
    
    func getDeliveryListCellViewModel(of index: Int) -> DeliveryListTableCellViewModelImp {
        let viewModel = DeliveryListTableCellViewModelImp(delivery: deliveries![index])
        return viewModel
    }
    
    func showAlert(errorType : NetworkError){
        var title = ""
        var message = ""
        switch errorType {
        case .internetError( _):
            title = "Network Error"
            message = "Internet not found"
        default:
            title = "Error"
            message = "Deliveries request failed"
        }
        
        self.showAlert?(title,message)
    }
}

