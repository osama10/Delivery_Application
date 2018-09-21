//
//  ShowMoreListTableViewCell.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class ShowMoreListTableViewCell: UITableViewCell, Injectable {

    lazy var deliveryListView : DeliveryListView = {
        return ViewsFactory.makeView(type: .deliveryListView) as! DeliveryListView
    }()
    
    var viewModel : ShowMoreViewModel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addDeliveryListView()
        self.deliveryListView.setBorders()
        self.deliveryListView.setWidthOfImageView(width: 0.0)
        self.deliveryListView.descriptionLabelFont  = .specialTextFont
        self.deliveryListView.descriptionLabelTextAlignment = .center
        self.selectionStyle = .none
    }
    
    private func addDeliveryListView(){
        self.deliveryListView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.deliveryListView)
        NSLayoutConstraint.activate([
            self.deliveryListView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.deliveryListView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.deliveryListView.bottomAnchor.constraint(equalTo:self.bottomAnchor, constant:-5),
            self.deliveryListView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            ])
    }

    func inject(_ viewModel : ShowMoreViewModel){
        self.viewModel = viewModel
    }
    
    func populateData(){
        self.deliveryListView.descriptionLabel.text = self.viewModel.labelText
    }
}
