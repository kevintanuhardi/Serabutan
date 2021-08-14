//
//  ReviewTableViewCell.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 30/07/21.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    static let identifier = "ReviewTableViewCell"
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isVerified: UIImageView!
    
    @IBOutlet var starRating: [UIImageView]!
    @IBOutlet weak var reviewText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        updateUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func updateUI() {
        cellView.layer.borderWidth = 0.5
        cellView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        cellView.layer.cornerRadius = 5.0
        cellView.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    // Set the amount of filled stars in each review
    func setRating(rating: Int) {
        for i in 0 ... (rating - 1) {
            starRating[i].image = UIImage(systemName: "star.fill")
            starRating[i].tintColor = .systemYellow
        }
    }
    
}
