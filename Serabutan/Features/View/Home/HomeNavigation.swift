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
	
	func navToListAssitance() {
		let showAll = AssistanceListVC()
		showAll.searchBar.becomeFirstResponder()
		self.navigationController?.pushViewController(showAll, animated: true)
	}
}
