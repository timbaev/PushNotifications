//
//  DetailNotificationInitializer.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DetailNotificationInitializer: NSObject {
    
    @IBOutlet weak var viewController: DetailNotificationViewController!
    
    override func awakeFromNib() {
        let configurator = DetailNotificationConfigurator()
        configurator.setupModule(with: viewController)
    }
    
}
