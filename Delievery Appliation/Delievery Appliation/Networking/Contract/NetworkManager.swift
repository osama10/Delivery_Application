//
//  WebManager.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol NetworkManager {
    
    func request<E: RequestProvider>(request: E,
                                      completion: @escaping ((NetworkResult<E.Response, NetworkError>) -> Void))
}
