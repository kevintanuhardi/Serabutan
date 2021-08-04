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
    
    func priceFormatting(amount: Int) -> String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "id_UD")
        currencyFormatter.groupingSeparator = "."
        currencyFormatter.numberStyle = .decimal
        
        return currencyFormatter.string(from: NSNumber(value: amount))!
    }
    
}


extension OngoingActivityVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ongoingActivityTable.dequeueReusableCell(withIdentifier: AssistanceTableViewCell.identifier, for: indexPath) as! AssistanceTableViewCell
        
                var status: String {
        
                    if dummyData[indexPath.row].urgency == .high{
                        return "Urgensi Tinggi"
                    } else if dummyData[indexPath.row].urgency == .medium{
                        return "Urgensi Sedang"
                    } else {
                        return "Urgensi Rendah"
                    }
                }
        cell.statusLabel.text = status
        
        var backgroundColor: UIColor {
            if dummyData[indexPath.row].urgency == .high{
                return UIColor.ColorLibrary.highUrgencyBackground
            } else if dummyData[indexPath.row].urgency == .medium{
                return UIColor.ColorLibrary.mediumUrgencyBackground
            } else {
                return UIColor.ColorLibrary.lowUrgencyBackground
            }
        }
        cell.statusView.layer.backgroundColor =  backgroundColor.cgColor
        
        var accentColor: UIColor {
            if dummyData[indexPath.row].urgency == .high{
                return UIColor.ColorLibrary.highUrgency
            } else if dummyData[indexPath.row].urgency == .medium{
                return UIColor.ColorLibrary.mediumUrgency
            } else {
                return UIColor.ColorLibrary.lowUrgency
            }
        }
        cell.statusView.layer.borderColor = accentColor.cgColor
        cell.statusImage.tintColor = accentColor
        
        
        cell.tagView.isHidden = true
        cell.availableView.isHidden = false
        cell.helperView.isHidden = true
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
