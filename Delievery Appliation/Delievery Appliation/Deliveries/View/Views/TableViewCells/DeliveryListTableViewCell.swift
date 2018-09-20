//
//  DeliveryListTableViewCell.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 18/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit
import SDWebImage

class DeliveryListTableViewCell: UITableViewCell, Injectable {
    
    lazy var deliveryListView : DeliveryListView = {
        return ViewsFactory.makeView(type: .deliveryListView) as! DeliveryListView
    }()
    
    var viewModel : DeliveryListTableCellViewModel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addDeliveryListView()
        self.selectionStyle = .none
        self.layoutIfNeeded()
        
    }
    
    private func addDeliveryListView(){
        self.deliveryListView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.deliveryListView)
        NSLayoutConstraint.activate([
            self.deliveryListView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.deliveryListView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.deliveryListView.bottomAnchor.constraint(equalTo:self.bottomAnchor, constant: -10),
            self.deliveryListView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            ])
    }
    
    
    func inject(_ viewModel : DeliveryListTableCellViewModel) {
        self.viewModel = viewModel
    }
    
    func populateData(){
        self.deliveryListView.descriptionLabel.text = self.viewModel.delivery.description

        let imageUrl = self.viewModel.delivery.imageUrl!
        self.deliveryListView.deliveryImageView.sd_setShowActivityIndicatorView(true)
        self.deliveryListView.deliveryImageView.sd_setIndicatorStyle(.gray)
        self.deliveryListView.deliveryImageView.sd_setImage(with: URL(string:imageUrl ))
        
    }
    
    
}
