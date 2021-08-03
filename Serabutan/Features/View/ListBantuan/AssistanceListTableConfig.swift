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
        if(searchBar.isActive){
            return filteredData.count
        }
        return sortedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assistanceTable.dequeueReusableCell(withIdentifier: AssistanceTableViewCell.identifier, for: indexPath) as! AssistanceTableViewCell
        cell.selectionStyle = .none
        cell.tagView.isHidden = true
        cell.availableView.isHidden = true
        cell.youHelperView.isHidden = true
        cell.helperView.isHidden = true
        cell.mainBottomBar.isHidden = true
        
        //SET ASSISTANCE COLLECTION VIEW DATA
        if(searchBar.isActive){
            cell.statusLabel.text = filteredData[indexPath.row].urgency?.rawValue
            cell.titleLabel.text = filteredData[indexPath.row].title
            var compensation: String {
                priceFormatting(amount: filteredData[indexPath.row].price!)
            }
            cell.compensationLabel.text = compensation
            var distance: String {
                if filteredData[indexPath.row].distance! < 1000 {
                    return "\(filteredData[indexPath.row].distance!)" + " m"
                } else {
                    return "\(filteredData[indexPath.row].distance!)" + " km"
                }
            }
            cell.headerLabel.text = distance
        } else {
            cell.statusLabel.text = sortedData[indexPath.row].urgency?.rawValue
            cell.titleLabel.text = sortedData[indexPath.row].title
            var compensation: String {
                priceFormatting(amount: sortedData[indexPath.row].price!)
            }
            cell.compensationLabel.text = compensation
            var distance: String {
                if sortedData[indexPath.row].distance! < 1000 {
                    return "\(sortedData[indexPath.row].distance!)" + " m"
                } else {
                    return "\(sortedData[indexPath.row].distance!)" + " km"
                }
            }
            cell.headerLabel.text = distance
        }
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
