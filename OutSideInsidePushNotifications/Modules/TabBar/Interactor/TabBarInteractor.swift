//
//  TabBarInteractor.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class TabBarInteractor: TabBarInteractorInput {
    
    weak var presenter: TabBarInteractorOutput!
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNotification), name: .pushHandler)
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func receiveNotification() {
        presenter.showDeatilScreen()
    }
    
}
