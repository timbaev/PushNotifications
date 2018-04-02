//
//   NotificationTableRouter.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 30.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationTableRouter: NotificationTableRouterInput {
    
    weak var viewController: UIViewController!
    let detailScreenSegueIdentifier = "showDetailScreen"
    
    func showDetailScreen(with index: Int) {
        viewController.performSegue(withIdentifier: detailScreenSegueIdentifier, sender: index)
    }
    
}
