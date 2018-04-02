//
//  TabBarViewController.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, TabBarViewInput {
    
    var presenter: TabBarViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let notificationName = appDelegate.notificationName
        
        presenter.registerNotification(with: notificationName)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.unregisterNotifications()
    }

}
