//
//  MapViewTableViewCell.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewTableViewCell: UITableViewCell, Injectable {
    
    lazy var mapView : GMSMapView = {
        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        return GMSMapView(frame: frame)
    }()
    
    var viewModel : MapViewCellViewModel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       addMapView()
        self.selectionStyle = .none
    
    }

    func addMapView(){
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.mapView)
        NSLayoutConstraint.activate([
            self.mapView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.mapView.bottomAnchor.constraint(equalTo:self.bottomAnchor, constant: 0),
            self.mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.mapView.heightAnchor.constraint(equalToConstant: UIScreen.height * 0.5)
            ])
    }
    
    func inject(_ viewModel : MapViewCellViewModel) {
        self.viewModel = viewModel
    }
    
    func populateData(){
        self.mapView.setMarker(position: self.viewModel.mapData.position,
                               title: self.viewModel.mapData.title,
                               snippet: self.viewModel.mapData.snippet,
                               image: self.viewModel.mapData.markerImage)
        
        self.mapView.setCamera(location: self.viewModel.mapData.position,
                               zoom: self.viewModel.mapData.zoom)
    }
}
