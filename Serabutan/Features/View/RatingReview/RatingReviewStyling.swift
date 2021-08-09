//
//  RatingReviewStyling.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 08/08/21.
//

import UIKit

extension RatingReviewVC {
    func setupUser() {
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        profileImg.layer.masksToBounds = true
        profileImg.image = reviewedUser?.avatar
        
        namaLbl.font = .FontLibrary.title1
        namaLbl.text = reviewedUser?.name
    }
    
    func setupTextView() {
        reviewTextView.delegate = self
        reviewTextView.text = "Tulis review anda disini"
        reviewTextView.textColor = .ColorLibrary.mediumGrey
        reviewTextView.textContainerInset = .zero
        reviewTextView.textContainer.lineFragmentPadding = 0
    }
    
    func setupKirimBtn() {
        kirimBtn.layer.cornerRadius = 5
        kirimBtn.backgroundColor = .ColorLibrary.mediumGrey
        kirimBtn.isEnabled = false
        
        if (reviewTextView.textColor != .ColorLibrary.mediumGrey) && !reviewTextView.text.isEmpty && bintangTapped {
            kirimBtn.backgroundColor = .ColorLibrary.accentColor
            kirimBtn.isEnabled = true
        }
    }
}
