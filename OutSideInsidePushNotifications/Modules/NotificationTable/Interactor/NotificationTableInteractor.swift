//
//  NotificationTableInteractor.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 30.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class NotificationTableInteractor: NotificationTableInteractorInput {
    
    weak var presenter: NotificationTableInteractorOutput!
    var notificationDataBaseManager: NotificationDatabaseManager!
    
    //MARK: - Interactor input implementation
    
    func getNotifications() {
        guard let notifications = notificationDataBaseManager.getAll() else { return  }
        var notificationsCellModel = [NotificationCellModel]()
        
        for notification in notifications {
            notificationsCellModel.append(NotificationCellModel(text: notification.text, title: notification.title, imageURL: notification.imageURL))
        }

        let url1 = URL(fileURLWithPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVHnduiEy1vr-JySv1ekN_lSccJ0SdVQqYR0ZDYAxstNW_MDej")
        let url2 = URL(fileURLWithPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMkqmxteqE9oqD_1KELbJSJKKeMUYtVFWsMFtSQt6BZI-cYh-l")
        
        notificationsCellModel.append(NotificationCellModel(text: "1", title: "1", imageURL: url1))
        notificationsCellModel.append(NotificationCellModel(text: "2", title: "2", imageURL: url2))
        presenter.didFinishingToGetNotifications(with: .success(notificationsCellModel))
    }
    
}
