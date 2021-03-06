//
//  ProfileVC.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 29/07/21.
//

import UIKit

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Dummy Data
    var database = DummyData.shared
    var loggedUser = UserDefaults.standard.integer(forKey: "loggedUser")
    var user: UserProfile?
    
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
    @IBOutlet weak var profileVerified: UIImageView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation()
        configureText()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
    }
}
