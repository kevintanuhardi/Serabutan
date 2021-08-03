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
    }
    
    func setStatusView(){
        statusView.layer.masksToBounds = true
        statusView.layer.backgroundColor = UIColor(red: 0.91, green: 0.60, blue: 0.00, alpha: 0.30).cgColor
        statusView.layer.borderColor = UIColor(red: 0.91, green: 0.60, blue: 0.00, alpha: 0.70).cgColor
        statusView.layer.borderWidth = 1
        statusView.layer.cornerRadius = 5
        statusImage.tintColor = UIColor(red: 0.91, green: 0.60, blue: 0.00, alpha: 1.00)
    }
    
    func setParentView(){
        parentView.layer.masksToBounds = true
        parentView.layer.borderWidth = 0.5
        parentView.layer.cornerRadius = 5
        parentView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.50).cgColor
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
