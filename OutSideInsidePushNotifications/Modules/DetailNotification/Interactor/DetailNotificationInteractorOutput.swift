//
//  DetailNotificationInteractorOutput.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DetailNotificationInteractorOutput: class {
    
    /// Getting result of notification model
    ///
    /// - Parameter model: notification model
    func didFinishGettingModel(with model: NotificationModel)
    
    /// Finish dowload image from url
    ///
    /// - Parameter result: result of downloading
    func didFinishImageDownload(with result: Result<ImageModel?>)
    
}
