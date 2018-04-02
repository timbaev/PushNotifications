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
    let cellHeight = CGFloat(89)
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moduleHolder = segue.destination as? ModuleInputHolder else { return }
        moduleHolder.moduleInput?.setData(sender)
    }
    
    //MARK: - View input implementation
    
    func setCellModels(with notificationModels: [CellModel]) {
        inputDataSource.setCurrentNotification(with: notificationModels)
    }
    
    func registerCell() {
        let notificationCellNib = UINib(nibName: notificationCellNibIdentifier, bundle: nil)
        self.tableView.register(notificationCellNib, forCellReuseIdentifier: notificationCellIdentifier)
    }

    func reloadTableView() {
        tableView.reloadData()
    }
    
    func connectTableWithDataSource() {
        tableView.dataSource = inputDataSource
        inputDataSource.downloadImageDelegate = presenter as? DownloadImageDelegate
    }
    
    func setTableViewArguments() {
        self.tableView.delegate = self
        self.tableView.refreshControl = refreshControl
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func set(image loadedImage: UIImage, to indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        inputDataSource.set(image: loadedImage, to: cell)
    }
    
    //MARK: - Refresh Method
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        presenter.getNotifications()
        refreshControl.endRefreshing()
    }

}

extension NotificationTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectNotification(at: indexPath)
    }
    
}
