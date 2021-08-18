//
//  HistoryActivityTableView.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 15/08/21.
//

import Foundation
import UIKit

extension HistoryActivityVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if dummyData.count > 0 {
            tableView.tableFooterView = nil
            return 1
        } else {
            tableView.EmptyMessage("Belum ada aktivitas")
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = historyActivityTable.dequeueReusableCell(withIdentifier: AssistanceTableViewCell.identifier, for: indexPath) as? AssistanceTableViewCell else { fatalError("Table View Dequeue Error") }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        let data = dummyData[indexPath.row]
        let poster = data.jobPosterId
        let helper = dummyData[indexPath.row].helperId
        
        cell.tagView.isHidden = true
        cell.availableView.isHidden = true
        cell.historyHelperView.isHidden = false
        cell.ongoingHelperView.isHidden = true
        cell.dotImage.tintColor = UIColor.clear
        cell.timeElapsedLabel.textColor = UIColor.clear
        
        cell.setStatusView(urgency: data.urgency)
        cell.titleLabel.text = data.title
        cell.headerLabel.text = StringFormatter().dateFormatter(date: data.postingDate)
        cell.compensationLabel.text = StringFormatter().priceFormatting(amount: data.price)
        cell.posterImage.image = poster.avatar
        cell.posterLabel.text = poster.name
        cell.historyHelperImage.image = helper?.avatar
        cell.historyHelperNameLabel.text = helper?.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailBantuan = DetailBantuanVC()
        detailBantuan.selectedJob = dummyData[indexPath.row]
        self.navigationController?.pushViewController(detailBantuan, animated: true)
    }
    
}
