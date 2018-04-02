//
//  NotificationTableViewOutput.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 29.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol NotificationTableViewOutput: class {
    
    /// Setter
    func getNotifications()
    
    /// View lifecycle
    func viewIsReady()
    
    /// Logic when the view became the background
    func viewDidAppear()
    
    /// Select notification
    ///
    /// - Parameter indexPath: at index path
    func didSelectNotification(at indexPath: IndexPath)
    
    /// Handle new push notifications
    func subscripeToNotifications()
    
    /// Stop handling new push notification
    func unsubscripeFromNotifications()

}
