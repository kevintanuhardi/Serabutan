//
//  CustomNotificationStyling.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 12/08/21.
//

import Foundation
import UIKit

extension CustomNotification {
    
    func setupUI(){
        // View
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        self.layer.masksToBounds = true
        
        // Content
        leftImage?.layer.cornerRadius = (leftImage?.frame.height ?? 17) / 2
        titleLabel?.font = .FontLibrary.bodyBold
        subtitleLabel?.font = .FontLibrary.footnote
        titleLabel?.textColor = .ColorLibrary.customBlack
        subtitleLabel?.textColor = .ColorLibrary.darkGrey
    }
    
}
