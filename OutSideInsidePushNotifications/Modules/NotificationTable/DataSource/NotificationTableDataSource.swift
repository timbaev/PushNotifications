//
//  NotificationListDataSource.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 29.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationListDataSource: NSObject, NotificationTableDataSourceInput {

    var notifications: [NotificationCellModel]?
    let cellHeight: CGFloat = 80
    var currentNotificationImage: UIImage?
    var currentNotificationTitle: String?
    var currentNotificationText: String?
    let notificationCellIdentifier = "notificationCell"
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let notificationsCount = notifications?.count else { return 0 }
        return notificationsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: notificationCellIdentifier, for: indexPath) as! NotificationTableViewCell
        
        if let notifications = notifications {
            let notificationModel = notifications[indexPath.row]
            cell.prepare(with: notificationModel)
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func setCurrentNotification(with notifications: [NotificationCellModel] ) {
        self.notifications = notifications
    }
}
