//
//  NotificationListDataSource.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 29.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationTableDataSource: NSObject, NotificationTableDataSourceInput {

    var cellModels: [CellModel]?
    let cellHeight: CGFloat = 80
    let notificationCellIdentifier = "notificationCell"
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let notificationsCount = cellModels?.count else { return 0 }
        return notificationsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: notificationCellIdentifier, for: indexPath) as! NotificationTableViewCell
        
        if let notifications = cellModels {
            let notificationModel = notifications[indexPath.row]
            cell.prepare(with: notificationModel)
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
    
    func setCurrentNotification(with notifications: [CellModel]? ) {
        self.cellModels = notifications
    }
}
