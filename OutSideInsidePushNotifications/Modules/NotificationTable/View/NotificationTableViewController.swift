//
//  NotificationTableViewController.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 29.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationTableViewController: UIViewController, NotificationTableViewInput {
 
    @IBOutlet weak var tableView: UITableView!
    var presenter: NotificationTableViewOutput!
    var inputDataSource: NotificationTableDataSourceInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setNotifications()
        tableView.delegate = inputDataSource
        tableView.dataSource = inputDataSource
    }
    
    func reloadData() {
        presenter.setNotifications()
        tableView.reloadData()
    }

    //MARK: - View input implementation
    
    func setCellModels(with notificationModels: [NotificationCellModel]) {
        inputDataSource.setCurrentNotification(with: notificationModels)
    }
    
}
