//
//  NotificationManagerImpl.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 28.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class NotificationManagerImpl: NotificationManager {
    
    func reciveNotification(with option: [String: Any]) {
        
        var title: String?
        var body: String?
        var imageURL: URL?
        var date: Date?
        
        guard let aps = option["aps"] as? [String: Any] else { return }
            
        guard let alert = aps["alert"] as? [String: String] else { return }
            
        if let bodyCheck = alert["body"] {
            body = bodyCheck
        }
        if let titleCheck = alert["title"] {
            title = titleCheck
        }
        
        if let data = option["data"] as? [String: URL] {
            if let imageURLCheck = data["attachment-url"] {
                imageURL = imageURLCheck
            }
        }
        
        
    }
    
}
