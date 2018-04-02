//
//  TabBarViewOutput.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol TabBarViewOutput: class {
    
    /// Subscribe to notification
    func registerNotification()
    
    /// Unsubscribe notification
    func unregisterNotifications()
    
}
