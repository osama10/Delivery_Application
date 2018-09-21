//
//  DeliveryListViewModelTests.swift
//  DeliveryApplicationTests
//
//  Created by Osama Bin Bashir on 21/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import XCTest
@testable import DeliveryApplication

class DeliveryListViewModelTests: XCTestCase {
    
    var viewModel : DeliveryListViewModel!
    override func setUp() {
        super.setUp()
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetCellHeight() {
        let deliveryServices = MockSuccessDeliveryServices()
        viewModel = DeliveryListViewModelImp(deliveryService: deliveryServices)
       
        let locationData = LocationDTO(lat: 2.0, lng: 2.0, address: "Hong kong")
        let deliveryData1 = DeliveryDTO(id: 1, description: "Deliver it to hong kong", imageUrl: "delivery1", location: locationData)
        let deliveryData2 = DeliveryDTO(id: 2, description: "Deliver it to hong kong", imageUrl: "delivery2", location: locationData)
        let deliveryData3 = DeliveryDTO(id: 3, description: "Deliver it to hong kong", imageUrl: "delivery3", location: locationData)
        
        let deliveries = [deliveryData1, deliveryData2, deliveryData3]
        
        viewModel.deliveries = deliveries
        
        XCTAssert(viewModel.getCellHeight(of: 3) == 50 , "Cell height test case")
        XCTAssert(viewModel.getCellHeight(of: 1) == 100 , "Cell height test case")

    }
    
    func testGetShowMoreViewModel(){
        let deliveryServices = MockSuccessDeliveryServices()
        viewModel = DeliveryListViewModelImp(deliveryService: deliveryServices)
        let showMoreViewModel = viewModel.getShowMoreViewModel()
       
        XCTAssert(showMoreViewModel.labelText == "Show More Deliveries"  , "Show More test failed")
        XCTAssert(showMoreViewModel.fontSize == 15.0 , "Show More test failed")
        
    }
    
    func testGetDeliveryDetailViewModel(){
        let deliveryServices = MockSuccessDeliveryServices()
        viewModel = DeliveryListViewModelImp(deliveryService: deliveryServices)
        
        let locationData = LocationDTO(lat: 2.0, lng: 2.0, address: "Hong kong")
        let deliveryData = DeliveryDTO(id: 1, description: "Deliver it to hong kong", imageUrl: "delivery1", location: locationData)

        let deliveryDetailViewModel = viewModel.getDeliveryDetailViewModel(with: deliveryData )
        
        XCTAssert(deliveryDetailViewModel.deleivery.id == 1, "GetDeliveryViewModel test failed")
        XCTAssert(deliveryDetailViewModel.deleivery.description == "Deliver it to hong kong", "GetDeliveryViewModel test failed")
        XCTAssert(deliveryDetailViewModel.deleivery.imageUrl == "delivery1", "GetDeliveryViewModel test failed")
        XCTAssert(deliveryDetailViewModel.deleivery.location?.lat == locationData.lat, "GetDeliveryViewModel test failed")
        XCTAssert(deliveryDetailViewModel.deleivery.location?.lng == locationData.lng, "GetDeliveryViewModel test failed")
        XCTAssert(deliveryDetailViewModel.deleivery.location?.address == locationData.address, "GetDeliveryViewModel test failed")

    }
    
    func testGetDeliveryListCellViewModel(){
        let deliveryServices = MockSuccessDeliveryServices()
        viewModel = DeliveryListViewModelImp(deliveryService: deliveryServices)
        
        let locationData = LocationDTO(lat: 2.0, lng: 2.0, address: "Hong kong")
        let deliveryData1 = DeliveryDTO(id: 1, description: "Deliver it to hong kong", imageUrl: "delivery1", location: locationData)
        let deliveryData2 = DeliveryDTO(id: 2, description: "Deliver it to hong kong", imageUrl: "delivery2", location: locationData)
        let deliveryData3 = DeliveryDTO(id: 3, description: "Deliver it to hong kong", imageUrl: "delivery3", location: locationData)
        
        let deliveries = [deliveryData1, deliveryData2, deliveryData3]
        
        viewModel.deliveries = deliveries
       
        let deliveryListViewModel = viewModel.getDeliveryListCellViewModel(of: 0)
        
        XCTAssert(deliveryListViewModel.delivery.id == 1, "GetDeliveryViewModel test failed")
        XCTAssert(deliveryListViewModel.delivery.description == "Deliver it to hong kong", "GetDeliveryViewModel test failed")
        XCTAssert(deliveryListViewModel.delivery.imageUrl == "delivery1", "GetDeliveryViewModel test failed")
        XCTAssert(deliveryListViewModel.delivery.location?.lat == locationData.lat, "GetDeliveryViewModel test failed")
        XCTAssert(deliveryListViewModel.delivery.location?.lng == locationData.lng, "GetDeliveryViewModel test failed")
        XCTAssert(deliveryListViewModel.delivery.location?.address == locationData.address, "GetDeliveryViewModel test failed")
        
    }
    
    func testGetDeliveriesSuccess(){
        let deliveryServices = MockSuccessDeliveryServices()
        viewModel = DeliveryListViewModelImp(deliveryService: deliveryServices)
        viewModel.deliveries = []
        viewModel.getDeliveries()
        
        XCTAssert(viewModel.deliveries?.count == 3,"GetDeliveries Success case failed")

    }
    
    func testGetDeliveriesFailure(){
        let deliveryServices = MockFailureDeliveryServices()
        viewModel = DeliveryListViewModelImp(deliveryService: deliveryServices)
       
        let locationData = LocationDTO(lat: 2.0, lng: 2.0, address: "Hong kong")
        let deliveryData1 = DeliveryDTO(id: 1, description: "Deliver it to hong kong", imageUrl: "delivery1", location: locationData)
        let deliveryData2 = DeliveryDTO(id: 2, description: "Deliver it to hong kong", imageUrl: "delivery2", location: locationData)
        let deliveryData3 = DeliveryDTO(id: 3, description: "Deliver it to hong kong", imageUrl: "delivery3", location: locationData)
        
        let deliveries = [deliveryData1, deliveryData2, deliveryData3]
        viewModel.deliveries = deliveries
        
        viewModel.getDeliveries()
        XCTAssert(viewModel.deliveries?.count == 0,"GetDeliveries Failure case failed")
    }
    
    func testRefreshData(){
        let deliveryServices = MockSuccessDeliveryServices()
      
        viewModel = DeliveryListViewModelImp(deliveryService: deliveryServices)
        
        viewModel.refreshData()
        XCTAssert(viewModel.deliveries?.count == 3,"RefreshData case failed")

        
    }
}
