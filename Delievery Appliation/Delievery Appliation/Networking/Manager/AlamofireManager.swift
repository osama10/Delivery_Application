//
//  Network.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireManager : NetworkManager {
    private func getHTTPMethod(method : HTTPMethods)->HTTPMethod{
        return (method == .get) ? .get : .post
    }
    
    func request<E>(request : E, completion: @escaping ((NetworkResult<E.Response, NetworkError>) -> Void)) where E : RequestProvider {
        
       Alamofire.request(
        request.request.api.url,
        method: self.getHTTPMethod(method: request.request.method),
        parameters: request.request.params, encoding: JSONEncoding.default,
        headers: request.request.headers)
        .responseJSON
        { (response) in
            if let error = response.result.error {
                completion(.error(NetworkError.server(error)))
            } else if let data = response.result.value {
                let response  : E.Response = DeliveryResponse(data: data).map()
                completion(.success(response))
                
            }
        }
        
   
    }
}

