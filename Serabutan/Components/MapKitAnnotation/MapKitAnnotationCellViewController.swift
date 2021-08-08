//
//  MapKitAnnotationCellViewController.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 24/07/21.
//

import UIKit

class MapKitAnnotationCellViewController: UIViewController {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var urgencyIndicator: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var job: Jobs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        containerView.layer.cornerRadius = 5
        containerView.layer.borderWidth = 0.5
        
        urgencyIndicator.layer.cornerRadius = urgencyIndicator.frame.size.width / 2
        containerView.layer.backgroundColor = UIColor.ColorLibrary.lowUrgencyBackground.cgColor
        
        titleLabel.font = UIFont.FontLibrary.textLink1
        priceLabel.font = UIFont.FontLibrary.footnote
        titleLabel.textColor = .ColorLibrary.customBlack
        priceLabel.textColor = .ColorLibrary.mediumGrey
        
        if let title = job?.title,
           let urgency = job?.urgency,
           let price = job?.price {
            
            titleLabel.text = title
            setStatusView(urgency: urgency)
            priceLabel.text = "Rp " + StringFormatter().priceFormatting(amount: price)
            
        }
    }
    
    func setStatusView(urgency: Urgency){
        
        var colorSolid = UIColor()
        var colorTransparent = UIColor()
        
        switch urgency {
        case .high :
            colorSolid = .ColorLibrary.highUrgency
            colorTransparent = .ColorLibrary.highUrgencyBackground
        case .medium:
            colorSolid = .ColorLibrary.mediumUrgency
            colorTransparent = .ColorLibrary.mediumUrgencyBackground
        case .low:
            colorSolid = .ColorLibrary.lowUrgency
            colorTransparent = .ColorLibrary.lowUrgencyBackground
        }
        
        urgencyIndicator.backgroundColor = colorSolid
        containerView.layer.borderColor = colorSolid.withAlphaComponent(0.3).cgColor
        
    }
}
