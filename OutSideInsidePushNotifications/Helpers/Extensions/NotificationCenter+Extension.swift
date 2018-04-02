//
//  NotificationCenter+Extension.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

extension NotificationCenter {
    
    enum NotificationNames: String {
        case pushHandler
        case reloadNotifications
    }
    
    func post(name notificationName: NotificationNames, object: Any? = nil) {
        self.post(name: .init(notificationName.rawValue), object: object)
    }
    
    func addObserver(_ observer: Any, selector: Selector, name: NotificationNames, object: Any? = nil) {
        self.addObserver(observer, selector: selector, name: .init(name.rawValue), object: object)
    }
    
}
