//
//  CustomBorder.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 01/08/21.
//

import Foundation
import UIKit

extension UIView {
    enum LinePosition {
        case top, bottom
    }
    
    enum AnimationType {
        case border, color
    }
    
    func addLine(position: LinePosition, color: UIColor, width: Double) {
        
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.restorationIdentifier = "Border"
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position {
        case .top:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .bottom:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
            
        }
    }
    
    func animateBorder(_ status: Bool, type: AnimationType) {
        
        let firstColor: UIColor = status ? .ColorLibrary.mediumGrey : .ColorLibrary.accentColor
        let secondColor: UIColor = status ? .ColorLibrary.accentColor : .ColorLibrary.mediumGrey
        let firstBorder: CGFloat = status ? 0.5 : 1.5
        let secondBorder: CGFloat = status ? 1.5 : 0.5
        
        let borderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        let borderWidthAnimation = CABasicAnimation(keyPath: "borderWidth")
        let backgroundColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        
        let animationGroup = CAAnimationGroup()
        
        borderColorAnimation.fromValue = firstColor.cgColor
        borderColorAnimation.toValue = secondColor.cgColor
        borderWidthAnimation.fromValue = firstBorder
        borderWidthAnimation.toValue = secondBorder
        animationGroup.duration = 0.25
        
        switch type {
        case .border:
            animationGroup.animations = [borderColorAnimation, borderWidthAnimation]
            self.layer.add(animationGroup, forKey: nil)
            self.layer.borderWidth = secondBorder
            self.layer.borderColor = secondColor.cgColor
        case .color:
            animationGroup.animations = [borderColorAnimation, backgroundColorAnimation]
            self.layer.add(animationGroup, forKey: nil)
            self.layer.borderWidth = secondBorder
            self.layer.borderColor = secondColor.cgColor
            self.backgroundColor = secondColor
        }
    }
}
