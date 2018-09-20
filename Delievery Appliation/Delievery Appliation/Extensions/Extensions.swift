//
//  Extensions.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 18/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

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
extension UIStoryboard {
    /**
     - Storyboard : enum for saving storyboard name
     - storyboard : initialise storyboard
     */
    enum Storyboard: String {
        case main
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
}

extension StoryboardInitializable where Self: UIViewController {
    /**
     define in protocol file
     
     */
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static var storyboardName: UIStoryboard.Storyboard {
        return UIStoryboard.Storyboard.main
    }
    static func instantiateViewController() -> Self {
        let storyboard = UIStoryboard.storyboard(storyboard: storyboardName)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
        
    }
}

extension NibLoadableView where Self : UIView {
    /**
     - nibName : Nib name
     - loadNib - for loading Nib
     
     */
    static var nibName : String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    static func loadNib() -> Self {
        let bundle = Bundle(for:Self.self)
        let nib = UINib(nibName: Self.nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! Self
    }
}

extension UITableView {
    /**
     - register : for registring TableViewCell from nib
     - dequeResuseableCell - type safe dequeReuseableCell
     - setdelegateAndDatasource - for setting delegate and datasource for view and viewcontroller
     
     */
    func register<T:UITableViewCell>(_ : T.Type) where T : ReusableView , T : NibLoadableView{
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeResuseableCell<T:UITableViewCell>(for indexPath : IndexPath)->T where T : ReusableView{
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else{
            fatalError("Couldn't cast cell in \(T.reuseIdentifier)")
        }
        return cell
    }
    
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

extension ReusableView where Self : UIView {
    /**
     - reuseIdentifier : Gets reuseIdentifier by taking the name of class
     */
    static var reuseIdentifier : String {
        return String(describing: self).components(separatedBy: ".").last!
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
