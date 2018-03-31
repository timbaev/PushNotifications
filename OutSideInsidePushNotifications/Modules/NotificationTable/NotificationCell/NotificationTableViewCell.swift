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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        notificationImage.image = nil
    }
 
    func prepare(with notificationCellModel: CellModel) {
        
        if let url = notificationCellModel.imageURL {
            notificationImage.downloadedFrom(url: url)
        }
        
        notificationTextLabel.text = notificationCellModel.text
        notificationTitleLabel.text = notificationCellModel.text
    }
    
}
