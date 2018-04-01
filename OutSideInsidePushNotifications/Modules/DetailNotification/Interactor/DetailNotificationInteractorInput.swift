//
//  DetailNotificationInteractorInput.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DetailNotificationInteractorInput: class {
    
    /// Get notification model at index
    ///
    /// - Parameter index: index of model
    func getModel(with index: Int)
    
    /// Download image from url address
    ///
    /// - Parameter url: url to download image
    func downloadImage(from url: URL)
    
}
