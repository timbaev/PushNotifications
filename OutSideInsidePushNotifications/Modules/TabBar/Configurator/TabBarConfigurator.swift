//
//  TabBarConfigurator.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class TabBarConfigurator {
    
    func setupModule(with viewController: TabBarViewController) {
        let presenter = TabBarPresenter()
        let interactor = TabBarInteractor()
        let router = TabBarRouter()
    
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.viewController = viewController
    }
    
}
