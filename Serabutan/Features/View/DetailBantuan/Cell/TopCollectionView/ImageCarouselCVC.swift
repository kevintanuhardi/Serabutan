//
//  ImageCarouselCVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 26/07/21.
//

import UIKit

class ImageCarouselCVC: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "ImageCarouselCVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func configure(with image: UIImage){
        imageView.image = image
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ImageCarouselCVC", bundle: nil)
    }

}
