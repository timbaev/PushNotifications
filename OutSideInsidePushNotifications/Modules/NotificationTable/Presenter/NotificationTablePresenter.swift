//
//  NotificationTablePresenter.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 30.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class NotificationTablePresenter: NotificationTableViewOutput, NotificationTableInteractorOutput {
    
    weak var view: NotificationTableViewInput!
    var interactor: NotificationTableInteractorInput!
    
    
    // MARK: - View output
    
    func setNotifications() {
        
    }
    
    // MARK: - Interactor output
    
    func didFinishToSetNotifications() {
        
    }
    
}
