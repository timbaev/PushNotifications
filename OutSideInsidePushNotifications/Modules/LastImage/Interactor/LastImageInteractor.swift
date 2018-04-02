//
//  LastImageInteractor.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 01.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class LastImageInteractor: LastImageInteractorInput {
    
    weak var presenter: LastImageInteractorOutput!
    var databaseManager: NotificationDatabaseManager!
    var imageDownloadManager: ImageDownloadManager!
    
    func loadLastImage() {
        guard let notificationModel = databaseManager.getLast() else { return }
        if let imageURL = notificationModel.imageURL {
            imageDownloadManager.downloadImage(from: imageURL, success: { [weak self] (image) in
                guard let strongSelf = self else { return }
                if let image = image {
                    let imageModel = ImageModel(image: image)
                    strongSelf.presenter.didFinishLoadImage(with: .success(imageModel))
                } else {
                    strongSelf.presenter.didFinishLoadImage(with: .success(ImageModel()))
                }
            }) { [weak self] (errorMessage) in
                guard let strongSelf = self else { return }
                strongSelf.presenter.didFinishLoadImage(with: .failure(errorMessage))
            }
        }
    }
    
}
