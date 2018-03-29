//
//  NotificationListDataSource.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 29.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit


class NotificationListDataSource: NSObject, NotificationTableDataSourceInput {

    var notificationsResults: [NotificationModel]?
    let cellHeight: CGFloat = 80
    var currentNotificationImage: UIImage?
    var currentNotificationTitle: String?
    var currentNotificationText: String?
    let notificationCellIdentifier = "notificationCell"
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let notificationsCount = notificationsResults?.count else { return 0 }
        return notificationsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: notificationCellIdentifier, for: indexPath) as! NotificationTableViewCell
        
        if let notifications = notificationsResults {
            let notificationModel = notifications[indexPath.row]
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
