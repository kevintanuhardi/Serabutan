//
//  FloatingNotification.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 12/08/21.
//

import UIKit
import NotificationBannerSwift

class FloatingNotification {
    static let shared = FloatingNotification()
    
    init(){
    }
    
    func showNotification(title: String, subtitle: String, image: UIImage) {
        let notification = CustomNotification.createCustomNotification()
        let banner = FloatingNotificationBanner(customView: notification)
        
        notification.titleLabel?.text = title
        notification.subtitleLabel?.text = subtitle
        notification.leftImage?.image = image
        
        // Show notification banner
        banner.show(bannerPosition: .top,
                     queue: .default,
                     edgeInsets: UIEdgeInsets(top: 25, left: 10, bottom: 0, right: 10),
                     shadowColor: UIColor.ColorLibrary.mediumGrey,
                     shadowOpacity: 0.5,
                     shadowBlurRadius: 15,
                     shadowCornerRadius: 10,
                     shadowOffset: UIOffset(horizontal: 0, vertical: 10))
    }
}
