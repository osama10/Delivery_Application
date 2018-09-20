//
//  ShowMoreViewModel.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class ShowMoreViewModelImp : ShowMoreViewModel{
    var labelText: String
    var fontSize: Double {
        return 15.0
    }
    init(labelText : String) {
        self.labelText = labelText
    }
}
