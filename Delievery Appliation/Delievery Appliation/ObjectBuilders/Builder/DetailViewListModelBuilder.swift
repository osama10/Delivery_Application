//
//  DetailViewListModelBuilder.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class DetailViewListModelBuilder {
    var description : String!
    var image : String!
    var type : DetailViewListType!
    
    func withDescription(description : String)->DetailViewListModelBuilder{
        self.description  = description
        return self
    }
    
    func withType(type : DetailViewListType)->DetailViewListModelBuilder{
        self.type  = type
        return self
    }
    
    func withImage(of type : DetailViewListType)->DetailViewListModelBuilder{
        var image = ""
        switch type {
        case .heading:
            image = "order"
        case .description:
            image = "description"
        case .address:
            image = "location"
        }
        self.image = image
        return self
    }
    
    func build() -> DetailViewListModel {
        return DetailViewListModel(description: self.description, image: self.image, type: self.type)
    }
}
