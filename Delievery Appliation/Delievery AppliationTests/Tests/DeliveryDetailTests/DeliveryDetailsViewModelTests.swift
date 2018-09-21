//
//  DeliveryDetailsViewModelTests.swift
//  Delievery AppliationTests
//
//  Created by Osama Bin Bashir on 21/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import XCTest
@testable import DeliveryApplication
import CoreLocation
class DeliveryDetailsViewModelTests: XCTestCase {
    
    var viewModel : DeliveryDetailViewModel!
    override func setUp() {
        super.setUp()
        let locationData = LocationDTO(lat: 2.0, lng: 2.0, address: "Hong kong")
        let deliveryData = DeliveryDTO(id: 1, description: "Deliver it to hong kong", imageUrl: "delivery", location: locationData)
        viewModel = DeliveryDetailViewModelImp(deleivery: deliveryData)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetDeliveryDetailListViewModelForType1() {
        let viewModel = self.viewModel.getDeliveryDetailListViewModel(of: 1)
        
        XCTAssert(viewModel.data.description == "Order Id : 1", "Description test of type 1 failed")
        XCTAssert(viewModel.data.type == .heading, "type test of type 1 failed")
        XCTAssert(viewModel.data.image == "order", "image test of type 1 failed")

    }
    
    func testGetDeliveryDetailListViewModelForType2() {
        let viewModel = self.viewModel.getDeliveryDetailListViewModel(of: 2)
        
        XCTAssert(viewModel.data.description == self.viewModel.deleivery.description!, "Description test of type 2 failed")
        XCTAssert(viewModel.data.type == .description, "type test of type 2 failed")
        XCTAssert(viewModel.data.image == "description", "image test of type 2 failed")
    }
    
    func testGetDeliveryDetailListViewModelForType3() {
        let viewModel = self.viewModel.getDeliveryDetailListViewModel(of: 3)
        
        XCTAssert(viewModel.data.description == self.viewModel.deleivery.location?.address!, "Description test of type 3 failed")
        XCTAssert(viewModel.data.type == .address, "type test of type 3 failed")
        XCTAssert(viewModel.data.image == "location", "image test of type 3 failed")
        
    }
    
    func testGetMapViewModel(){
        let viewModel = self.viewModel.getMapViewModel()
        let testLocation = CLLocationCoordinate2D(latitude: 2.0, longitude: 2.0)
      
        XCTAssert(viewModel.mapData.title == "Order Id : 1", "Title test failed")
        XCTAssert(viewModel.mapData.snippet == self.viewModel.deleivery.location?.address! , "Snippet test failed")
        XCTAssert(viewModel.mapData.position.latitude == testLocation.latitude , "latitude test failed")
        XCTAssert(viewModel.mapData.position.longitude == testLocation.longitude , "longitude test failed")
        XCTAssert(viewModel.mapData.zoom == 17.0, "zoom test failed")
        XCTAssert(viewModel.mapData.markerImage == "marker", "marker test failed")

    }
}
