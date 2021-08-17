//
//  OngoingActivityVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import UIKit

class OngoingActivityVC: UIViewController {
    
    @IBOutlet weak var ongoingActivityTable: UITableView!
    @IBOutlet weak var noOngoingActivityLabel: UILabel!
    
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
        guard dummyData.count > 0 else { return }
        setupView()
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

extension OngoingActivityVC {
    
    func setupView() {
        setupOngoingActivityLabel()
        
        if dummyData.count != 0 {
            noOngoingActivityLabel.isHidden = true
        } else {
            noOngoingActivityLabel.isHidden = false
        }
    }
    
    func setupOngoingActivityLabel() {
        noOngoingActivityLabel.font = UIFont.FontLibrary.body
        noOngoingActivityLabel.textColor = UIColor.ColorLibrary.customBlack
    }
    
}
