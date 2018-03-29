//
//  NotificationTableViewController.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 29.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationTableViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    var inputDataSource: NotificationTableDataSourceInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = inputDataSource
        tableView.dataSource = inputDataSource
    }
    
    func setCellModels() {
        
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}
