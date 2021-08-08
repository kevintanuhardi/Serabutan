//
//  AssistanceListConfig.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 02/08/21.
//

import Foundation
import UIKit

extension AssistanceListVC {
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.searchTextField.animateBorder(true, type: .border)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.searchTextField.animateBorder(false, type: .border)
    }
    
    func navigateToHome() {
        let homeVC = HomeVC()
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
}
