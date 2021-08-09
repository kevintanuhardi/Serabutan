//
//  ProfileVCStyling.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 08/08/21.
//

import UIKit

extension ProfileVC {
    func updateUI() {
        setProfileStyle()
        setProfileContent()
    }
    
    func setProfileStyle() {
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
        ratingBadge.layer.cornerRadius = ratingBadge.frame.height / 2
        ratingBadge.layer.masksToBounds = true
        ratingBadge.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        ratingBadge.layer.borderWidth = 0.5
        profileInfoView.addLine(position: .bottom, color: UIColor.ColorLibrary.mediumGrey, width: 0.5)
    }
    
    func setProfileContent() {
        profileImage.image = user?.avatar
        profileName.text = user?.name
        profileJoinDate.text = "Bergabung \(StringFormatter().dateFormatter(date: user?.joinDate ?? Date()))"
        profileBio.text = user?.bio
        ratingAggregate.text = "\(user?.statistics?.reviewAggregate ?? 0)"
        ratingTotal.text = "(\(user?.statistics?.totalReview ?? 0))"
        totalDibantu.attributedText = StringFormatter().styleCombiner(firstWord: "\(user?.statistics?.dibantu ?? 0)",
                                                                      secondWord: " Dibantu",
                                                                      style: .dualStyle)
        totalMembantu.attributedText = StringFormatter().styleCombiner(firstWord: "\(user?.statistics?.membantu ?? 0)",
                                                                      secondWord: " Membantu",
                                                                      style: .dualStyle)
        profileVerified.isHidden = user!.isVerified
    }
}
