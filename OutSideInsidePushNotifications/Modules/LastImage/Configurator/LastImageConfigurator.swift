//
//  LastImageConfigurator.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 01.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class LastImageConfigurator {
    
    func setupModule(with viewController: LastImageViewController) {
        let presenter = LastImagePresenter()
        let interactor = LastImageInteractor()
        let router = LastImageRouter()
        
        let databaseManager = RealmNotificationDatabaseManager()
        let imageDownloadManager = ImageDownloadManagerImpl()
        let commonAlertsFactory = CommonAlertsFactoryImpl()
        
        viewController.presenter = presenter
        
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
