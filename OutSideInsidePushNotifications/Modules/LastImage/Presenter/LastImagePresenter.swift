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
    
}
