//
//  OngoingActivityVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import UIKit

class OngoingActivityVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ongoingActivityTable: UITableView!
    
    var dummyData = DummyData.shared.getJobsList().filter { job in
        return job.status == .taken
    }
    
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
        let data = dummyData[indexPath.row]
        let poster = data.jobPosterId
        
        cell.tagView.isHidden = true
        cell.availableView.isHidden = false
        
        let newView = cell.availabelInsetView1
        newView!.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cell.helperView.isHidden = true
        cell.youHelperView.isHidden = true
        
        if data.status == .taken{
            cell.setStatusView(urgency: data.urgency)
            cell.titleLabel.text = data.title
            cell.headerLabel.text = StringFormatter().distance(data.distance)
            cell.compensationLabel.text = StringFormatter().priceFormatting(amount: data.price)
            cell.posterImage.image = poster.avatar
            cell.posterLabel.text = poster.name
            cell.timeElapsedLabel.text = StringFormatter().relativeDateFormatter(date: data.postingDate)
            return cell
        } else {
            print("No Data")
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        performSegue(withIdentifier: "DetailAssistance", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if let destination = segue.destination as? detailAssitanceVC{
        //            //PASSING DATA
        //            assistanceTable.deselectRow(at: assistanceTable.indexPathForSelectedRow!, animated: true)
        //        }
    }
}
