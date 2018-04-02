//
//  TabBarRouterInput.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol TabBarRouterInput: class {
    
    /// Showing details about notification
    ///
    /// - Parameter notificationIndex: index of notification
    func showDeatilScreen(with notificationIndex: Int)
    
}
