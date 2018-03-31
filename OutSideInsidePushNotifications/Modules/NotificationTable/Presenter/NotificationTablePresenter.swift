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
    
    // MARK: - View output implementation
    
    func viewIsReady() {
        getNotifications()
        view.registerCell()
        view.connectTableWithDataSource()
    }
    
    func viewDidAppear() {
        view.refreshNotificitaion()
    }

    func getNotifications() {
        interactor.getNotifications()
    }
    
    // MARK: - Interactor output implementation
    
    func didFinishingToGetNotifications(with result: Result<NotificationCellModel>) {
        switch result {
        case .success(let notifications):
            view.setCellModels(with: notifications)
            break
        case .failure(let errorResult):
            //возможно кинуть аллерт или ничего не делать
            break
        }
    
    }
}
