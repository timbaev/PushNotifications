//
//  DetailNotificationViewController.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 02.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class DetailNotificationViewController: UIViewController, DetailNotificationViewInput, ModuleInputHolder {
    
    var presenter: DetailNotificationViewOutput!
    var moduleInput: ModuleInput?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var titleHeaderLabel: UILabel!
    @IBOutlet weak var textHeaderLabel: UILabel!
    @IBOutlet weak var imageHeaderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - View input
    
    func set(title titleText: String) {
        titleLabel.text = titleText
    }
    
    func set(text bodyText: String) {
        textLabel.text = bodyText
    }
    
    func set(image notificationImage: UIImage) {
        notificationImageView.image = notificationImage
    }
    
    func hideTitleSection() {
        titleHeaderLabel.isHidden = true
        titleLabel.isHidden = true
    }
    
    func hideTextSection() {
        textHeaderLabel.isHidden = true
        textLabel.isHidden = true
    }
    
    func hideImageSection() {
        imageHeaderLabel.isHidden = true
        notificationImageView.isHidden = true
    }
    
}
