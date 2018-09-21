//
//  MockNetworkManager.swift
//  DeliveryApplication
//
//  Created by Osama Bin Bashir on 21/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class MockSuccessNetworkManager : NetworkManager{
    func request<E>(request: E, completion: @escaping ((NetworkResult<RequestProvider.Response, NetworkError>) -> Void)) where E : RequestProvider {
        guard let pathString = Bundle(for: type(of: self) ).path(forResource: "MockData", ofType: "json") else {
            fatalError("MockData.json not found")
        }
        guard let jsonString = try? NSString(contentsOfFile: pathString, encoding: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }
        guard let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to convert UnitTestData.json to NSData")
        }
        guard let jsonResponse = try? JSONSerialization.jsonObject(with: jsonData, options: [])  else {
            fatalError("Unable to convert UnitTestData.json to JSON dictionary")
        }
        
        completion(.success(jsonResponse))
    }
    
    
}
