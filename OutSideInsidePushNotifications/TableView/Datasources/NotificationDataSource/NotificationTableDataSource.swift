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
    var downloadImageDelegate: DownloadImageDelegate?
    var deleteRowDelegate: DeleteRowDelegate?
    let notificationCellIdentifier = "notificationCell"
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let notificationsCount = cellModels?.count else { return 0 }
        return notificationsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: notificationCellIdentifier, for: indexPath) as! NotificationTableViewCell
        
        if let notifications = cellModels {
            let notificationModel = notifications[indexPath.row]
            if let imageURL = notificationModel.imageURL {
                downloadImageDelegate?.downloadImage(for: imageURL, at: indexPath)
            }
            cell.prepare(with: notificationModel)
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cellModels?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            deleteRowDelegate?.didDeleteRow(at: indexPath)
        }
    }
  
    func setCurrentNotification(with notifications: [CellModel]? ) {
        self.cellModels = notifications
    }
    
    func set(image loadedImage: UIImage, to cell: UITableViewCell) {
        guard let cell = cell as? NotificationTableViewCell else { return }
        cell.notificationImageView.image = loadedImage
    }
}
