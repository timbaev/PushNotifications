//
//  NotificationView.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 27.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    private let defaultHeight: CGFloat = 100
    private let notificationViewNib = "NotificationView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    init(width: CGFloat) {
        super.init(frame: CGRect(x: 0, y: -defaultHeight, width: width, height: defaultHeight))
        commonInit()
    }
    
    func set(title: String?) {
        titleLabel.text = title
    }
    
    func set(text: String?) {
        textLabel.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(notificationViewNib, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSwipeGesture()
    }
    
    private func addSwipeGesture() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(onSwipped(gesture:)))
        swipeUp.direction = .up
        contentView.addGestureRecognizer(swipeUp)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:)))
        contentView.addGestureRecognizer(tap)
    }
    
    @objc private func handleTap(gesture: UIGestureRecognizer) {
        //Do something
        hideAnimate()
    }
    
    @objc private func onSwipped(gesture: UIGestureRecognizer) {
        hideAnimate()
    }
    
    @objc private func hideAnimate() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.frame.origin.y -= strongSelf.defaultHeight
        }
    }
    
    func showAnimate() {
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.frame.origin.y += strongSelf.defaultHeight
        }) { [weak self] (completion) in
            guard let strongSelf = self else { return }
            let _ = Timer.scheduledTimer(timeInterval: 3.0, target: strongSelf, selector: #selector(strongSelf.hideAnimate), userInfo: nil, repeats: false)
        }
    }

}
