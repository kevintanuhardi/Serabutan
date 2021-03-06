//
//  AssistanceListTableConfig.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import Foundation
import UIKit

extension AssistanceListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchBar.isActive){
            return searchResultJob.count
        }
        return sortedFilteredJob.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = assistanceTable.dequeueReusableCell(withIdentifier: AssistanceTableViewCell.identifier, for: indexPath) as? AssistanceTableViewCell else { fatalError("Table View Dequeue Error") }
        let searchedJob = searchResultJob[indexPath.row]
        let sortedFiltered = sortedFilteredJob[indexPath.row]
        
        cell.selectionStyle = .none
        cell.tagView.isHidden = true
        cell.availableView.isHidden = true
        cell.ongoingHelperView.isHidden = true
        cell.historyHelperView.isHidden = true
        cell.mainBottomBar.isHidden = true

        var result: Jobs { return searchBar.isActive ? searchedJob : sortedFiltered }
    
        cell.setStatusView(urgency: result.urgency)
        cell.titleLabel.text = result.title
        cell.headerLabel.text =  StringFormatter().distance(result.distance)
        cell.posterImage.image = result.jobPosterId.avatar ?? UIImage(named: "avatarIcon")
        cell.verifiedLogo.isHidden = !(result.jobPosterId.isVerified)
        cell.posterLabel.text = result.jobPosterId.name
        cell.compensationLabel.text = StringFormatter().priceFormatting(amount: result.price)
        cell.timeElapsedLabel.text = StringFormatter().relativeDateFormatter(date: result.postingDate)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailBantuan = DetailBantuanVC()
        let currentList = searchBar.isActive ? searchResultJob : sortedFilteredJob
        detailBantuan.selectedJob = currentList[indexPath.row]
        self.navigationController?.pushViewController(detailBantuan, animated: true)
    }
    
}
