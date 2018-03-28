//
//  NotificationModel.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 28.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

struct NotificationModel {
    
    let title: String
    let text: String?
    let image: UIImage?
    let created: Date
    
    init(title: String, text: String?, image: UIImage?, created: Date = Date()) {
        self.title = title
        self.text = text
        self.image = image
        self.created = created
    }
    
}
