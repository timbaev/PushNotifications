//
//  NotificationService.swift
//  NotificationServiceExtension
//
//  Created by Damir Zaripov on 28.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {
    
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    let imageFileIdentifier = "image.gif"
    
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
       
        func failEarly() {
            contentHandler(request.content)
        }
        
        guard let content = (request.content.mutableCopy() as? UNMutableNotificationContent) else {
            return failEarly()
        }
        
        guard let apnsData = content.userInfo["data"] as? [String: Any] else {
            return failEarly()
        }
        
        guard let attachmentURL = apnsData["attachment-url"] as? String else {
            return failEarly()
        }
        
        guard let url = URL(string: attachmentURL), let imageData = NSData(contentsOf: url) else {
            return failEarly()
        }
        
        guard let attachment = UNNotificationAttachment.create(imageFileIdentifier: imageFileIdentifier, data: imageData, options: nil) else {
            return failEarly()
        }
        
        content.attachments = [attachment]
        contentHandler(content.copy() as! UNNotificationContent)
    }
    
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }
}

// Download image for show push notification

extension UNNotificationAttachment {
    static func create(imageFileIdentifier: String, data: NSData, options: [NSObject : AnyObject]?) -> UNNotificationAttachment? {
        let fileManager = FileManager.default
        let tmpSubFolderName = ProcessInfo.processInfo.globallyUniqueString
        let fileURLPath = NSURL(fileURLWithPath: NSTemporaryDirectory())
        let tmpSubFolderURL = fileURLPath.appendingPathComponent(tmpSubFolderName, isDirectory: true)
        
        do {
            guard let url = tmpSubFolderURL else { return nil}
            try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            guard let fileURL = tmpSubFolderURL?.appendingPathComponent(imageFileIdentifier) else { return nil}
            try data.write(to: fileURL, options: [])
            let imageAttachment = try UNNotificationAttachment.init(identifier: imageFileIdentifier, url: fileURL, options: options)
            return imageAttachment
        }
        catch let error {
            print("error \(error)") }
        return nil
    }
}
