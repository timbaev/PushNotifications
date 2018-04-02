//
//  NotificationTableRouterInput.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 01.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol NotificationTableRouterInput: class {
    
    /// Show detail notification screen
    ///
    /// - Parameter index: index of model
    func showDetailScreen(with index: Int)
    
}
