//
//  OngoingActivityVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import UIKit

class OngoingActivityVC: UIViewController {
    
    @IBOutlet weak var ongoingActivityTable: UITableView!
    
    var ongoingVM = OngoingActivityVM()
    var user = UserDefaults.standard.integer(forKey: "loggedUser")
    var dummyData = [Jobs]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ongoingActivityTable.delegate = self
        ongoingActivityTable.dataSource = self
        ongoingActivityTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
        
        subscribeViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        setOngoingData()
        subscribeViewModel()
    }
    
    //    func setOngoingData(){
    //        let userProfile = DummyData.shared.getUserProfile()[user]
    //        let activeJobs = DummyData.shared.getJobsList(userProfile, .active)
    //        let takenJobs = DummyData.shared.getJobsList(userProfile, .taken)
    //        dummyData = takenJobs + activeJobs
    //        print(dummyData)
    //
    //        DispatchQueue.main.async {
    //            self.ongoingActivityTable.reloadData()
    //        }
    
    
    private func subscribeViewModel() {
        ongoingVM.bindOngoingActivityViewModelToController = {
            self.bindData()
            print("BIND DATA")
        }
    }
    
    private func bindData() {
        //        if let parsedActivity = ongoingVM.ongoingActivity {
        //            print("PARSED:", parsedActivity.count)
        //            dummyData = parsedActivity
        //            print("JOB LIST:",dummyData.count)
        //            DispatchQueue.main.async {
        //                self.ongoingActivityTable.reloadData()
        //            }
        //        }
        guard let dummyData = ongoingVM.ongoingActivity else { return }
        print("ONGOING ACTIVITY:", dummyData.count)
        
        DispatchQueue.main.async {
            self.ongoingActivityTable.reloadData()
        }
        
    }
}
