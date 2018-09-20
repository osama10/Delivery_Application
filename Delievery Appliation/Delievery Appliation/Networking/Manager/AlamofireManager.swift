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
        
        if NetworkReachabilityManager()!.isReachable{
            Alamofire.request(
                request.request.api.url,
                method: self.getHTTPMethod(method: request.request.method),
                parameters: request.request.params,
                encoding: URLEncoding.default,
                headers: request.request.headers
                )
                .responseJSON
                { (response) in
                    if let error = response.result.error {
                        completion(.error(NetworkError.server(error)))
                    } else if let data = response.result.value {
                        let response  : E.Response = data
                        completion(.success(response))
                    }
                    
            }
        }else{
           
            completion(.error(NetworkError.internetError("No Internet Conncection")))
        }
    }
}

