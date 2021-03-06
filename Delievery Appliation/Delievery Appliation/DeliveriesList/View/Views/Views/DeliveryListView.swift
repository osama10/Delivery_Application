//
//  DeliveryListView.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 18/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class DeliveryListView: UIView {
    lazy var descriptionLabel : UILabel = {
        let label = ViewsFactory.makeView(type: .lableView) as! UILabel
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var deliveryImageView : UIImageView = {
        let imageView = ViewsFactory.makeView(type: .imageView) as! UIImageView
        imageView.image = #imageLiteral(resourceName: "placeholder")
        return imageView
    }()
    
    var descriptionLabelFont : UIFont{
        get{
            return self.descriptionLabel.font
        }
        set{
            self.descriptionLabel.font = newValue
            
        }
    }
    
    var descriptionLabelTextAlignment : NSTextAlignment{
        get{
            return self.descriptionLabel.textAlignment
        }
        set{
            self.descriptionLabel.textAlignment = newValue
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addImageView()
        addLabelView()
    }
    
    private func addImageView(){
        self.addSubview(self.deliveryImageView)
        self.deliveryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.deliveryImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.deliveryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.deliveryImageView.bottomAnchor.constraint(equalTo:self.bottomAnchor, constant: -5),
            self.deliveryImageView.widthAnchor.constraint(equalTo: self.deliveryImageView.heightAnchor, multiplier: 1.0/1.0),
            ])
    }
    
    private func addLabelView(){
        self.addSubview(self.descriptionLabel)
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 0),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.deliveryImageView.trailingAnchor, constant: 10),
            self.descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo:self.bottomAnchor, constant: -5),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
    
    func setDeliveryImageViewBorders(cornerRadius : CGFloat = 2.0, borderWidth : CGFloat = 2.0 , borderColor : UIColor = .white){
        self.deliveryImageView.addBorders(cornerRadius: cornerRadius, borderWidth: borderWidth, borderColor: borderColor)
    }
    
    func setBorders(cornerRadius : CGFloat = 2.0, borderWidth : CGFloat = 2.0 , borderColor : UIColor = .black){
        self.addBorders(cornerRadius: cornerRadius, borderWidth: borderWidth, borderColor: borderColor)
    }
    
    func setWidthOfImageView(width : CGFloat){
        self.deliveryImageView.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}
