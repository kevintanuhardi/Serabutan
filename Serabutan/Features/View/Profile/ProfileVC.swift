//
//  ProfileVC.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 29/07/21.
//

import UIKit

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var profileInfoView: UIView!
    
    @IBOutlet weak var reviewTable: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var ratingAggregate: UILabel!
    @IBOutlet weak var ratingTotal: UILabel!
    @IBOutlet weak var totalDibantu: UILabel!
    @IBOutlet weak var totalMembantu: UILabel!
    
    @IBOutlet weak var profileJoinDate: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var ratingBadge: UIView!
    @IBOutlet weak var profileBio: UILabel!
    
    // Dummy Data
    var database = DummyData.shared
    let loggedUser = UserDefaults.standard.integer(forKey: "loggedUser")
    var user: UserProfile?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationSetup()
        checkLoggedUser()
        print("Database : ", DummyData.shared.getUserProfile()[0].name)
        reviewTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        updateUI()
    }
}

