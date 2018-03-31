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
    
    let notificationCellIdentifier = "notificationCell"
    let notificationCellNibIdentifier = "NotificationTableViewCell"
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.gray
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter.viewDidAppear()
    }
    
    //MARK: - View input implementation
    
    func setCellModels(with notificationModels: [CellModel]) {
        inputDataSource.setCurrentNotification(with: notificationModels)
    }
   
    func connectTableWithDataSource() {
        tableView.dataSource = inputDataSource
        tableView.delegate = inputDataSource
    }
    
    func registerCell() {
        let notificationCellNib = UINib(nibName: notificationCellNibIdentifier, bundle: nil)
        self.tableView.register(notificationCellNib, forCellReuseIdentifier: notificationCellIdentifier)
    }
    
    //MARK: - Work with the table
    
    func refreshNotificitaion() {
        presenter.getNotifications()
        tableView.reloadData()
    }
    
    //MARK: - Refresh Method
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
    }


}
