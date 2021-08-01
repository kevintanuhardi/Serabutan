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
        static var accentColor: UIColor { return UIColor(named: "AccentColor") ?? UIColor.clear }
        static var customBlack: UIColor { return UIColor(named: "CustomBlack") ?? UIColor.clear }
        static var lightGrey: UIColor { return UIColor(named: "LightGrey") ?? UIColor.clear }
        static var mediumGrey: UIColor { return UIColor(named: "MediumGrey") ?? UIColor.clear }
        static var darkGrey: UIColor { return UIColor(named: "DarkGrey") ?? UIColor.clear }
    }
}
