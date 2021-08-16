//
//  FilterPopUpNavigation.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 15/08/21.
//

import Foundation

extension FilterPopUpVC {
    
    func navigateToAssistanceList() {
        let filterBy: AssistanceSortByFilter = getSortByFilter()
        guard let minCompensation = minValue else { return }
        guard let maxCompensation = maxValue else { return }
        
        let listBantuanVC = AssistanceListVC()
        delegate?.setSortDataInvoke(assignedSortBy: filterBy)
        delegate?.setPriceRangeInvoke(minCompensation: minCompensation, maxCompensation: maxCompensation)
        self.navigationController?.pushViewController(listBantuanVC, animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}
