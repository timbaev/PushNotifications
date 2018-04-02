//
//  TabBarPresenter.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class TabBarPresenter: TabBarViewOutput {
    
    weak var view: TabBarViewInput!
    var router: TabBarRouterInput!
    
    let firstNotificationIndex = 0
    
    //MARK: - View output
    
    func showDeatilScreen() {
        router.showDeatilScreen(with: firstNotificationIndex)
    }
    
}
