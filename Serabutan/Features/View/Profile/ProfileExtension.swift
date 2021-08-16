//
//  ProfileExtension.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 08/08/21.
//

import UIKit

extension ProfileVC {
    
    // MARK: - Table Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()

        label.frame = CGRect.init(x: 20, y: 0, width: headerView.frame.width-40, height: headerView.frame.height)
        label.text = "AKTIVITAS & ULASAN"
        label.font = .FontLibrary.bodyBold
        label.textColor = .ColorLibrary.customBlack
        headerView.addSubview(label)
        headerView.backgroundColor = .ColorLibrary.lightGrey

        return headerView
    }
    
    // MARK: - Table Content
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Profile page will only show the latest 5 reviews
        guard let reviewee = user else { return 0 }
        return database.getUserReview(reviewee: reviewee).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = reviewTable.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier,
                                                         for: indexPath) as? ReviewTableViewCell
        else {
            fatalError("DequeueReusableCell failed while casting.")
        }
        
        let userReview = database.getUserReview(reviewee: user!)[indexPath.row]
        cell.selectionStyle = .none
        
        cell.setRating(rating: userReview.reviewPoint)
        cell.profileImage.image = userReview.reviewer.avatar
        cell.titleLabel.text = userReview.job.title
        cell.nameLabel.text = userReview.reviewer.name
        cell.datesLabel.text = StringFormatter().dateFormatter(date: userReview.finishedDate)
        cell.reviewText.text = userReview.reviewText
        cell.isVerified.isHidden = !userReview.reviewer.isVerified
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            reviewTable.headerView(forSection: 0)?.contentView.backgroundColor = .clear
            reviewTable.headerView(forSection: 0)?.backgroundView?.backgroundColor = .clear
        } else {
        }
    }
}
