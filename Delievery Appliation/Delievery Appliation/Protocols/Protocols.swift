//
//  Protocols.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 18/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit


protocol Injectable {
    /**
     For injecting dependencies to ViewControllers .
     
     - T : Generic Param
     - inject : function recieves dependency
     */
    
    associatedtype T
    func inject(_: T)
}

protocol ReusableView : class {
    /**
     For making the handling of tableviewcell easier and effiecient.
     - reuseIdentifier : cell reuse identifier
     */
    
    static var reuseIdentifier : String {get}
}

protocol NibLoadableView : class {
    /**
     For loading nib . It's function can be found in extension file.
     - nibName : Name of the nib
     */
    
    static var nibName : String {get}
    
}

//
protocol StoryboardInitializable {
    /**
     For initializeing story board and instantiaing ViewController .
     
     - storyboardIdentifier : Should be same as class name
     - storyboardName : storyboard enum
     - instantiateViewController : for instantiating viewcontroller
     */
    static var storyboardIdentifier: String { get }
    static var storyboardName: UIStoryboard.Storyboard { get }
    static func instantiateViewController() -> Self
}

protocol AlertsPresentable : class {     /**
     For Showing alert. It has a protocol extensions in extension file
     */
}
