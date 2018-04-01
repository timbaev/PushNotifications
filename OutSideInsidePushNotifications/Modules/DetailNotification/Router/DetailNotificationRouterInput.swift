//
//  DetailNotificationRouterInput.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DetailNotificationRouterInput {
    
    /// Show simple error alert with ok button
    ///
    /// - Parameter message: message to display
    func showErrorAlert(with message: String)
    
}
