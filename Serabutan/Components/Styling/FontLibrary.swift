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
        static var largeTitle: UIFont { return UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: UIFont.systemFont(ofSize: 34)) }
        static var title1: UIFont { return UIFontMetrics(forTextStyle: .title1).scaledFont(for: UIFont.systemFont(ofSize: 28)) }
        static var title2: UIFont { return UIFontMetrics(forTextStyle: .title2).scaledFont(for: UIFont.systemFont(ofSize: 22)) }
        static var title3: UIFont { return UIFontMetrics(forTextStyle: .title3).scaledFont(for: UIFont.systemFont(ofSize: 20)) }
        static var headline: UIFont { return UIFontMetrics(forTextStyle: .headline).scaledFont(for: UIFont.systemFont(ofSize: 17)) }
        static var body: UIFont { return UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont.systemFont(ofSize: 17)) }
        static var callout: UIFont { return UIFontMetrics(forTextStyle: .callout).scaledFont(for: UIFont.systemFont(ofSize: 16)) }
        static var subheadline: UIFont { return UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: UIFont.systemFont(ofSize: 15)) }
        static var footnote: UIFont { return UIFontMetrics(forTextStyle: .footnote).scaledFont(for: UIFont.systemFont(ofSize: 13)) }
        static var caption1: UIFont { return UIFontMetrics(forTextStyle: .caption1).scaledFont(for: UIFont.systemFont(ofSize: 12)) }
        static var caption2: UIFont { return UIFontMetrics(forTextStyle: .caption2).scaledFont(for: UIFont.systemFont(ofSize: 11)) }
    }
}
