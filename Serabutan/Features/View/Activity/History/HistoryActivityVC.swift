//
//  HistoryActivityVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import UIKit

class HistoryActivityVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var historyActivityTable: UITableView!
    
    var dummyData = DummyData.shared.getJobsList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyActivityTable.delegate = self
        historyActivityTable.dataSource = self
        historyActivityTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
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
        
        
        cell.tagView.isHidden = true
        cell.availableView.isHidden = true
        cell.helperView.isHidden = false
        cell.youHelperView.isHidden = true
        
        cell.titleLabel.text = dummyData[indexPath.row].title
        
        var distance: String {
            if dummyData[indexPath.row].distance < 1000 {
                return "\(dummyData[indexPath.row].distance)" + " m"
            } else {
                return "\(dummyData[indexPath.row].distance)" + " km"
            }
        }
        cell.headerLabel.text = distance
        
        var compensation: String {
            priceFormatting(amount: dummyData[indexPath.row].price)
        }
        cell.compensationLabel.text = compensation
        
        cell.headerLabel.text = distance
        let poster = dummyData[indexPath.row].jobPosterId
        cell.posterImage.image = poster.avatar
        cell.posterLabel.text = poster.name
        //        var job = dummyData[indexPath.row].id
        
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        formatter.locale = Locale(identifier: "id")
        let relativeDate = formatter.localizedString(for: dummyData[indexPath.row].postingDate, relativeTo: Date())
        
        cell.timeElapsedLabel.text = "\(relativeDate)"
        
        let helper = dummyData[indexPath.row].helperId
        cell.helperImage.image = helper?.avatar
        cell.helperNameLabel.text = helper?.name
        
        return cell
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
