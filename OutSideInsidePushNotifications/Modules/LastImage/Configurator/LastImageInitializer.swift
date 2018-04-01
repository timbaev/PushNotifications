//
//  LastImageInitializer.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 01.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class LastImageInitializer: NSObject {
    
    @IBOutlet weak var viewController: LastImageViewController!
    
    override func awakeFromNib() {
        let configurator = LastImageConfigurator()
        configurator.setupModule(with: viewController)
    }
    
}
