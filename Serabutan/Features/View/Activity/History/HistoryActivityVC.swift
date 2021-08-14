//
//  HistoryActivityVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import UIKit

class HistoryActivityVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var historyActivityTable: UITableView!
    
    var user = UserDefaults.standard.integer(forKey: "loggedUser")
    var dummyData = [Jobs]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyActivityTable.delegate = self
        historyActivityTable.dataSource = self
        historyActivityTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setHistoryData()
    }
    
    func setHistoryData(){
        let userProfile = DummyData.shared.getUserProfile()[user]
        let doneJobs = DummyData.shared.getJobsList(userProfile, .done)
        let cancelledJobs = DummyData.shared.getJobsList(userProfile, .cancelled)
        dummyData = doneJobs + cancelledJobs
        
        DispatchQueue.main.async {
            self.historyActivityTable.reloadData()
        }
    }
    
    func priceFormatting(amount: Int) -> String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "id_UD")
        currencyFormatter.groupingSeparator = "."
        currencyFormatter.numberStyle = .decimal
        
        return currencyFormatter.string(from: NSNumber(value: amount))!
    }
}

extension HistoryActivityVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyActivityTable.dequeueReusableCell(withIdentifier: AssistanceTableViewCell.identifier, for: indexPath) as! AssistanceTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let data = dummyData[indexPath.row]
        let poster = data.jobPosterId
        let helper = dummyData[indexPath.row].helperId
        
        cell.tagView.isHidden = true
        cell.availableView.isHidden = true
        cell.helperView.isHidden = false
        cell.youHelperView.isHidden = true
        cell.dotImage.tintColor = UIColor.clear
        cell.timeElapsedLabel.textColor = UIColor.clear
        
        cell.setStatusView(urgency: data.urgency)
        cell.titleLabel.text = data.title
        cell.headerLabel.text = StringFormatter().dateFormatter(date: data.postingDate)
        cell.compensationLabel.text = StringFormatter().priceFormatting(amount: data.price)
        cell.posterImage.image = poster.avatar
        cell.posterLabel.text = poster.name
        cell.helperImage.image = helper?.avatar
        cell.helperNameLabel.text = helper?.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailBantuan = DetailBantuanVC()
        detailBantuan.selectedJob = dummyData[indexPath.row]
        self.navigationController?.pushViewController(detailBantuan, animated: true)
    }
    
}
