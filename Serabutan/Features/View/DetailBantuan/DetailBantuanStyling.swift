//
//  DetailBantuanStyling.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 04/08/21.
//

import Foundation

extension DetailBantuanVC {
    
    func setFont() {
        jobTitleLabel.font = .FontLibrary.largeTitle
        jobGiverLabel.font = .FontLibrary.textLink1
        salaryLabel.font = .FontLibrary.title2
        timePostElapsed.font = .FontLibrary.body
        distanceToJob.font = .FontLibrary.body
        descriptionLabel.font = .FontLibrary.headline
    }
    
    func setColor() {
        jobTitleLabel.textColor = .ColorLibrary.customBlack
        jobGiverLabel.textColor = .ColorLibrary.customBlack
        salaryLabel.textColor = .ColorLibrary.darkGrey
        timePostElapsed.textColor = .ColorLibrary.darkGrey
        distanceToJob.textColor = .ColorLibrary.darkGrey
        descriptionLabel.textColor = .ColorLibrary.customBlack
    }
    
}
