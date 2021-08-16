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
    
    var userProfile : UserProfile!
    var doneJobs = [Jobs]()
    var cancelledJobs = [Jobs]()
    
    
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
        userProfile = DummyData.shared.getUserProfile()[user]
        doneJobs = DummyData.shared.getJobsList(userProfile, .done)
        cancelledJobs = DummyData.shared.getJobsList(userProfile, .cancelled)
        dummyData = doneJobs + cancelledJobs
        
        DispatchQueue.main.async {
            self.historyActivityTable.reloadData()
        }
    }
    
}
