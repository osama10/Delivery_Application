//
//  DeliveryDetailViewController.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 20/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class DeliveryDetailViewController: UIViewController , Injectable{
    enum ReuseIdentifier : String {
        case mapView
        case detailListView
    }
   
    lazy var tableView : UITableView = {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.width , height: UIScreen.height)
        return ViewsFactory.makeView(type: .tableView, with: frame)  as! UITableView
    }()
   
    var viewModel : DeliveryDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTableView()
        self.title = self.viewModel.title
    }
    
    private func addTableView(){
        self.tableView.separatorStyle = .none
        self.tableView.register(MapViewTableViewCell.self, forCellReuseIdentifier: ReuseIdentifier.mapView.rawValue)
        self.tableView.register(DeliveryDetailTableViewCell.self, forCellReuseIdentifier: ReuseIdentifier.detailListView.rawValue)
        self.tableView.setdelegateAndDatasource(for: self)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 150
        self.view.addSubview(tableView)
    }

    func inject(_ viewModel: DeliveryDetailViewModel) {
        self.viewModel = viewModel
    }
}

extension DeliveryDetailViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.totalRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellToReturn : UITableViewCell!
        
        if(indexPath.row == 0){
            let cell = self.tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.mapView.rawValue, for: indexPath) as! MapViewTableViewCell
            cell.inject(self.viewModel.getMapViewModel())
            cell.populateData()
            cellToReturn = cell
            
        }else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.detailListView.rawValue, for: indexPath) as! DeliveryDetailTableViewCell
            cell.inject(self.viewModel.getDeliveryDetailListViewModel(of: indexPath.row))
            cell.setUI()
            cell.populateData()
            cellToReturn = cell
            
        }
        
        return cellToReturn
    }
    
    
  
}

