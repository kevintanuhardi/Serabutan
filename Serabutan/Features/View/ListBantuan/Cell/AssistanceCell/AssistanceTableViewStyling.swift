//
//  AssistanceTableViewStyling.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import Foundation
import UIKit

extension AssistanceTableViewCell{
    
    func setViewStyling(){
        myContentView.layer.backgroundColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.00).cgColor
        setStatusView()
        setParentView()
        setGradientView()
        setAvailableAssistanceView()
        setWhatsappButtonView()
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
    
    func setParentView(){
        parentView.layer.masksToBounds = true
        parentView.layer.borderWidth = 0.5
        parentView.layer.cornerRadius = 5
        parentView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
    }
    
    func setFont(){
        // Default Card
        statusLabel.font = .FontLibrary.caption1
        headerLabel.font = .FontLibrary.body
        titleLabel.font = .FontLibrary.title1
        compensationLabel.font = .FontLibrary.title2
        posterLabel.font = .FontLibrary.textLink1
        timeElapsedLabel.font = .FontLibrary.body
        
        // Belum ada yang bersedia
        
        // Anda bersedia membantu
        
        // Helper bersedia membantu
        helperNameLabel.font = .FontLibrary.textLink1
        timeElapsedLabel.font = .FontLibrary.body
    }
    
    func setColor(){
        titleLabel.tintColor = .ColorLibrary.customBlack
        posterLabel.tintColor = .ColorLibrary.customBlack
        
        headerLabel.tintColor = .ColorLibrary.darkGrey
        compensationLabel.tintColor = .ColorLibrary.darkGrey
        timeElapsedLabel.tintColor = .ColorLibrary.darkGrey
    }
    
    func setGradientView(){
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        gradient.colors = [UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.00).cgColor, UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.35, y: 0.0)
        gradientView.layer.addSublayer(gradient)
    }
    
    func setAvailableAssistanceView(){
        availableInsetView.layer.backgroundColor = UIColor(red: 0.49, green: 0.49, blue: 0.49, alpha: 0.05).cgColor
        availableView.layer.cornerRadius = 5
    }
    
    func setWhatsappButtonView(){
        whatsappView.layer.backgroundColor = UIColor(red: 0.49, green: 0.81, blue: 0.43, alpha: 0.10).cgColor
        whatsappView.layer.cornerRadius = 5
        whatsappButton.setTitleColor(UIColor(red: 0.22, green: 0.63, blue: 0.08, alpha: 1.00), for: .normal)
    }
}
