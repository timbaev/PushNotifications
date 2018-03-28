//
//  NotificationRealm.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 28.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import RealmSwift

class NotificationRealm: Object {
    
    @objc dynamic var title = ""
    @objc dynamic var text: String? = nil
    @objc dynamic var imageName: String? = nil
    @objc dynamic var created = Date()
    
}
