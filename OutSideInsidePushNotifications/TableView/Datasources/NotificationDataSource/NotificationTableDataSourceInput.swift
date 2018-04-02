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
    
    var downloadImageDelegate: DownloadImageDelegate? { get set }
    var deleteRowDelegate: DeleteRowDelegate? { get set }
    
    /// Set all notifications in data source
    ///
    /// - Parameter notifications: current notifications
    func setCurrentNotification(with notifications: [CellModel]?)
    
    /// Set downloaded image to cell
    ///
    /// - Parameters:
    ///   - loadedImage: downloaded image from URL
    ///   - cell: cell with image
    func set(image loadedImage: UIImage, to cell: UITableViewCell)
}
