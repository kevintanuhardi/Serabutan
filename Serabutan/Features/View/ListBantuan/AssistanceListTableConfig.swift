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
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assistanceTable.dequeueReusableCell(withIdentifier: AssistanceTableViewCell.identifier, for: indexPath) as! AssistanceTableViewCell
        cell.selectionStyle = .none
        cell.configureAssistanceCell()
        //SET ASSISTANCE COLLECTION VIEW DATA
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedAssistance = trails[indexPath.row]
//        if let viewController = storyboard?.instantiateViewController(identifier: DetailAssistanceVC.identifier) as? DetailAssistanceVC {
//                viewController.assistances = selectedAssistance
//                navigationController?.pushViewController(viewController, animated: true)
//        }
    }
    
}
