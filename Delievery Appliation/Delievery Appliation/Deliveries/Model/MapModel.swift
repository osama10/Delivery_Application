//
//  MapModel.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import CoreLocation

struct MapModel {
    
    var title : String
    var snippet : String
    var position : CLLocationCoordinate2D
    var zoom : Float
    var markerImage : String
   
    init(title : String, snippet : String , position : CLLocationCoordinate2D, zoom : Float, markerImage : String) {
        self.snippet = snippet
        self.position = position
        self.zoom = zoom
        self.markerImage = markerImage
        self.title  = title
    }
}
