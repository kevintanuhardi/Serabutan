//
//  OngoingActivityVM.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 16/08/21.
//

import Foundation

class OngoingActivityVM: NSObject {
    
    var user = UserDefaults.standard.integer(forKey: "loggedUser")
    
    private(set) var ongoingActivity: [Jobs]? {
        didSet {
            self.bindOngoingActivityViewModelToController()
        }
    }
    
    var bindOngoingActivityViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
    }
    
    func fetchOngoingActivity() {
        let userProfile = DummyData.shared.getUserProfile()[user]
        let activeJobs = DummyData.shared.getJobsList(userProfile, .active)
        let takenJobs = DummyData.shared.getJobsList(userProfile, .taken)
        
        self.ongoingActivity = takenJobs + activeJobs
    }
}

