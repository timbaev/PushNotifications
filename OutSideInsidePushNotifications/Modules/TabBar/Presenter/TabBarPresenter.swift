//
//  TabBarPresenter.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class TabBarPresenter: TabBarViewOutput, TabBarInteractorOutput {
    
    weak var view: TabBarViewInput!
    var interactor: TabBarInteractorInput!
    var router: TabBarRouterInput!
    
    let firstNotificationIndex = 0
    
    //MARK: - View output
    
    func showDeatilScreen() {
        router.showDeatilScreen(with: firstNotificationIndex)
    }
    
    func registerNotification() {
        interactor.registerNotification()
    }
    
    func unregisterNotifications() {
        interactor.removeObserver()
    }
    
}
