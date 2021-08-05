//
//  Formatter.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import Foundation

struct StringFormatter {
    func distance(_ distance: Double) -> String {
        return distance < 1000 ? ("\(Int(distance))" + " m") : ("\(Int(distance))" + " km")
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
}
