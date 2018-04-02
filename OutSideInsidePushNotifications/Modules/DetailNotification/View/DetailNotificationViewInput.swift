//
//  DetailNotificationViewInput.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

protocol DetailNotificationViewInput: class {
    
    //MARK: - Setters
    
    func set(title titleText: String)
    func set(text bodyText: String)
    func set(image notificationImage: UIImage)
    
    //MARK: - Section hidden
    
    func hideTitleSection()
    func hideTextSection()
    func hideImageSection()
    
}
