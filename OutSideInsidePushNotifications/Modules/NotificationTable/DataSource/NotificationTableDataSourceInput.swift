//
//  NotificationTableDataSourceInput.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 29.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit


/// Data source input protocol
protocol NotificationTableDataSourceInput: UITableViewDataSource {
    
    /// Set all notifications in data source
    ///
    /// - Parameter notifications: current notifications
    func setCurrentNotification(with notifications: [CellModel]?)
}
