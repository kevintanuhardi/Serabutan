//
//  AssistanceListTableConfig.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import Foundation
import UIKit

extension AssistanceListVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchBar.isActive){
            return searchResultJob.count
        }
        return sortedFilteredJob.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assistanceTable.dequeueReusableCell(withIdentifier: AssistanceTableViewCell.identifier, for: indexPath) as! AssistanceTableViewCell
        let searchedJob = searchResultJob[indexPath.row]
        let sortedFiltered = sortedFilteredJob[indexPath.row]
        
        cell.selectionStyle = .none
        cell.tagView.isHidden = true
        cell.availableView.isHidden = true
        cell.youHelperView.isHidden = true
        cell.helperView.isHidden = true
        cell.mainBottomBar.isHidden = true

        var result: Jobs { return searchBar.isActive ? searchedJob : sortedFiltered }
        var distance: String { return result.distance < 1000 ? ("\(Int(result.distance))" + " m") : ("\(Int(result.distance))" + " km") }
        
        cell.setStatusView(urgency: result.urgency)
        cell.headerLabel.text = distance
        cell.titleLabel.text = result.title
        cell.posterImage.image = result.jobPosterId.avatar
        cell.verifiedLogo.isHidden = !(result.jobPosterId.isVerified)
        cell.posterLabel.text = result.jobPosterId.name
        cell.compensationLabel.text = StringFormatter().priceFormatting(amount: result.price)
        cell.timeElapsedLabel.text = StringFormatter().relativeDateFormatter(date: result.postingDate)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailBantuan = DetailBantuanVC()
        detailBantuan.selectedJob = jobList[indexPath.row]
        self.navigationController?.pushViewController(detailBantuan, animated: true)
    }
    
}
