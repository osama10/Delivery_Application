//
//  DeliveryListTableViewCell.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 18/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class DeliveryListTableViewCell: UITableViewCell {

    lazy var deliveryListView : DeliveryListView = {
      return ViewsFactory.makeView(type: .deliveryListView) as! DeliveryListView
    }()
    
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addDeliveryListView()
        self.selectionStyle = .none
        self.layoutIfNeeded()
        
    }
       
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }
    
  private  func addDeliveryListView(){
    self.deliveryListView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.deliveryListView)
//    self.deliveryListView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
//    self.deliveryListView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true

        NSLayoutConstraint.activate([
            self.deliveryListView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.deliveryListView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.deliveryListView.bottomAnchor.constraint(equalTo:self.bottomAnchor, constant: -10),
            self.deliveryListView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
