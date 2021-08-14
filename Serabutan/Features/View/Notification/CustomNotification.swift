//
//  CustomNotification.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 12/08/21.
//

import UIKit

class CustomNotification: UIView {
        
    @IBOutlet weak var leftImage: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    
    override func awakeFromNib() {
        setupUI()
    }
    
    class func createCustomNotification() -> CustomNotification {
        let myClassNib = UINib(nibName: "CustomNotification", bundle: nil)
        return myClassNib.instantiate(withOwner: nil, options: nil).first as! CustomNotification
    }
    
}
