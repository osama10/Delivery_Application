//
//  MockFailureNetworkManger.swift
//  DeliveryApplication
//
//  Created by Osama Bin Bashir on 21/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class MockFailureNetworkManger : NetworkManager{
    func request<E>(request: E, completion: @escaping ((NetworkResult<RequestProvider.Response, NetworkError>) -> Void)) where E : RequestProvider {
        completion(.error(NetworkError.requestCreation))
    }
    
    
}
