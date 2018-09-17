//
//  NetworkResult.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

import UIKit

 enum NetworkResult<D   , E: Error> {
    case success(D)
    case error(E)
}
