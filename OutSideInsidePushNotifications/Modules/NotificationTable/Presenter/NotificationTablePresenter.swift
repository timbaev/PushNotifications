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
    var router: NotificationTableRouterInput!
    var interactor: NotificationTableInteractorInput!
    
    // MARK: - View output implementation
    
    func viewIsReady() {
        view.registerCell()
        view.setTableViewArguments()
        view.connectTableWithDataSource()
        interactor.getNotifications()
    }
    
    func viewDidAppear() {
        interactor.getNotifications()
    }

    func getNotifications() {
        interactor.getNotifications()
    }
    
    func didSelectNotification(at indexPath: IndexPath) {
        router.showDetailScreen(with: indexPath.row)
    }
    
    func subscripeToNotifications() {
        interactor.subscripeToNotifications()
    }
    
    func unsubscripeFromNotifications() {
        interactor.unsubscripeFromNotifications()
    }
 
    // MARK: - Interactor output implementation
    
    func didFinishingToGetNotifications(with result: Result<NotificationCellModel>) {
        switch result {
        case .success(let notifications):
            view.setCellModels(with: notifications)
            view.reloadTableView()
            break
        case .failure(let errorResult):
            //возможно кинуть аллерт или ничего не делать
            break
        }
    }
    
    func didFinishLoadImage(at indexPath: IndexPath, with imageModel: ImageModel) {
        view.set(image: imageModel.image, to: indexPath)
    }
}

extension NotificationTablePresenter: DownloadImageDelegate {
    
    func downloadImage(for url: URL, at indexPath: IndexPath) {
        interactor.downloadImage(from: url, at: indexPath)
    }
    
}
