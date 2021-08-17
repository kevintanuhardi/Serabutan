//
//  HistoryActivity.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 16/08/21.
//

import Foundation

class HistoryActivityVM: NSObject {
    
    var user = UserDefaults.standard.integer(forKey: "loggedUser")
    
    private(set) var historyActivity: [Jobs]? {
        didSet {
            self.bindHistoryActivityViewModelToController()
        }
    }
    
    var bindHistoryActivityViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
    }
    
    func fetchHistoryActivity() {
        let userProfile = DummyData.shared.getUserProfile()[user]
        let doneJobs = DummyData.shared.getJobsList(userProfile, .done)
        let cancelledJobs = DummyData.shared.getJobsList(userProfile, .cancelled)
        
        self.historyActivity = doneJobs + cancelledJobs
    }
    
}
