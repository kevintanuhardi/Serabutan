//
//  ImageCarouselCVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 26/07/21.
//

import UIKit

class ImageCarouselCVC: UICollectionViewCell {

    static let identifier = "ImageCarouselCVC"
    
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

}
