//
//  NotificationCellModel.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 30.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

/// Model for data transmission
protocol CellModel {
    var text: String? { get set }
    var title: String? { get set }
    var imageURL: URL? { get set }
}
