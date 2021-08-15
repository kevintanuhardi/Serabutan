//
//  OngoingActivityVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import UIKit

class OngoingActivityVC: UIViewController {
    
    @IBOutlet weak var ongoingActivityTable: UITableView!
    
    var user = UserDefaults.standard.integer(forKey: "loggedUser")
    var dummyData = [Jobs]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ongoingActivityTable.delegate = self
        ongoingActivityTable.dataSource = self
        ongoingActivityTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setOngoingData()
    }
    
    func setOngoingData(){
        let userProfile = DummyData.shared.getUserProfile()[user]
        let activeJobs = DummyData.shared.getJobsList(userProfile, .active)
        let takenJobs = DummyData.shared.getJobsList(userProfile, .taken)
        dummyData = takenJobs + activeJobs
        print(dummyData)
        
        DispatchQueue.main.async {
            self.ongoingActivityTable.reloadData()
        }
    }
}
