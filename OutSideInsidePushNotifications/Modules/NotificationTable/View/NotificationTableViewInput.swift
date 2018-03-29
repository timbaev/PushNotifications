//
//  NotificationTableViewInput.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 29.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

protocol NotificationTableViewInput: class {
    func set(text: String)
    func set(image: UIImage)
    func set(title: String)
}
