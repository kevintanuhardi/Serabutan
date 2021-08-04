//
//  OngoingActivityVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import UIKit

class OngoingActivityVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ongoingActivityTable: UITableView!
    
    var dummyData = DummyData.shared.getJobsList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        
//        var status: String {
//            
//            if dummyData[indexPath.row].urgency == .high{
//                return "Tinggi"
//            } else if Dum
//        }
        return cell
    }
}
