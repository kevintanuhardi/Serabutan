//
//  Formatter.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import Foundation
import MapKit

// Defining enum for StyleCombiner function
// - Mandatory : Adding red (*) after inputted text
// - dualStyle : Bold the first text, normalize the second text
enum textStyle {
    case mandatory
    case dualStyle
}

struct StringFormatter {
    func distance(_ distance: Double) -> String {
        return distance < 1000 ? ("\(Int(distance))" + " m") : ("\(Int(distance / 1000))" + " km")
    }
    
    func distanceFromCoordinate(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> String {
        let start = CLLocation(latitude: from.latitude, longitude: from.longitude)
        let end = CLLocation(latitude: to.latitude, longitude: to.longitude)
        let finalDistance = distance(start.distance(from: end))
        return finalDistance
    }
    
    func priceFormatting(amount: Int) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "id_UD")
        currencyFormatter.groupingSeparator = "."
        currencyFormatter.numberStyle = .decimal
        
        return currencyFormatter.string(from: NSNumber(value: amount))!
    }
    
    func relativeDateFormatter(date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        formatter.locale = Locale(identifier: "id")
        let relativeDate = formatter.localizedString(for: date, relativeTo: Date())
        
        return relativeDate
    }
    
    func dateFormatter(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "id")
        formatter.setLocalizedDateFormatFromTemplate("ddMMMyyyy")
        
        return formatter.string(from: date)
    }
    
    func styleCombiner(firstWord: String, secondWord: String, style: textStyle) -> NSAttributedString {
        
        var firstFont: UIFont
        var secondFont: UIFont
        var firstColor: UIColor
        var secondColor: UIColor
        
        switch style {
        case .mandatory:
            firstFont = .FontLibrary.body
            secondFont = firstFont
            firstColor = .ColorLibrary.customBlack
            secondColor = .ColorLibrary.highUrgency
        case .dualStyle:
            firstFont = .FontLibrary.bodyBold
            secondFont = .FontLibrary.body
            firstColor = .ColorLibrary.customBlack
            secondColor = firstColor
        }
        
        let first = NSMutableAttributedString(string: firstWord, attributes: [NSAttributedString.Key.font: firstFont, NSAttributedString.Key.foregroundColor: firstColor])
        let second = NSAttributedString(string: secondWord, attributes: [NSAttributedString.Key.font: secondFont, NSAttributedString.Key.foregroundColor: secondColor])
        
        first.append(second)
        
        return first
    }
}
