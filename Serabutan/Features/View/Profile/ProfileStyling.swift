//
//  ProfileVCStyling.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 08/08/21.
//

import UIKit

extension ProfileVC {
    
    // MARK: - Navigation Items
    func setNavigation() {
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.largeTitleDisplayMode = .never
        
        // Back Button
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                           style: UIBarButtonItem.Style.plain,
                                                           target: nil,
                                                           action: nil)
        
        // Check if the visited profile is their own
        setNavigationItems()
    }
    
    func setNavigationItems() {
        guard user?.id == loggedUser else { return }
        
        let rightBarButton = UIBarButtonItem(title: "Sunting",
                                             style: .plain,
                                             target: self,
                                             action: #selector(goToEditProfile))
        rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.FontLibrary.textLink1],
                                              for: .normal)
        rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.FontLibrary.textLink1],
                                              for: .application)
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // MARK: - Static UI
    func setStyle() {
        // Delegate
        reviewTable.register(ReviewTableViewCell.nib(), forCellReuseIdentifier: ReviewTableViewCell.identifier)
        reviewTable.delegate = self
        reviewTable.dataSource = self
        
        reviewTable.tableFooterView = UIView()
        reviewTable.tableFooterView?.frame = CGRect(x: 0, y: 0, width: reviewTable.frame.width, height: 20)
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
        ratingBadge.layer.cornerRadius = ratingBadge.frame.height / 2
        ratingBadge.layer.masksToBounds = true
        ratingBadge.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        ratingBadge.layer.borderWidth = 0.5
        profileInfoView.addLine(position: .bottom, color: UIColor.ColorLibrary.mediumGrey, width: 0.5)
        
    }
    
    func configureText() {
        profileImage.image = user?.avatar ?? UIImage(named: "avatarIcon")
        profileName.text = user?.name
        profileJoinDate.text = "Bergabung \(StringFormatter().dateFormatter(date: user?.joinDate ?? Date()))"
        profileBio.text = user?.bio
        ratingAggregate.text = "\(user?.statistics?.reviewAggregate ?? 0)"
        ratingTotal.text = "(\(user?.statistics?.totalReview ?? 0))"
        totalDibantu.attributedText = StringFormatter().styleCombiner(firstWord: "\(user?.statistics?.dibantu ?? 0)",
                                                                      secondWord: " Dibantu",
                                                                      style: .dualStyle)
        totalMembantu.attributedText = StringFormatter().styleCombiner(firstWord: "\(user?.statistics?.membantu ?? 0)",
                                                                       secondWord: " Membantu",
                                                                       style: .dualStyle)
        profileVerified.isHidden = !(user?.isVerified ?? false)
    }
}
