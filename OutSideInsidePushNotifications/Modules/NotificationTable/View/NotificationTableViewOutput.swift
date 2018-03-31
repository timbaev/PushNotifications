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
    
    func viewDidAppear()
 
    func reloadNotificationData()
}
