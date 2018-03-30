//
//  NotificationTableInteractorOutput.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 30.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol NotificationTableInteractorOutput: class {
    
    /// Result of receiving notifications
    ///
    /// - Parameter result: result
    func didFinishingToGetNotifications(with result: Result<NotificationCellModel>)
}
