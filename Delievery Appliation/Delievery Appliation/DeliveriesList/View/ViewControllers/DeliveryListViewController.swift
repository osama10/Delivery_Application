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
    
    enum ReuseIdentifier : String{
        case deliveryList
        case showMore
    }
    
    lazy var tableView : UITableView = {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.width , height: UIScreen.height)
        return ViewsFactory.makeView(type: .tableView, with: frame)  as! UITableView
    }()
    
    var viewModel : DeliveryListViewModel!
    let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSettings()
        self.bindUI()
        self.configureRefreshController()
        self.viewModel.getDeliveries()
        
    }
    
    
    func inject(_ viewModel : DeliveryListViewModel) {
        self.viewModel = viewModel
    }
    
    private func initialSettings(){
        self.view.backgroundColor = .white
        self.title = self.viewModel.title
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.addTableView()
    }
    
    private func addTableView(){
        self.tableView.separatorStyle = .none
        self.tableView.register(DeliveryListTableViewCell.self, forCellReuseIdentifier: ReuseIdentifier.deliveryList.rawValue)
        self.tableView.register(ShowMoreListTableViewCell.self, forCellReuseIdentifier: ReuseIdentifier.showMore.rawValue)
        self.tableView.setdelegateAndDatasource(for: self)
        self.view.addSubview(tableView)
    }
    
    private func bindUI(){
        self.viewModel.populateData = { [weak self] in
            self?.tableView.reloadData()
            self?.refreshController.endRefreshing()
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
            let detailVC = DeliveryDetailViewController()
            detailVC.inject(self.viewModel.getDeliveryDetailViewModel(with: delivery))
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func configureRefreshController(){
        self.refreshController.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        self.tableView.refreshControl = self.refreshController
    }
    
    @objc func refreshData(){
        self.viewModel.refreshData()
    }
    
}

extension DeliveryListViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.totalRows 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellToReturn : UITableViewCell!
        
        if(self.viewModel.deliveries?.count == (indexPath.row)){
            let cell = self.tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.showMore.rawValue, for: indexPath) as! ShowMoreListTableViewCell
            cell.inject(self.viewModel.getShowMoreViewModel())
            cell.populateData()
            cellToReturn = cell
            
        }else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.deliveryList.rawValue, for: indexPath) as! DeliveryListTableViewCell
            cell.inject(self.viewModel.getDeliveryListCellViewModel(of: indexPath.row))
            cell.populateData()
            cellToReturn = cell
            
        }
        
        return cellToReturn
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel.getCellHeight(of: indexPath.row).toCGFloat
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didTapOnList(at: indexPath.row)
    }
}
