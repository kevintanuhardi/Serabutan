//
//  OngoingActivityTableView.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 15/08/21.
//

import Foundation
import UIKit

extension OngoingActivityVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if dummyData.count > 0 {
            return 1
        } else {
            tableView.EmptyMessage("Tidak ada aktivitas yang sedang berlangsung")
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = ongoingActivityTable.dequeueReusableCell(withIdentifier: AssistanceTableViewCell.identifier, for: indexPath) as? AssistanceTableViewCell else { fatalError("Table View Dequeue Error") }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
//        let userDefault = UserDefaults.standard.integer(forKey: "loggedUser")
//        let signedUserId = DummyData.shared.getUserProfile()[userDefault]

        let data = dummyData[indexPath.row]
        let poster = data.jobPosterId
        let helper = data.helperId
        
        cell.tagView.isHidden = true
        cell.historyHelperView.isHidden = true
        
        cell.setStatusView(urgency: data.urgency)
        cell.titleLabel.text = data.title
        cell.headerLabel.text = StringFormatter().distance(data.distance)
        cell.compensationLabel.text = StringFormatter().priceFormatting(amount: data.price)
        cell.posterImage.image = poster.avatar
        cell.posterLabel.text = poster.name
        cell.timeElapsedLabel.text = StringFormatter().relativeDateFormatter(date: data.postingDate)
        cell.verifiedLogo.isHidden = !data.jobPosterId.isVerified
//        cell.ongoingHelperImage.image = helper?.avatar
//        cell.ongoingHelperNameLabel.text = helper?.name
        
        if data.helperId == nil {
            cell.availableView.isHidden = false
            cell.ongoingHelperView.isHidden = true
            let newView = cell.availabelInsetView1
            newView?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        } else {
            cell.availableView.isHidden = true
            cell.ongoingHelperView.isHidden = false
            cell.ongoingHelperImage.image = helper?.avatar
            cell.ongoingHelperNameLabel.text = helper?.name
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailBantuan = DetailBantuanVC()
        detailBantuan.selectedJob = dummyData[indexPath.row]
        self.navigationController?.pushViewController(detailBantuan, animated: true)
    }
    
}
