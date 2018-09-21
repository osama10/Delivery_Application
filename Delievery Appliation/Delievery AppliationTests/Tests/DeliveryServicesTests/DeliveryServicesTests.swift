//
//  DeliveryServicesTests.swift
//  DeliveryApplicationTests
//
//  Created by Osama Bin Bashir on 21/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import XCTest
@testable import DeliveryApplication

class DeliveryServicesTests: XCTestCase {
    
    var deliveryService : DeliveryServices!
    var data : [DeliveryDTO]!
    var mockRequest : DeliveryRequest!

    override func setUp() {
        super.setUp()
        data = []
        mockRequest = DeliveryRequest(offset: 0, limit: 20)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetDeliveriesFromServerSuccess() {
        let networkManger : NetworkManager = MockSuccessNetworkManager()
        let deliveryRepository  = MockDeliveryRepository()
       
        deliveryService = DeliveryServiceBuilder()
            .withNetworkManager(networkManager: networkManger)
            .withDeliveryRepository(deliveryRepository: deliveryRepository)
            .build()
       
        deliveryService.getDeliveries(request: mockRequest) { [weak self](response, error) -> (Void) in
            guard let `self` = self else { return }
            self.data = response
        }
        XCTAssert(data.first?.imageUrl == "https://s3-ap-southeast-1.amazonaws.com/lalamove-mock-api/images/pet-4.jpeg",  "Success test failed")
        XCTAssert(data.count == 20,  "Success test failed")
        XCTAssert(deliveryRepository.dataAdded == true , "Success test failed")
        XCTAssert(deliveryRepository.dataDeleted == true , "Success test failed")

    }
    
    func testGetDeliveriesFromServerFailure() {
        let networkManger : NetworkManager = MockFailureNetworkManger()
        let deliveryRepository  = MockDeliveryRepository()
        var isErrorOccured = false
        
        deliveryService = DeliveryServiceBuilder()
            .withNetworkManager(networkManager: networkManger)
            .withDeliveryRepository(deliveryRepository: deliveryRepository)
            .build()
        
        deliveryService.getDeliveries(request: mockRequest) { [weak self](response, error) -> (Void) in
            guard let `self` = self else { return }
            self.data = response
            if (error != nil){ isErrorOccured = true }
        }
       
        XCTAssert(data.first?.imageUrl == "delivery1",  "Failure test failed")
        XCTAssert(data.first?.id == 1,  "Failure test failed")
        XCTAssert(data.count == 3,  "Failure test failed")
        XCTAssert(deliveryRepository.getAllCalled == true , "Failure test failed")
        XCTAssert(isErrorOccured == true, "Failure test failed")
    }
    
}
