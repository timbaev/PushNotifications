//
//  ImageSaver.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 28.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class ImageDiskUtil {
    
    /// Save image into the disk
    ///
    /// - Parameter image: image to save
    /// - Returns: generated unique image name
    static func saveImage(_ image: UIImage) -> String? {
        let timestampFilename = String(Int(Date().timeIntervalSince1970)) + ".jpg"
        
        let filenamePath = URL(fileReferenceLiteralResourceName: getDocumentsDirectory().appendingPathComponent(timestampFilename))
        guard let data = UIImageJPEGRepresentation(image, 1.0) else { return nil }
        do {
            try data.write(to: filenamePath)
            return timestampFilename
        } catch {
            print("!!! Error saving image to disk !!!")
            print(error.localizedDescription)
            return nil
        }
    }
    
    /// Load image from disk
    ///
    /// - Parameter name: name of image file
    /// - Returns: prepared UIImage object, if exists
    static func loadImage(with name: String) -> UIImage? {
        let imgPath = getDocumentsDirectory().appendingPathComponent(name)
        let image = loadImage(from: imgPath)
        return image
    }
    
    /// Load image from path
    ///
    /// - Parameter path: path to image
    /// - Returns: prepared UIImage object, if exists
    private static func loadImage(from path: String) -> UIImage? {
        let image = UIImage(contentsOfFile: path)
        return image
    }
    
    /// Get app documents directory
    ///
    /// - Returns: path to documents directory
    private static func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths[0]
        return documentDirectory as NSString
    }
    
}
