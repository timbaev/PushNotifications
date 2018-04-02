//
//  NotificationTableInteractor.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 30.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class NotificationTableInteractor: NotificationTableInteractorInput {
    
    weak var presenter: NotificationTableInteractorOutput!
    var notificationDataBaseManager: NotificationDatabaseManager!
    var imageDownloadManager: ImageDownloadManager!
    
    //MARK: - Interactor input implementation
    
    func subscripeToNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(getNotifications), name: .reloadNotifications)
    }
    
    func unsubscripeFromNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func getNotifications() {
        guard let notifications = notificationDataBaseManager.getAll() else { return  }
        let notificationsCellModel = notifications.map {
            NotificationCellModel(text: $0.text, title: $0.title, imageURL: $0.imageURL)
        }
        
        presenter.didFinishingToGetNotifications(with: .success(notificationsCellModel))
    }
    
    func downloadImage(from url: URL, at indexPath: IndexPath) {
        imageDownloadManager.downloadImage(from: url, success: { [weak self] (image) in
            guard let strongSelf = self else { return }
            guard let image = image else { return }
            let imageModel = ImageModel(image: image)
            strongSelf.presenter.didFinishLoadImage(at: indexPath, with: imageModel)
        }) { (errorMessage) in
            print("Failed download image at index \(indexPath.row) with URL: \(url.absoluteString)")
        }
    }
    
}
