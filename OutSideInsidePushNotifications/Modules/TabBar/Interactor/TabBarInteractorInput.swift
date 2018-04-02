//
//  TabBarInteractorInput.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol TabBarInteractorInput: class {
    
    /// Subscribe to notifications
    ///
    /// - Parameter name: notification name
    func registerNotification(with name: String)
    
    /// Unsubscribe from all notifications
    func removeObserver()
    
}
