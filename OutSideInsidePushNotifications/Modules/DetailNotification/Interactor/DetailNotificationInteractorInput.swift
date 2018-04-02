//
//  DetailNotificationInteractorInput.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DetailNotificationInteractorInput: class {
    
    /// Configure module with init parameters
    ///
    /// - Parameter index: index of notification model
    func configure(with index: Int)
    
    /// Get notification model at index
    func getModel()
    
    /// Download image from url address
    ///
    /// - Parameter url: url to download image
    func downloadImage(from url: URL)
    
}
