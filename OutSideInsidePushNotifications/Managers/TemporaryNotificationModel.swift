//
//  TemporaryNotificationModel.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 28.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit

/// Temporary struct for testing
struct TemporaryNotificationModel {
    
    var title: String
    var text: String?
    var image: UIImage?
    var created: Date
    
    init(title: String, text: String?, image: UIImage?, created: Date = Date()) {
        self.title = title
        self.text = text
        self.image = image
        self.created = created
    }
}
