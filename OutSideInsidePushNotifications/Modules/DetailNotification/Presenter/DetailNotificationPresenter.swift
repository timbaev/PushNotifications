//
//  DetailNotificationPresenter.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DetailNotificationPresenter: DetailNotificationViewOutput, DetailNotificationInteractorOutput, ModuleInput {
    
    weak var view: DetailNotificationViewInput!
    var interactor: DetailNotificationInteractorInput!
    var router: DetailNotificationRouterInput!
    
    //MARK: - Module input
    
    func setData(_ data: Any?) {
        guard let index = data as? Int else { return }
        interactor.getModel(with: index)
    }
    
    //MARK: - Interactor output
    
    func didFinishGettingModel(with model: NotificationModel) {
        if let title = model.title {
            view.set(title: title)
        } else {
            view.hideTitleSection()
        }
        
        if let text = model.text {
            view.set(text: text)
        } else {
            view.hideTextSection()
        }
        
        if let imageURL = model.imageURL {
            interactor.downloadImage(from: imageURL)
        } else {
            view.hideImageSection()
        }
    }
    
    func didFinishImageDownload(with result: EnumResult<ImageModel?>) {
        switch result {
        case .success(let imageModel):
            guard let image = imageModel?.image else {
                view.hideImageSection()
                return
            }
            view.set(image: image)
            break
        case .failure(let errorMessage):
            router.showErrorAlert(with: errorMessage)
            break
        }
    }
    
}
