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
    var user: UserProfile?
    
    override func viewWillAppear(_ animated: Bool) {
        // Setup navigation
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sunting", style: .plain, target: self, action: #selector(suntingProfile))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewTable.register(UINib(nibName: ReviewTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ReviewTableViewCell.identifier)
        
        reviewTable.delegate = self
        reviewTable.dataSource = self
        
        user = database.getUserProfile()[5]
        
        updateUI()
    }
    
    func updateUI() {
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
        ratingBadge.layer.cornerRadius = ratingBadge.frame.height / 2
        ratingBadge.layer.masksToBounds = true
        ratingBadge.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        ratingBadge.layer.borderWidth = 0.5
        profileInfoView.addLine(position: .Bottom, color: UIColor.ColorLibrary.mediumGrey, width: 0.5)

        // Set profile
        profileImage.image = user?.avatar
        profileName.text = user?.name
        profileJoinDate.text = "Bergabung \(customDateFormatter(dateInput: user?.joinDate ?? Date()))"
        profileBio.text = user?.bio
        ratingAggregate.text = "\(user?.statistics?.reviewAggregate ?? 0)"
        ratingTotal.text = "(\(user?.statistics?.totalReview ?? 0))"
        
        // Set profile statistic - Dibantu
        let dibantu = NSMutableAttributedString(string: "\(user?.statistics?.diterima ?? 0)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
        
        dibantu.append(NSAttributedString(string: " Dibantu", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]))
        
        totalDibantu.attributedText = dibantu
        
        // Set profile statistic - Membantu
        let membantu = NSMutableAttributedString(string: "\(user?.statistics?.diberikan ?? 0)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
        
        membantu.append(NSAttributedString(string: " Membantu", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]))
        
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
        label.font = .boldSystemFont(ofSize: 12)
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
        cell.titleLabel.text = userReview.jobTitle
        cell.nameLabel.text = userReview.reviewer.name
        cell.datesLabel.text = customDateFormatter(dateInput: userReview.finishedDate)
        cell.reviewText.text = userReview.reviewText
        
        return cell
    }
}

func customDateFormatter(dateInput: Date) -> String {
    var date = ""
    
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_GB")
    formatter.setLocalizedDateFormatFromTemplate("ddMMMyyyy")
    date = formatter.string(from: dateInput)
    
    return date
}
