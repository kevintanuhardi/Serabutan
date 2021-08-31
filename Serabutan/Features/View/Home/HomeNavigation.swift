//
//  HomeNavigation.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 15/08/21.
//

import Foundation

extension HomeVC {
	func navToDetail(selectedJob: Jobs) {
       let detailBantuan = DetailBantuanVC()
	   detailBantuan.selectedJob = selectedJob
	   self.navigationController?.pushViewController(detailBantuan, animated: true)
	}
	
	func navToSearchBar() {
		let showAll = AssistanceListVC()
        showAll.isSearch = true
		showAll.searchBar.becomeFirstResponder()
		self.navigationController?.pushViewController(showAll, animated: true)
	}
    
    func navToListAssitance() {
        let showAll = AssistanceListVC()
        showAll.isSearch = false
        showAll.searchBar.becomeFirstResponder()
        self.navigationController?.pushViewController(showAll, animated: true)
    }
}
