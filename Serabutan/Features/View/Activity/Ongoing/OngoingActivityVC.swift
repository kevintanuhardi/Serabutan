//
//  OngoingActivityVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import UIKit

class OngoingActivityVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ongoingActivityTable: UITableView!
    
    var user = UserDefaults.standard.integer(forKey: "loggedUser")
    var dummyData = [Jobs]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userProfile = DummyData.shared.getUserProfile()[user]
        let activeJobs = DummyData.shared.getJobsList(userProfile, .active)
        let takenJobs = DummyData.shared.getJobsList(userProfile, .taken)
        dummyData = takenJobs + activeJobs
        
        ongoingActivityTable.delegate = self
        ongoingActivityTable.dataSource = self
        ongoingActivityTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
    }
    
}


extension OngoingActivityVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ongoingActivityTable.dequeueReusableCell(withIdentifier: AssistanceTableViewCell.identifier, for: indexPath) as! AssistanceTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let data = dummyData[indexPath.row]
        let poster = data.jobPosterId
        
        cell.tagView.isHidden = true
        cell.availableView.isHidden = false
        
        let newView = cell.availabelInsetView1
        newView!.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cell.helperView.isHidden = true
        cell.youHelperView.isHidden = true
        
        cell.setStatusView(urgency: data.urgency)
        cell.titleLabel.text = data.title
        cell.headerLabel.text = StringFormatter().distance(data.distance)
        cell.compensationLabel.text = StringFormatter().priceFormatting(amount: data.price)
        cell.posterImage.image = poster.avatar
        cell.posterLabel.text = poster.name
        cell.timeElapsedLabel.text = StringFormatter().relativeDateFormatter(date: data.postingDate)
        cell.verifiedLogo.isHidden = !data.jobPosterId.isVerified
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailBantuan = DetailBantuanVC()
        detailBantuan.selectedJob = dummyData[indexPath.row]
        self.navigationController?.pushViewController(detailBantuan, animated: true)
    }
    
}
