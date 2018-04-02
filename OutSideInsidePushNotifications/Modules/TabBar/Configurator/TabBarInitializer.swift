//
//  TabBarInitializer.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class TabBarInitializer: NSObject {
    
    @IBOutlet weak var tabBarController: TabBarViewController!
    
    override func awakeFromNib() {
        let configurator = TabBarConfigurator()
        configurator.setupModule(with: tabBarController)
    }
    
}
