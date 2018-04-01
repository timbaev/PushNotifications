//
//  LastImagePresenter.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 01.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class LastImagePresenter: LastImageViewOutput, LastImageInteractorOutput {
    
    weak var view: LastImageViewInput!
    var interactor: LastImageInteractorInput!
    var router: LastImageRouterInput!
    
    //MARK: - View input
    
    func viewIsReady() {
        interactor.loadLastImage()
    }
    
    //MARK: - Interactor output
    
    func didFinishLoadImage(with result: EnumResult<ImageModel>) {
        switch result {
        case .success(let imageModel):
            view.set(lastImage: imageModel.image)
            break
        case .failure(let errorMessage):
            router.showErrorAlert(with: errorMessage)
            break
        }
    }
    
}
