//
//  NotificationManagerImplementation.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 30.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationManagerImplementation: NotificationManager {
    
    private var databaseManager: NotificationDatabaseManager
    
    init(databaseManager: NotificationDatabaseManager) {
        self.databaseManager = databaseManager
    }
    
    func reciveNotification(with option: [String: Any]) {
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: option, options: .prettyPrinted) else { return }
        guard let notificationModel = try? JSONDecoder().decode(NotificationModel.self, from: jsonData) else { return }
        
        databaseManager.create(notificationModel)
        print("--- Notification parsed and will be save ---")
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            let notificationView = NotificationView(width: topController.view.frame.width)
            notificationView.set(title: notificationModel.title)
            notificationView.set(text: notificationModel.text)
            
            topController.view.addSubview(notificationView)
            notificationView.showAnimate()
        }
    }
    
}
