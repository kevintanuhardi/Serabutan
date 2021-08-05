//
//  JobListViewStyle.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 05/08/21.
//

import Foundation
import UIKit

extension JobListCell {
    func setViewStyling(){
        setStatusView()
        setMainView()
        setFont()
    }
    
    func setStatusView(){
        statusView.layer.masksToBounds = true
        statusView.layer.borderWidth = 0.5
        statusView.layer.cornerRadius = 5
        
        posterImage.layer.masksToBounds = true
        posterImage.layer.cornerRadius = posterImage.frame.height / 2
    }
    
    func setStatusView(urgency: Urgency){
        
        var colorSolid = UIColor()
        var colorTransparent = UIColor()
        
        switch urgency {
        case .high :
            colorSolid = .ColorLibrary.highUrgency
            colorTransparent = .ColorLibrary.highUrgencyBackground
            statusLabel.text = urgency.rawValue
        case .medium:
            colorSolid = .ColorLibrary.mediumUrgency
            colorTransparent = .ColorLibrary.mediumUrgencyBackground
            statusLabel.text = urgency.rawValue
        case .low:
            colorSolid = .ColorLibrary.lowUrgency
            colorTransparent = .ColorLibrary.lowUrgencyBackground
            statusLabel.text = urgency.rawValue
        }
        
        statusImage.tintColor = colorSolid
        statusView.layer.borderColor = colorSolid.cgColor
        statusView.layer.backgroundColor = colorTransparent.cgColor
        
    }
    
    func setMainView(){
        mainView.layer.masksToBounds = true
        mainView.layer.borderWidth = 0.5
        mainView.layer.cornerRadius = 5
        mainView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
    }
    
    func setFont(){
        // Default Card
        statusLabel.font = .FontLibrary.caption1
        headerLabel.font = .FontLibrary.body
        titleLabel.font = .FontLibrary.title1
        compensationLabel.font = .FontLibrary.title2
        posterLabel.font = .FontLibrary.textLink1
        timeElapsedLabel.font = .FontLibrary.body
        
    }
    
    func setColor(){
        titleLabel.tintColor = .ColorLibrary.customBlack
        posterLabel.tintColor = .ColorLibrary.customBlack
        
        headerLabel.tintColor = .ColorLibrary.darkGrey
        compensationLabel.tintColor = .ColorLibrary.darkGrey
        timeElapsedLabel.tintColor = .ColorLibrary.darkGrey
    }
}
