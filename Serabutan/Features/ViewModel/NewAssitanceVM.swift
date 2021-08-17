//
//  NewAssitanceVM.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 16/08/21.
//

import Foundation

class NewAssistanceVM: NSObject {
    
    var user = UserDefaults.standard.integer(forKey: "loggedUser")
    
    private(set) var newAssistance: [Jobs]? {
        didSet {
            self.bindNewAssistanceViewModelToController()
        }
    }
    
    var bindNewAssistanceViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
    }
    
    func fetchHistoryActivity() {

    }
    
}
