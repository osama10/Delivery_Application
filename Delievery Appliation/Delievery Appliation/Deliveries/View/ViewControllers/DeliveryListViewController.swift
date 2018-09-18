//
//  ViewController.swift
//  Delievery Appliation
//
//  Created by Osama Bin Bashir on 17/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit
import CoreData
class DeliveryListViewController: UIViewController {
    
    lazy var tableView : UITableView = {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.width , height: UIScreen.height)
        return ViewsFactory.makeView(type: .tableView, with: frame)  as! UITableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let manager : NetworkManager = AlamofireManager()
//        let deliveryRequest = DeliveryRequest(offset: 60, limit: 5)
//        manager.request(request: deliveryRequest) { (result) in
//
//        }
//        let dbManager  = CoreDataManger(context: NSManagedObjectContext())
//        var temp   = DeliveryRepository<CoreDataManger>(dbManager: dbManager)
//        temp = MockDelivery(dbManager: dbManager)
        
        self.title = "List View"
        self.view.backgroundColor = .white
        self.tableView.separatorStyle = .none
       
        self.tableView.register(DeliveryListTableViewCell.self, forCellReuseIdentifier: "DeliveryListTableViewCell")
       
        self.tableView.setdelegateAndDatasource(for: self)
       
        self.view.addSubview(tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension DeliveryListViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.tableView.dequeueReusableCell(withIdentifier: "DeliveryListTableViewCell", for: indexPath) as! DeliveryListTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
