//
//  NotificationTableInteractorInput.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 30.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol NotificationTableInteractorInput: class {
    
    /// Get notifications
    func getNotifications()
    
    /// Download image in cell
    ///
    /// - Parameters:
    ///   - url: URL of image
    ///   - indexPath: index of cell
    func downloadImage(from url: URL, at indexPath: IndexPath)
    
    /// Handle new push notifications
    func subscripeToNotifications()
    
    /// Stop handling new push notification
    func unsubscripeFromNotifications()
    
    /// Delete notification from database
    ///
    /// - Parameter index: index of notification cell
    func deleteNotification(with index: Int)
}
