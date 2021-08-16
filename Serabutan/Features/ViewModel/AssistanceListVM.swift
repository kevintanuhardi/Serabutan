//
//  AssistanceListVM.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 15/08/21.
//

import Foundation

protocol AssistanceListViewModelDelegate {
    func callFinished()
}

class AssistanceListVM: NSObject {
    
    private(set) var assistanceList: [Jobs]? {
        didSet {
            self.bindAssistanceListViewModelToController()
        }
    }
    
    var bindAssistanceListViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        //fetchAssistanceList()
    }
    
    func fetchAssistanceList() {
        self.assistanceList = DummyData.shared.getJobsList(.active)
    }
}

