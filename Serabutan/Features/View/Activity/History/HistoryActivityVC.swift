//
//  HistoryActivityVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import UIKit

class HistoryActivityVC: UIViewController {
    
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
