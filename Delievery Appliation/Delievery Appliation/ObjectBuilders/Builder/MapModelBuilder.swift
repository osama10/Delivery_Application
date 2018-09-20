//
//  MapModelBuilder.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import CoreLocation

class MapModelBuilder{
    var title : String!
    var snippet : String!
    var position : CLLocationCoordinate2D!
    var zoom : Float!
    var markerImage : String!
    
    func withTitle(title : String)->MapModelBuilder{
        self.title = title
        return self
    }
    
    func withSnippet(snippet : String)->MapModelBuilder{
        self.snippet = snippet
        return self
    }
    
    func withPosition(lat : Double, lng : Double)->MapModelBuilder{
        let position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        self.position = position
        return self
    }
    
    func withZoom(zoom : Float)->MapModelBuilder{
        self.zoom = zoom
        return self
    }
    
    func withMarkerImage(markerImage : String)->MapModelBuilder{
        self.markerImage = markerImage
        return self
    }
    
    func build()->MapModel{
        return MapModel(title: self.title, snippet: self.snippet, position: self.position, zoom: self.zoom, markerImage: self.markerImage)
    }
}
