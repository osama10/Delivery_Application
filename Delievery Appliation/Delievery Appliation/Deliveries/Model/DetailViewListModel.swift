//
//  DetailVewModel.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
enum DetailViewListType : Int{
    case heading = 1
    case description = 2
    case address = 3
}

struct DetailViewListModel {
    var description : String
    var image : String
    var type : DetailViewListType
    
    init(description : String, image : String, type : DetailViewListType) {
        self.description = description
        self.image = image
        self.type = type
    }
}
