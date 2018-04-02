//
//  LastImageInteractorOutput.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 01.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol LastImageInteractorOutput: class {
    
    /// Finish loading of image
    ///
    /// - Parameter result: enum with results
    func didFinishLoadImage(with result: Result<ImageModel>)
    
}
