//
//  NotificationTableViewCell.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 29.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var notificationTitleLabel: UILabel!
    @IBOutlet weak var notificationTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        notificationImageView.image = #imageLiteral(resourceName: "no-image")
    }
 
    func prepare(with cellModel: CellModel) {
        notificationImageView.layer.cornerRadius = notificationImageView.frame.size.width / 2
        notificationImageView.clipsToBounds = true
        
        notificationTitleLabel.isHidden = false
        notificationTextLabel.isHidden = false
        
        if let title = cellModel.title {
            notificationTitleLabel.text = title
        } else {
            notificationTitleLabel.isHidden = true
        }
        
        if let text = cellModel.text {
            notificationTextLabel.text = text
        } else {
            notificationTextLabel.isHidden = true
        }
    }
    
}
