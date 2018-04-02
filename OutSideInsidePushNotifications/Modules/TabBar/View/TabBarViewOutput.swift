//
//  TabBarViewOutput.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol TabBarViewOutput: class {
    
    /// Subscribe to notification with name
    ///
    /// - Parameter name: notification name
    func registerNotification(with name: String)
    
    /// Unsubscribe notification
    func unregisterNotifications()
    
}
