//
//  DeliveryDetailViewList.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.

import UIKit

class DeliveryDetailViewList: UIView {
    
    lazy var descriptionLabel : UILabel = {
        let label = ViewsFactory.makeView(type: .lableView) as! UILabel
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var deliveryImageView : UIImageView = {
        let imageView = ViewsFactory.makeView(type: .imageView) as! UIImageView
        return imageView
    }()
    
    lazy var separatorView : UIView = {
        let view = ViewsFactory.makeView(type: .separatorView)
        view.backgroundColor = .lightGray
        return view
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
        self.addSeparatorView()
        self.addImageView()
        self.addLabelView()
        
    }
    
    private func addLabelView(){
        self.addSubview(self.descriptionLabel)
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 0),
            self.descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo:self.separatorView.bottomAnchor, constant: -10),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.deliveryImageView.trailingAnchor, constant: 10),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50.0)
            ])
    }
    
    private func addImageView(){
        self.addSubview(self.deliveryImageView)
        self.deliveryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.deliveryImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.deliveryImageView.widthAnchor.constraint(equalToConstant: 35),
            self.deliveryImageView.heightAnchor.constraint(equalToConstant: 35),
            self.deliveryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
            ])
    }
    
    private func addSeparatorView(){
        self.addSubview(self.separatorView)
        self.separatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.separatorView.heightAnchor.constraint(equalToConstant: 1.0),
            self.separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.separatorView.bottomAnchor.constraint(equalTo:self.bottomAnchor, constant: 0),
            self.separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
            ])
    }
    
    func setWidthOfImageView(width : CGFloat){
        self.deliveryImageView.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}
