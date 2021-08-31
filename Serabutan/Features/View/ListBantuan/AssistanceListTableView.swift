//
//  AssistanceListTableConfig.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import Foundation
import UIKit

extension AssistanceListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if searchResultJob.count > 0 && searchBar.searchBar.text != "" {
            let label = UILabel()
            let headerView = UIView()
            label.frame = CGRect(x: 16, y: 0, width: tableView.bounds.width, height: 30)
            label.text = "Menampilkan \(searchResultJob.count) hasil pencarian."
            label.font = .FontLibrary.bodyBold
            label.textColor = .ColorLibrary.darkGrey
            headerView.backgroundColor = .ColorLibrary.white
            headerView.addSubview(label)
            headerView.tag = 99
            return headerView
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if searchResultJob.count > 0 && searchBar.searchBar.text != "" {
            return 30
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchResultJob.count > 0 {
            tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 10))
            return 1
        } else {
            tableView.EmptyMessage("Hasil pencarian tidak ditemukan")
            return 1
        }
    }
    
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
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        UIView.animate(withDuration: 0.2, animations: {
            cell.dropShadow(opacity: 0.25, offset: 5, scale: true)
        })
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        UIView.animate(withDuration: 0.2, animations: {
            cell.dropShadow(opacity: 0, offset: 0, scale: true)
        })
    }
}
