//
//  TabBarRouter.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class TabBarRouter: TabBarRouterInput {
    
    weak var viewController: UIViewController!
    
    private let notificationsTableIndex = 1
    private let showDetailsSegueIdentifier = "showDetailScreen"
    
    func showDeatilScreen(with notificationIndex: Int) {
        guard let tabBarController = viewController as? UITabBarController else { return }
        tabBarController.selectedIndex = notificationsTableIndex
        
        let notificationsNavController = tabBarController.viewControllers?[notificationsTableIndex] as? UINavigationController
        let notificationsViewController = notificationsNavController?.topViewController as? NotificationTableViewController
        
        notificationsViewController?.performSegue(withIdentifier: showDetailsSegueIdentifier, sender: notificationIndex)
    }
    
}
