//
//  NotificationTableConfigurator.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 30.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class NotificationTableConfigurator {
    
    func setupModule(with viewController: NotificationTableViewController) {
        let presenter = NotificationTablePresenter()
        let interactor = NotificationTableInteractor()
        let router = NotificationTableRouter()
        
        let notificationDataBaseManager = RealmNotificationDatabaseManager()
        let inputDataSource = NotificationTableDataSource()
        let imageDownloadManager = ImageDownloadManagerImpl()
        
        viewController.presenter = presenter
        viewController.inputDataSource = inputDataSource
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.notificationDataBaseManager = notificationDataBaseManager
        interactor.imageDownloadManager = imageDownloadManager
        
        router.viewController = viewController
    }
}
