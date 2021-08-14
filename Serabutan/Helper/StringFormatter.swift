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
        var finalDistance: Double
        if distance < 1000 {
            finalDistance = (round(10*distance))/10
        } else {
            finalDistance = distance / 1000
            finalDistance = (round(10*finalDistance))/10
        }
        return distance < 1000 ? ("\(finalDistance)" + " m") : ("\(finalDistance)" + " km")
    }
    
    func distanceFromCoordinate(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> Double {
        let start = CLLocation(latitude: from.latitude, longitude: from.longitude)
        let end = CLLocation(latitude: to.latitude, longitude: to.longitude)
        return start.distance(from: end)
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
    
    // A function to shorten user full name
    func shortenedName(fullName: String) -> String {
        let separatedName = fullName.components(separatedBy: " ")
        
        if (separatedName.count > 1) && (separatedName[0].count + separatedName[1].count > 15) {
            // Return shortened name if the full name is more than 15 char
            // Uvuvwevwevwe Onyetenvewve Ugwemubwem Ossas -> Uvuvwevwevwe O.
            return separatedName[0] + " " + separatedName[1].prefix(1) + "."
        } else if (separatedName.count > 1) && (separatedName[0].count + separatedName[1].count <= 15) {
            // Return shortened name if the full name is more than 15 char
            // Yahya Ayyash -> Yahya Ayyash
            return separatedName[0] + " " + separatedName[1]
        } else {
            return fullName
        }
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
