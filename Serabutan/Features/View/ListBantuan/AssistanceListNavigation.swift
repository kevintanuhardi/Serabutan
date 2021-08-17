//
//  AssistanceListNavigation.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 15/08/21.
//

import Foundation

extension AssistanceListVC {
    
    func navigateToHome() {
        let homeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func navigateToFilter() {
        let destination = FilterPopUpVC(nibName: "FilterPopUpVC", bundle: nil)
        destination.delegate = self
        destination.sortBy = sortBy
        self.present(destination, animated: true, completion: nil)
    }
    
}
