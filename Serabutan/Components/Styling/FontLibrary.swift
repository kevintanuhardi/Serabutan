//
//  FontLibrary.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 03/08/21.
//

import Foundation
import UIKit

extension UIFont {
    struct FontLibrary {
        static var largeTitle: UIFont { return UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .semibold)) }
        static var title1: UIFont { return UIFontMetrics(forTextStyle: .title1).scaledFont(for: UIFont.systemFont(ofSize: 18, weight: .medium)) }
        static var title2: UIFont { return UIFontMetrics(forTextStyle: .title2).scaledFont(for: UIFont.systemFont(ofSize: 14, weight: .medium)) }
        static var headline: UIFont { return UIFontMetrics(forTextStyle: .headline).scaledFont(for: UIFont.systemFont(ofSize: 15)) }
        static var headlineBold: UIFont { return UIFontMetrics(forTextStyle: .headline).scaledFont(for: UIFont.systemFont(ofSize: 15, weight: .medium)) }
        static var body: UIFont { return UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont.systemFont(ofSize: 12)) }
        static var bodyBold: UIFont { return UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .semibold)) }
        static var footnote: UIFont { return UIFontMetrics(forTextStyle: .footnote).scaledFont(for: UIFont.systemFont(ofSize: 10, weight: .medium)) }
        static var caption1: UIFont { return UIFontMetrics(forTextStyle: .caption1).scaledFont(for: UIFont.systemFont(ofSize: 10)) }
        static var caption2: UIFont { return UIFontMetrics(forTextStyle: .caption2).scaledFont(for: UIFont.systemFont(ofSize: 10)) }
        
        // CTA
        static var button: UIFont { return UIFontMetrics(forTextStyle: .footnote).scaledFont(for: UIFont.systemFont(ofSize: 16, weight: .bold)) }
        static var textLink1: UIFont { return UIFontMetrics(forTextStyle: .caption1).scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .semibold)) }
        static var textLink2: UIFont { return UIFontMetrics(forTextStyle: .caption2).scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .semibold)) }
    }
}
