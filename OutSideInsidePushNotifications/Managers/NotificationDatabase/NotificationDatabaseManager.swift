//
//  DatabaseManager.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 28.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol NotificationDatabaseManager: class {
    
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
    
    /// Delete notification with index position
    ///
    /// - Parameter index: index of position
    func delete(at index: Int)
    
    /// Get notification at index
    ///
    /// - Parameter index: number of index
    /// - Returns: notification model
    func get(at index: Int) -> NotificationModel?
    
    /// Get last received notification
    ///
    /// - Returns: notification model
    func getLast() -> NotificationModel?
    
}
