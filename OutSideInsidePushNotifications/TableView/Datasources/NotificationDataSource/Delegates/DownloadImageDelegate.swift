//
//  DownloadImageDelegate.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DownloadImageDelegate {
 
    /// Download image from URl
    ///
    /// - Parameters:
    ///   - url: URL of image
    ///   - indexPath: index of cell position
    func downloadImage(for url: URL, at indexPath: IndexPath)
    
}
