//
//  DetailNotificationInteractor.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DetailNotificationInteractor: DetailNotificationInteractorInput {
    
    private var currentIndex: Int?
    
    weak var presenter: DetailNotificationInteractorOutput!
    var databaseManager: NotificationDatabaseManager!
    var imageDownloadManager: ImageDownloadManager!
    
    func configure(with index: Int) {
        currentIndex = index
    }
    
    func getModel() {
        guard let index = currentIndex else { return }
        guard let notificationModel = databaseManager.get(at: index) else { return }
        presenter.didFinishGettingModel(with: notificationModel)
    }
    
    func downloadImage(from url: URL) {
        imageDownloadManager.downloadImage(from: url, success: { [weak self] (image) in
            guard let strongSelf = self else { return }
            if let image = image {
                strongSelf.presenter.didFinishImageDownload(with: .success(ImageModel(image: image)))
            } else {
                strongSelf.presenter.didFinishImageDownload(with: .success(nil))
            }
        }) { [weak self] (errorMessage) in
            guard let strongSelf = self else { return }
            strongSelf.presenter.didFinishImageDownload(with: .failure(errorMessage))
        }
    }
    
}
