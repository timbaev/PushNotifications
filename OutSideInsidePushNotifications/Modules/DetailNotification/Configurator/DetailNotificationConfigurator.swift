//
//  DetailNotificationConfigurator.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DetailNotificationConfigurator {
    
    func setupModule(with viewController: DetailNotificationViewController) {
        let presenter = DetailNotificationPresenter()
        let interactor = DetailNotificationInteractor()
        let router = DetailNotificationRouter()
        
        let databaseManager = RealmNotificationDatabaseManager()
        let imageDownloadManager = ImageDownloadManagerImpl()
        let commonAlertsFactory = CommonAlertsFactoryImpl()
        
        viewController.presenter = presenter
        viewController.moduleInput = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.databaseManager = databaseManager
        interactor.imageDownloadManager = imageDownloadManager
        
        router.viewController = viewController
        router.commonAlertsFactory = commonAlertsFactory
    }
    
}
