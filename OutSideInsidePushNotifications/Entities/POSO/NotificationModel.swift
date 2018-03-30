//
//  NotificationModel.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 29.03.2018.
//  Created by Тимур Шафигуллин on 28.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

struct NotificationModel {
    
    let title: String
    let text: String?
    let imageURL: URL?
    let created: Date
    
    init(title: String, text: String?, imageURL: URL?, created: Date = Date()) {
        self.title = title
        self.text = text
        self.imageURL = imageURL
        self.created = created
    }
    
}
