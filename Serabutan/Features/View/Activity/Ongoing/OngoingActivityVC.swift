//
//  OngoingActivityVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import UIKit

class OngoingActivityVC: UIViewController {
    
    @IBOutlet weak var ongoingActivityTable: UITableView!
    
    let refreshControl = UIRefreshControl()
    var ongoingVM = OngoingActivityVM()
    var dummyData = [Jobs]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeViewModel()
        ongoingVM.fetchOngoingActivity()
        ongoingActivityTable.delegate = self
        ongoingActivityTable.dataSource = self
        ongoingActivityTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ongoingVM.fetchOngoingActivity()
        self.ongoingActivityTable.reloadData()
    }
     
    func subscribeViewModel(){
        ongoingVM.bindOngoingActivityViewModelToController = {
            self.bindData()
        }
    }
    
    func bindData() {
        if let parsedActivity = ongoingVM.ongoingActivity {
            dummyData = parsedActivity

            DispatchQueue.main.async {
                self.ongoingActivityTable.reloadData()
            }
        }
    }
    
}
