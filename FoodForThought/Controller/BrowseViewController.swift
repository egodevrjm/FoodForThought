//
//  BrowseViewController.swift
//  FoodForThought
//
//  Created by Ryan Morrison on 07/09/2017.
//  Copyright © 2017 egoDev. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - OUTLETS
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - VARIABLES
    
    var tableViewData = ["Restaurant One", "Restaurant Two", "Restaurant three"]
    
    // MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    // MARK: - TABLE METHODS
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell") as? RestaurantCell {
            cell.cellLabel.text = tableViewData[indexPath.row]
            cell.cellImageView.image = UIImage(named: "placeholder")
            return cell
        }
        return RestaurantCell()
        
    }
    
    // MARK: - FUNCTIONS
    
    
}
