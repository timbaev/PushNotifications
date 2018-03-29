//
//  NotificationManager.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 28.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

/// Manager for processing of notifications
protocol NotificationManager {
    
     /// To recive notification and create notification model to save to the database
     ///
     /// - Parameter option: remote notification from [UIApplicationLaunchOptionsKey: Any]
     func reciveNotification(with option: [String: Any])
}
