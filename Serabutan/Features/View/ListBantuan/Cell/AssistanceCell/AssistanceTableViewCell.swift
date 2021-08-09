//
//  AssistanceTableViewCell.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import UIKit

class AssistanceTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var gradientView: UIView!
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
    @IBOutlet weak var mainBottomBar: UIView!
    
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var tagSeparator: UIView!
    @IBOutlet weak var tagCountLabel: UILabel!
    
    //available state
    @IBOutlet weak var availableView: UIView!
    @IBOutlet weak var availabelInsetView1: UIView!
    @IBOutlet weak var selfImage: UIImageView!
    @IBOutlet weak var availableInsetView: UIView!
    
    //assigned by you state
    @IBOutlet weak var youHelperView: UIView!
    @IBOutlet weak var whatsappView: UIView!
    @IBOutlet weak var whatsappImage: UIImageView!
    @IBOutlet weak var whatsappButton: UIButton!
    
    //assigned by other helper state
    @IBOutlet weak var helperView: UIView!
    @IBOutlet weak var helperImage: UIImageView!
    @IBOutlet weak var helperNameLabel: UILabel!
    @IBOutlet weak var verifiedLogo1: UIImageView!
    
    @IBOutlet weak var tagCell: UICollectionView!
    
    static let identifier  = "AssistanceTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "AssistanceTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setViewStyling()
        tagCell.delegate = self
        tagCell.dataSource = self
        tagCell.register(TagCollectionViewCell.nib(), forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
