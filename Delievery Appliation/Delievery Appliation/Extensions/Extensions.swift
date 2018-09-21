//
//  Extensions.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 18/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

extension Int{
    var toString: String{
        return String(self)
    }
    
    var toDouble : Double{
        return Double(self)
    }
}

extension Double{
    var toString: String{
        return String(self)
    }
    
    var toInt : Int{
        return Int(self)
    }
    
    var toCGFloat : CGFloat{
        return CGFloat(self)
    }
}

extension String {
    var toDouble : Double{
        return Double(self) ?? 0.0
    }
    
    var toInt : Int{
        return Int(self) ?? 0
    }
}

extension UIScreen{
   static var width : CGFloat{
        return UIScreen.main.bounds.width
    }
    
   static var height : CGFloat{
        return UIScreen.main.bounds.height
    }
}

extension UIColor {
    static var primaryColor : UIColor{
        return UIColor(red: 239/255, green: 102/255, blue: 47/255, alpha: 1.0)
    }
}

extension UIFont{
    static var navTitleFont : UIFont{
       return UIFont.init(name: "AvenirNext-DemiBold", size: 22.0)!
    }
    
    static var headingFont : UIFont{
        return UIFont.init(name: "AvenirNext-DemiBold", size: 18.0)!
    }
    
    static var generalTextFont : UIFont{
        return UIFont.init(name: "AvenirNext-Regular", size: 16.0)!
    }
    
    static var specialTextFont : UIFont{
        return UIFont.init(name: "AvenirNext-DemiBold", size: 14.0)!

    }
}

extension UITableView {
    /**
     - setdelegateAndDatasource - for setting delegate and datasource for view and viewcontroller
     */
    
    func setdelegateAndDatasource(for viewController : UIViewController){
        self.delegate = viewController as? UITableViewDelegate
        self.dataSource = viewController as? UITableViewDataSource
    }
    
    func setdelegateAndDatasource(for view : UIView){
        self.delegate = view as? UITableViewDelegate
        self.dataSource = view as? UITableViewDataSource
    }
    
}

extension AlertsPresentable where Self : UIViewController {
    /**
     - ShowAlert : function to show alert
     */
    func showAlert(with title: String? = nil , and message: String? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
        
    }
}

extension UIView {
     func addBorders(cornerRadius : CGFloat, borderWidth : CGFloat , borderColor : UIColor){
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = false
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    func makeViewCircular(borderWidth : CGFloat , borderColor : UIColor){
        self.addBorders(cornerRadius: self.frame.width/2, borderWidth: borderWidth, borderColor: borderColor)
    }
}

extension GMSMapView{
     func setMarker(position : CLLocationCoordinate2D , title : String , snippet : String , image : String ){
        let markerOrig = GMSMarker()
        markerOrig.position = position
        markerOrig.title = title
        markerOrig.snippet = snippet
        markerOrig.map = self
        markerOrig.icon = UIImage(named: image)
    }
    
     func setCamera(location : CLLocationCoordinate2D , zoom : Float){
        let camera = GMSCameraPosition.camera(withLatitude: (location.latitude), longitude: (location.longitude), zoom: zoom)
        self.camera = camera
    }
}
