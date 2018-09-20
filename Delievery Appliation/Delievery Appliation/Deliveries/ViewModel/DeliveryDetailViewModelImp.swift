//
//  DeliveryDetailViewModelImp.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class DeliveryDetailViewModelImp: DeliveryDetailViewModel {
    var totalRows: Int{
        return 4
    }
    
    var deleivery: DeliveryDTO
    var title : String{
        return "Delivery Details"
    }
    init(deleivery : DeliveryDTO) {
        self.deleivery = deleivery
    }
    
    func getDeliveryDetailListViewModel(of index: Int) -> DeliveryDetailCellViewModel {
        let cellType = DetailViewListType(rawValue: index)
        let data = DetailViewListModelBuilder()
                    .withDescription(description: getDeliveryDetailListModelDescription(type: cellType!))
                    .withType(type: cellType!)
                    .withImage(of: cellType!)
                    .build()
        let viewModel = DeliveryDetailCellViewModelImp(data: data)
        return viewModel
    }
    
    func getDeliveryDetailListModelDescription(type : DetailViewListType)->String{
        var desc = ""
        switch type {
        case .heading:
            desc = "Order Id : \(self.deleivery.id!)"
        case .description:
            desc = self.deleivery.description!
        case .address:
            desc = (self.deleivery.location?.address!)!
        }
        
        return desc
    }
    
    func getMapViewModel() -> MapViewCellViewModel {
        let data = MapModelBuilder()
            .withTitle(title: "Order ID : \(self.deleivery.id!)")
            .withSnippet(snippet: (self.deleivery.location?.address)!)
            .withPosition(lat: (self.deleivery.location?.lat!)!, lng: (self.deleivery.location?.lng!)!)
            .withZoom(zoom: 17.0)
            .withMarkerImage(markerImage: "marker")
            .build()
        
        let viewModel = MapViewCellViewModelImp(mapData: data)
        return viewModel
    }
    
}
