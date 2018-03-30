//
//  DatabaseManager.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 28.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol NotificationDatabaseManager {
    
    /// Write notification model to database
    ///
    /// - Parameter model: model to write
    func create(_ model: NotificationModel)
    
    /// Get all notifications from database
    ///
    /// - Returns: array of notification models
    func getAll() -> [NotificationModel]?
    
    /// Delete notification from database
    ///
    /// - Parameter notificationModel: model to delete
    func delete(_ notificationModel: NotificationModel)
    
}
