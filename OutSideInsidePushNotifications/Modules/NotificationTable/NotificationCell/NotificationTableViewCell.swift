//
//  NotificationTableViewCell.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 29.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationImage: UIImageView!
    @IBOutlet weak var notificationTitleLabel: UILabel!
    @IBOutlet weak var notificationTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    func prepareNotificationImage(with image: UIImage) {
        notificationImage.image = image
    }
    
    func prepareNotificationText(with text: String) {
        notificationTextLabel.text = text
    }
    
    func prepareNotificationTitle(with text: String) {
        notificationTitleLabel.text = text
    }
    
}
