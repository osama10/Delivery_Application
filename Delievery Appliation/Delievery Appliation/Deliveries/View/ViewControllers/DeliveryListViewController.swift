//
//  ViewController.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit
import CoreData
class DeliveryListViewController: UIViewController, Injectable, AlertsPresentable {
    
    lazy var tableView : UITableView = {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.width , height: UIScreen.height)
        return ViewsFactory.makeView(type: .tableView, with: frame)  as! UITableView
    }()
    
    var viewModel : DeliveryListViewModel!
        
    private let reuseIdentifier = "DeliveryListTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()
        bindUI()
        self.viewModel.getDeliveries()
    }
    
    func inject(_ viewModel : DeliveryListViewModel) {
        self.viewModel = viewModel
    }
    
    private func initialSettings(){
        self.view.backgroundColor = .white
        self.title = self.viewModel.title
        addTableView()
    }
    
    private func addTableView(){
        self.tableView.separatorStyle = .none
        self.tableView.register(DeliveryListTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.tableView.setdelegateAndDatasource(for: self)
        self.view.addSubview(tableView)
    }
    
    private func bindUI(){
        self.viewModel.refreshData = { [weak self] in
            self?.tableView.reloadData()
        }
        
        self.viewModel.animateLoader = { [weak self] (showLoader) in
            guard let `self` = self else { return }
            (showLoader) ? self.view.makeToastActivity(.center) : self.view.hideToastActivity()
        }
        
        self.viewModel.showAlert = { [weak self] (title, message) in
            guard let `self` = self else { return }
            self.showAlert(with: title, and: message)
        }
        
        self.viewModel.showDetailView = { [weak self] (delivery) in
            guard let `self` = self else { return }
            
        }
    }
    
}

extension DeliveryListViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.totalRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DeliveryListTableViewCell
        cell.inject(self.viewModel.getDeliveryListCellViewModel(of: indexPath.row))
        cell.populateData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel.rowHeight.toCGFloat
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didTapOnList(at: indexPath.row)
    }
}
