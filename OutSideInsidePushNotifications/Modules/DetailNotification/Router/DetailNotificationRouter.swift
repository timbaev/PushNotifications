//
//  DetailNotificationRouter.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class DetailNotificationRouter: DetailNotificationRouterInput {
    
    weak var viewController: UIViewController!
    var commonAlertsFactory: CommonAlertsFactoryProtocol!
    
    func showErrorAlert(with message: String) {
        let alert = commonAlertsFactory.getErrorAlert(with: message)
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
