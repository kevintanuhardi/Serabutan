//
//  TagCollectionViewCell.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 25/07/21.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var deleteImage: UIImageView!
    
    static let identifier  = "TagCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "TagCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func configureTagCell(){
        self.tagView.layer.cornerRadius = 5.0
        self.tagView.layer.borderWidth = 0.5
        self.tagView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.50).cgColor
    }
    
}
