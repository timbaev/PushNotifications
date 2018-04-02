//
//  NotificationTableInteractorInput.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 30.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol NotificationTableInteractorInput: class {
    
    /// Get notifications
    func getNotifications()
    
    /// Download image in cell
    ///
    /// - Parameters:
    ///   - url: URL of image
    ///   - indexPath: index of cell
    func downloadImage(from url: URL, at indexPath: IndexPath)
}
