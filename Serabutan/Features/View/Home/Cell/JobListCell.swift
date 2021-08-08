//
//  JobListCell.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 05/08/21.
//

import UIKit

class JobListCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var compensationLabel: UILabel!
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var posterLabel: UILabel!
    @IBOutlet weak var verifiedLogo: UIImageView!
    @IBOutlet weak var dotImage: UIImageView!
    @IBOutlet weak var timeElapsedLabel: UILabel!
    
    static let identifier = "JobListCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "JobListCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setViewStyling()
    }

}
