//
//  LastImgeViewController.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 01.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class LastImageViewController: UIViewController, LastImageViewInput {
    
    @IBOutlet weak var lastImageView: UIImageView!
    
    var presenter: LastImageViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    //MARK: - View input
    
    func set(lastImage: UIImage) {
        lastImageView.image = lastImage
    }

}
