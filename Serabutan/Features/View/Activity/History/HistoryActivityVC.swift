//
//  HistoryActivityVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import UIKit

class HistoryActivityVC: UIViewController {
    
    @IBOutlet weak var historyActivityTable: UITableView!
    
    var historyVM = HistoryActivityVM()
    var dummyData = [Jobs]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeViewModel()
        historyVM.fetchHistoryActivity()
        historyActivityTable.delegate = self
        historyActivityTable.dataSource = self
        historyActivityTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        historyVM.fetchHistoryActivity()
    }
    
    func subscribeViewModel(){
        historyVM.bindHistoryActivityViewModelToController = {
            self.bindData()
        }
    }
    
    func bindData() {
        if let parsedActivity = historyVM.historyActivity {
            dummyData = parsedActivity
            DispatchQueue.main.async {
                self.historyActivityTable.reloadData()
            }
        }
    }
    
}
