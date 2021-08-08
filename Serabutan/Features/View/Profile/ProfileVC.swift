//
//  ProfileVC.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 29/07/21.
//

import UIKit

class ProfileVC: UIViewController {
    
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
    let database = DummyData.shared
    let loggedUser = UserDefaults.standard.integer(forKey: "loggedUser")
    var user: UserProfile?
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        
        // Back Button
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        // Check if profile is their own
        if user?.id == loggedUser {
            let rightBarButton = UIBarButtonItem(title: "Sunting", style: .plain, target: self, action: #selector(suntingProfile))
            rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.FontLibrary.textLink1], for: .normal)
            navigationItem.rightBarButtonItem = rightBarButton
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewTable.register(UINib(nibName: ReviewTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ReviewTableViewCell.identifier)
        
        reviewTable.delegate = self
        reviewTable.dataSource = self
        
        updateUI()
        
    }
    
    func updateUI() {
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
        ratingBadge.layer.cornerRadius = ratingBadge.frame.height / 2
        ratingBadge.layer.masksToBounds = true
        ratingBadge.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        ratingBadge.layer.borderWidth = 0.5
        profileInfoView.addLine(position: .bottom, color: UIColor.ColorLibrary.mediumGrey, width: 0.5)
        
        // Set profile
        profileImage.image = user?.avatar
        profileName.text = user?.name
        profileJoinDate.text = "Bergabung \(StringFormatter().dateFormatter(date: user?.joinDate ?? Date()))"
        profileBio.text = user?.bio
        ratingAggregate.text = "\(user?.statistics?.reviewAggregate ?? 0)"
        ratingTotal.text = "(\(user?.statistics?.totalReview ?? 0))"
        
        // Set profile statistic - Dibantu
        let dibantu = NSMutableAttributedString(string: "\(user?.statistics?.dibantu ?? 0)", attributes: [NSAttributedString.Key.font: UIFont.FontLibrary.bodyBold])
        
        dibantu.append(NSAttributedString(string: " Dibantu", attributes: [NSAttributedString.Key.font: UIFont.FontLibrary.body]))
        
        totalDibantu.attributedText = dibantu
        
        // Set profile statistic - Membantu
        let membantu = NSMutableAttributedString(string: "\(user?.statistics?.membantu ?? 0)", attributes: [NSAttributedString.Key.font: UIFont.FontLibrary.bodyBold])
        
        membantu.append(NSAttributedString(string: " Membantu", attributes: [NSAttributedString.Key.font: UIFont.FontLibrary.body]))
        
        totalMembantu.attributedText = membantu
        
    }
    
    @objc func suntingProfile() {
        let editProfile = EditProfileVC()
        editProfile.user = self.user
        self.navigationController?.pushViewController(editProfile, animated: true)
    }
    
}

extension ProfileVC: UITableViewDelegate {
    
}

extension ProfileVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: 0, width: headerView.frame.width-40, height: headerView.frame.height)
        label.text = "AKTIVITAS & ULASAN"
        label.font = .FontLibrary.bodyBold
        label.textColor = UIColor.ColorLibrary.customBlack
        headerView.addSubview(label)
        
        headerView.backgroundColor = UIColor.ColorLibrary.lightGrey
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reviewTable.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as! ReviewTableViewCell
        
        let userReview = database.getUserReview()[indexPath.row]
        
        cell.selectionStyle = .none
        
        userReview.reviewer.isVerified ? (cell.isVerified.isHidden = true) : (cell.isVerified.isHidden = false)
        
        cell.setRating(rating: userReview.reviewPoint)
        cell.profileImage.image = userReview.reviewer.avatar
        cell.titleLabel.text = userReview.job.title
        cell.nameLabel.text = userReview.reviewer.name
        cell.datesLabel.text = StringFormatter().dateFormatter(date: userReview.finishedDate)
        cell.reviewText.text = userReview.reviewText
        
        return cell
    }
}
