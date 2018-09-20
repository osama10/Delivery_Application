//
//  ViewFactory.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 18/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

enum Views{
    case tableView
    case lableView
    case imageView
    case deliveryListView
}

struct ViewsFactory {
    
    static func makeView(type : Views, with frame : CGRect? = nil)->UIView{
        var view : UIView!
        switch type {
        case .lableView:
            view = (frame == nil) ? UILabel() : UILabel(frame: frame!)
        case .tableView:
            view = (frame == nil) ? UITableView() : UITableView(frame: frame!)
        case .imageView:
            view = (frame == nil) ? UIImageView() : UIImageView(frame: frame!)
        case .deliveryListView:
            view = (frame == nil) ? DeliveryListView() : DeliveryListView(frame: frame!)
            
        }
        
        return view
    }
}
