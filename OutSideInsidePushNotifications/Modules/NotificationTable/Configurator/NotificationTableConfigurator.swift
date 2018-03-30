//
//  NotificationTableConfigurator.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 30.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class NotificationTableConfigurator {
    
    func setupModel(with viewController: NotificationTableViewController) {
        let presenter = NotificationTablePresenter()
        let interactor = NotificationTableInteractor()
        //let router = NotificationTableRouter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.presenter = presenter
     
    }
}
