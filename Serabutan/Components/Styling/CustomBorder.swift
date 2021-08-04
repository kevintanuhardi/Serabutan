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
        case Top, Bottom
    }
    
    func addLine(position: LinePosition, color: UIColor, width: Double) {
            let lineView = UIView()
            lineView.backgroundColor = color
            lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
            self.addSubview(lineView)

            let metrics = ["width" : NSNumber(value: width)]
            let views = ["lineView" : lineView]
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))

            switch position {
            case .Top:
                self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
                break
            case .Bottom:
                self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
                break
            }
        }
}
