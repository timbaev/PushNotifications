//
//  NotificationTableInitializer.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 30.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class NotificationTableInitializer: NSObject {
    
    @IBOutlet weak var viewController: NotificationTableViewController!
    
    override func awakeFromNib() {
        let configurator = NotificationTableConfigurator()
        configurator.setupModule(with: viewController)
    }
    
}
