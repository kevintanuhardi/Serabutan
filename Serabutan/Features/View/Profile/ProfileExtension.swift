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
        let label = UILabel()
        let headerView = UIView()
        label.frame = CGRect(x: 20, y: 0, width: tableView.bounds.width, height: 50)
        label.text = "AKTIVITAS & ULASAN"
        label.font = .FontLibrary.bodyBold
        label.textColor = .ColorLibrary.darkGrey
        headerView.backgroundColor = .ColorLibrary.lightGrey
        headerView.addSubview(label)
        headerView.tag = 99
        return headerView
    }
    
    // MARK: - Table Content
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let reviewee = user else { fatalError("No user was found.") }
        let reviewCount = database.getUserReview(reviewee: reviewee).count
        if reviewCount > 0{
            return 1
        } else {
            tableView.EmptyMessage("Belum ada aktivitas")
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Profile page will only show the latest 5 reviews
        guard let reviewee = user else { fatalError("No user was found.") }
        let reviewCount = database.getUserReview(reviewee: reviewee).count
        return reviewCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = reviewTable.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier,
                                                         for: indexPath) as? ReviewTableViewCell,
              let reviewee = user
        else {
            fatalError("DequeueReusableCell failed while casting.")
        }
        
        let userReview = database.getUserReview(reviewee: reviewee)[indexPath.row]
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
    
    // MARK: - Scroll View
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerCell = reviewTable.viewWithTag(99)

        if scrollView.contentOffset.y > 0 {
            UIView.animate(withDuration: 0.1, animations: {
                headerCell?.dropShadow(opacity: 0.25, offset: 5, scale: true)
            })
        } else {
            UIView.animate(withDuration: 0.1, animations: {
                headerCell?.dropShadow(opacity: 0, offset: 0, scale: true)
            })
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > 0 {
            bottomConstraint.constant = -(profileBio.frame.height + totalDibantu.frame.height + 5)
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        } else {
            bottomConstraint.constant = 20
            UIView.animate(withDuration: 0.25, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}
