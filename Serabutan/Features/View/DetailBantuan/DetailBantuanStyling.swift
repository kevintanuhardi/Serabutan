//
//  DetailBantuanStyling.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 04/08/21.
//

import Foundation
import UIKit

extension DetailBantuanVC {
    
    func setupUI(){
        setNavigation()
        setNavigationItems()
        setFont()
        setColor()
        setStyle()
        configureText()
        configureHelper()
    }
    
    func setStyle() {
        setStatusView(urgency: selectedJob.urgency)
        urgencyView.layer.borderWidth = 0.5
        urgencyView.layer.cornerRadius = urgencyView.frame.height / 2
        urgencyView.layer.masksToBounds = true
        
        jobPosterAvatar.layer.cornerRadius = jobPosterAvatar.frame.height / 2
        jobPosterAvatar.layer.masksToBounds = true
        
        helperAvatar.layer.cornerRadius = jobPosterAvatar.frame.height / 2
        helperAvatar.layer.masksToBounds = true
        
        helpFinishButton.layer.cornerRadius = 10
        helperView.layer.cornerRadius = 5
        helperView.layer.masksToBounds = true
        
        floatingBottom.dropShadow(scale: true)
        separatorHeight.constant = 0.5
    }
    
    func setFont() {
        jobTitleLabel.font = .FontLibrary.largeTitle
        jobPosterName.titleLabel?.font = .FontLibrary.textLink1
        helperName.titleLabel?.font = .FontLibrary.textLink1
        salaryLabel.font = .FontLibrary.title2
        timePostElapsed.font = .FontLibrary.body
        distanceToJob.font = .FontLibrary.body
        descriptionLabel.font = .FontLibrary.headline
        helpStatusLabel.font = .FontLibrary.body
        helpFinishButton.titleLabel?.font = .FontLibrary.button
    }
    
    func setColor() {
        jobTitleLabel.textColor = .ColorLibrary.customBlack
        jobPosterName.tintColor = .ColorLibrary.customBlack
        salaryLabel.textColor = .ColorLibrary.darkGrey
        timePostElapsed.textColor = .ColorLibrary.darkGrey
        distanceToJob.textColor = .ColorLibrary.darkGrey
        descriptionLabel.textColor = .ColorLibrary.customBlack
        helpStatusLabel.textColor = .ColorLibrary.darkGrey
    }
    
    func configureText() {
        urgencyLabel.text = selectedJob.urgency.rawValue
        jobTitleLabel.text = selectedJob.title
        salaryLabel.text = StringFormatter().priceFormatting(amount: selectedJob.price)
        jobPosterName.titleLabel?.text = selectedJob.jobPosterId.name
        jobPosterName.setTitle(selectedJob.jobPosterId.name, for: .normal)
        jobPosterAvatar.image = selectedJob.jobPosterId.avatar
        timePostElapsed.text = StringFormatter().relativeDateFormatter(date: selectedJob.postingDate)
        distanceToJob.text = StringFormatter().distance(selectedJob.distance)
        descriptionLabel.text = selectedJob.desc
    }
    
    func setStatusView(urgency: Urgency){
        
        var colorSolid = UIColor()
        var colorTransparent = UIColor()
        
        switch urgency {
        case .high :
            colorSolid = .ColorLibrary.highUrgency
            colorTransparent = .ColorLibrary.highUrgencyBackground
            urgencyLabel.text = urgency.rawValue
        case .medium:
            colorSolid = .ColorLibrary.mediumUrgency
            colorTransparent = .ColorLibrary.mediumUrgencyBackground
            urgencyLabel.text = urgency.rawValue
        case .low:
            colorSolid = .ColorLibrary.lowUrgency
            colorTransparent = .ColorLibrary.lowUrgencyBackground
            urgencyLabel.text = urgency.rawValue
        }
        
        urgencyCircleFill.tintColor = colorSolid
        urgencyView.layer.borderColor = colorSolid.cgColor
        urgencyView.layer.backgroundColor = colorTransparent.cgColor
        
    }
    
    func configureHelper() {
        
        checkUser()
        
        switch selectedJob.status {
        case .taken :
            helperName.isHidden = false
            chatButton.isHidden = false
            
            helpFinishButton.setTitle("Selesai", for: .normal)
            helpStatusLabel.text = "bersedia membantu."
            
        case .active:
            helperAvatar.isHidden = true
            helperName.isHidden = true
            chatButton.isHidden = true
            helperVerified.isHidden = true
            
            helpFinishButton.setTitle("Saya Bersedia Membantu", for: .normal)
            helpStatusLabel.text = "Belum ada yang bersedia membantu."
        case .cancelled:
            break
        case .done:
            helpFinishButton.setTitle("Bantuan Telah Selesai", for: .normal)
            helpFinishButton.backgroundColor = .systemGreen
            chatButton.isHidden = true
        }
    }
    
    func checkUser() {
        var helper : UserProfile?
        let currentUser = UserDefaults.standard.value(forKey: "loggedUser") as! Int
        
        if selectedJob.helperId == nil || selectedJob.helperId?.id == currentUser {
            // If the job is taken by current user or is currently nil
            selectedJob.helperId = DummyData.shared.getUserProfile()[currentUser]
            helper = selectedJob.helperId
            helperAvatar.isHidden = true
            helperVerified.isHidden = true
            helperName.setTitle("Anda", for: .normal)
            
        } else {
            // If the job was taken by other user
            helperAvatar.image = helper?.avatar
            helperName.setTitle(helper?.name, for: .normal)
            helperAvatar.isHidden = false
            helperAvatar.isHidden = false
            helperVerified.isHidden = false
            helper!.isVerified ? (helperVerified.isHidden = true) : (helperVerified.isHidden = false)
            
        }
    }
    
}
