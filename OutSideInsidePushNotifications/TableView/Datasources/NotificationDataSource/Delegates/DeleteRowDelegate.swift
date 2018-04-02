//
//  DeleteRowDelegate.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DeleteRowDelegate {
    
    /// Handle delete row
    ///
    /// - Parameter indexPath: index of row position
    func didDeleteRow(at indexPath: IndexPath)
    
}
