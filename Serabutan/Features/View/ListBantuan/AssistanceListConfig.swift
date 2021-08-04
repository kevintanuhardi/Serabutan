//
//  AssistanceListConfig.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 02/08/21.
//

import Foundation
import UIKit

extension AssistanceListVC{
    
    func priceFormatting(amount: Int) -> String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "id_UD")
        currencyFormatter.groupingSeparator = "."
        currencyFormatter.numberStyle = .decimal
        return currencyFormatter.string(from: NSNumber(value: amount))!
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func navigateToHome() {
        let homeVC = HomeVC()
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
}
