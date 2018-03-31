//
//  NotificationModel.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 28.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

struct NotificationModel: Codable {
    
    let title: String?
    let text: String?
    var imageURL: URL?
    let created: Date
    
    init(title: String?, text: String?, imageURL: URL?, created: Date = Date()) {
        self.title = title
        self.text = text
        self.imageURL = imageURL
        self.created = created
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let aps = try values.nestedContainer(keyedBy: ApsCodingKeys.self, forKey: .aps)
        
        do {
            let alertText = try aps.decodeIfPresent(String.self, forKey: .alert)
            title = alertText
            imageURL = nil
            text = nil
        } catch {
            let alert = try aps.nestedContainer(keyedBy: AlertCodingKeys.self, forKey: .alert)
            title = try alert.decodeIfPresent(String.self, forKey: .title)
            text = try alert.decodeIfPresent(String.self, forKey: .body)
            imageURL = nil
            
            if values.contains(.data) {
                let data = try values.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
                imageURL = try data.decodeIfPresent(URL.self, forKey: .attachmentURL)
            }
        }
        
        created = Date()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var aps = container.nestedContainer(keyedBy: ApsCodingKeys.self, forKey: .aps)
        var data = container.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
        
        var alert = aps.nestedContainer(keyedBy: AlertCodingKeys.self, forKey: .alert)
        try alert.encodeIfPresent(title, forKey: .title)
        try alert.encodeIfPresent(text, forKey: .body)
        
        try data.encodeIfPresent(imageURL, forKey: .attachmentURL)
    }
    
    enum CodingKeys: String, CodingKey {
        case aps
        case data
    }
    
    enum ApsCodingKeys: String, CodingKey {
        case alert
        case badge
        case sound
        case mutableContent = "mutable-content"
    }
    
    enum AlertCodingKeys: String, CodingKey {
        case body
        case title
    }
    
    enum DataCodingKeys: String, CodingKey {
        case attachmentURL = "attachment-url"
    }
    
}
