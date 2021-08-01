//
//  AssistanceListTableConfig.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import Foundation
import UIKit

extension AssistanceListVC{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assistanceTable.dequeueReusableCell(withIdentifier: AssistanceTableViewCell.identifier, for: indexPath) as! AssistanceTableViewCell
        cell.selectionStyle = .none
        cell.helperView.isHidden = true
        cell.youHelperView.isHidden = true
        
        //SET ASSISTANCE COLLECTION VIEW DATA
        cell.statusLabel.text = filteredData[indexPath.row].urgency?.rawValue
        cell.titleLabel.text = filteredData[indexPath.row].title
        let compensation = filteredData[indexPath.row].price
        cell.compensationLabel.text = ("\(compensation!)")
        let distance = filteredData[indexPath.row].distance
        cell.headerLabel.text = ("\(distance!)")
        
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
