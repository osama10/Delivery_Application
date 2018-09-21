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
    var totalRows: Int { return self.calculateTotalRows() }
    var title: String{ return "Delivery List" }
    var offset = 0
    var limit = 20
    var doesAllDeliveriesAreFetched = false
    var isRefreshed = false
    
    var animateLoader: ((Bool) -> ())?
    var showAlert: ((String, String) -> ())?
    var populateData: (() -> ())?
    var showDetailView: ((DeliveryDTO) -> ())?
    
    init(deliveryService : DeliveryServices) {
        self.deliveryService = deliveryService
    }
    
    func didTapOnList(at index: Int) {
        (index == deliveries?.count) ? self.didTapOnShowMore() : self.showDetailView?(deliveries![index])
    }
    
    func getCellHeight(of index: Int) -> Double {
        return (index == deliveries!.count) ? 50 : 100
    }
    
    func getDeliveries() {
        let request = DeliveryRequest(offset: offset, limit: limit)
        self.animateLoader?(true)
        self.makeRequest(request: request)
    }
    
    func refreshData() {
        isRefreshed = true
        offset = 0
        let request = DeliveryRequest(offset: offset, limit: limit)
        makeRequest(request: request)
    }
    
    func didTapOnShowMore() {
        self.getDeliveries()
    }
    
    func getDeliveryListCellViewModel(of index: Int) -> DeliveryListTableCellViewModel {
        let viewModel = DeliveryListTableCellViewModelImp(delivery: deliveries![index])
        return viewModel
    }
    
    func getShowMoreViewModel() -> ShowMoreViewModel {
        let viewModel = ShowMoreViewModelImp(labelText: "Show More Deliveries")
        return viewModel
    }
    
    func getDeliveryDetailViewModel(with data : DeliveryDTO)->DeliveryDetailViewModel{
        let viewModel = DeliveryDetailViewModelImp(deleivery: data)
        return viewModel
    }
    
    func showAlert(errorType : NetworkError){
        var title = ""
        var message = ""
        switch errorType {
        case .internetError( _):
            title = "Network Error"
            message = "Internet not found. Showing last fetched deliveries"
        default:
            title = "Deliveries fetching failed"
            message = "Something bad happened . Showing last fetched deliveries"
        }
        
        self.showAlert?(title,message)
    }
    
    private func makeRequest(request : DeliveryRequest){
        
        self.deliveryService.getDeliveries(request: request) { [weak self] (data, error) -> (Void) in
            guard let `self` = self else { return }
            self.responseHandler(data: data, error: error)
            self.populateData?()
            self.animateLoader?(false)
        }
    }
    
    
    private func calculateTotalRows()->Int{
        var totalRows = 0
        if let deliveries = self.deliveries {
            totalRows = (doesAllDeliveriesAreFetched) ? deliveries.count : deliveries.count + 1
        }
        return totalRows
    }
    
    private func responseHandler(data : [DeliveryDTO], error : NetworkError?){
        if(error != nil){
            self.handleErrorCase(data: data, error: error!)
        }else if(isRefreshed){
            self.handlePullToRefreshCase(data: data)
        }else{
            self.handleSuccesfullRequestCase(data: data)
        }
    }
    
    private func handleErrorCase(data : [DeliveryDTO], error : NetworkError){
        self.showAlert(errorType: error)
        self.deliveries = data
    }
    
    private func handlePullToRefreshCase(data : [DeliveryDTO]){
        isRefreshed = false
        doesAllDeliveriesAreFetched = false
        deliveries?.removeAll()
        deliveries = data
        offset += 20
    }
    
    private func handleSuccesfullRequestCase(data : [DeliveryDTO]){
        if(data.count == 0 || data.count % 20 > 0){
            doesAllDeliveriesAreFetched = true
        }else{
            offset += 20
        }
        (deliveries == nil) ? deliveries = data : deliveries?.append(contentsOf: data)
    }
}


