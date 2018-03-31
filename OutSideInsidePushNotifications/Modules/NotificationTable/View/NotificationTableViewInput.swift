//
//  NotificationTableViewInput.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 29.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

protocol NotificationTableViewInput: class {

    /// Set notification models
    ///
    /// - Parameter notificationModels: notifications
    func setCellModels(with notificationModels: [CellModel])
    
    /// Cell registration
    func registerCell()
    
    /// Retrieving data from Data Source 
    func connectTableWithDataSource()
    
    /// Reload table view
    func reloadTableView()
    
    /// Initialization table view arguments (delegate, refreshControl)
    func setTableViewArguments()

}
