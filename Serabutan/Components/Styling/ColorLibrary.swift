//
//  ColorLibrary.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 01/08/21.
//

import Foundation
import UIKit

extension UIColor {
    struct ColorLibrary {
        // Main Color
        static var accentColor: UIColor { return UIColor(named: "AccentColor") ?? UIColor.clear }
        static var customBlack: UIColor { return UIColor(named: "CustomBlack") ?? UIColor.clear }
        static var lightGrey: UIColor { return UIColor(named: "LightGrey") ?? UIColor.clear }
        static var mediumGrey: UIColor { return UIColor(named: "MediumGrey") ?? UIColor.clear }
        static var darkGrey: UIColor { return UIColor(named: "DarkGrey") ?? UIColor.clear }
        
        // Jobs Urgency Color
        static var highUrgency: UIColor { return UIColor(named: "HighUrgency") ?? UIColor.clear }
        static var mediumUrgency: UIColor { return UIColor(named: "MediumUrgency") ?? UIColor.clear }
        static var lowUrgency: UIColor { return UIColor(named: "LowUrgency") ?? UIColor.clear }
        
        // Others
        static var greenBackground: UIColor { return UIColor(named: "GreenBackground") ?? UIColor.clear }
        static var accentBackground: UIColor { return UIColor(named: "AccentColor")?.withAlphaComponent(0.1) ?? UIColor.clear }
        static var highUrgencyBackground: UIColor { return UIColor(named: "HighUrgencyBackground")?.withAlphaComponent(0.7) ?? UIColor.clear }
        static var mediumUrgencyBackground: UIColor { return UIColor(named: "MediumUrgencyBackground")?.withAlphaComponent(0.7) ?? UIColor.clear }
        static var lowUrgencyBackground: UIColor { return UIColor(named: "LowUrgencyBackground")?.withAlphaComponent(0.7) ?? UIColor.clear }
    }
}
