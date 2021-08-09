//
//  ProfileVCTableConfig.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 08/08/21.
//

import UIKit

extension ProfileVC {
    
    func setupTableView() {
        reviewTable.register(UINib(nibName: ReviewTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ReviewTableViewCell.identifier)
        reviewTable.delegate = self
        reviewTable.dataSource = self
    }
    
    // TableView Header Setup
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
    
    // TableView Content Setup
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Profile page will only show the 5 latest reviews
        return database.getUserReview(reviewee: user!).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reviewTable.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as! ReviewTableViewCell
        
        //let userReview = database.getUserReview()[indexPath.row]
        let userReview = database.getUserReview(reviewee: user!)[indexPath.row]
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
