//
//  DeliveryDetailTableViewCell.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class DeliveryDetailTableViewCell: UITableViewCell, Injectable {
    
    lazy var detailListView : DeliveryDetailViewList = {
        return ViewsFactory.makeView(type: .deliveryDetailView) as! DeliveryDetailViewList
    }()
    
    var viewModel : DeliveryDetailCellViewModel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addDeliveryDetailListView()
        self.selectionStyle = .none
        
    }
    
    func addDeliveryDetailListView(){
        self.detailListView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.detailListView)
        NSLayoutConstraint.activate([
            self.detailListView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.detailListView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.detailListView.bottomAnchor.constraint(equalTo:self.bottomAnchor, constant: 0),
            self.detailListView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
            ])
    }
    
    func inject(_ viewModel : DeliveryDetailCellViewModel) {
        self.viewModel = viewModel
    }
    
    func setUI(){
        self.detailListView.descriptionLabelFont = .generalTextFont
        self.detailListView.descriptionLabelTextAlignment = .left
        
    }
    
    func populateData(){
        self.detailListView.descriptionLabel.text = self.viewModel.data.description
        self.detailListView.deliveryImageView.image = UIImage(named: self.viewModel.data.image)
    }
}
