//
//  PhotoModel.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 01.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

struct ImageModel {
    
    let image: UIImage
    
    init(image: UIImage = #imageLiteral(resourceName: "no-image")) {
        self.image = image
    }
    
}
