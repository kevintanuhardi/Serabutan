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
    
    var job: Job?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        containerView.layer.cornerRadius = 5
        
        urgencyIndicator.layer.cornerRadius = urgencyIndicator.frame.size.width / 2
        
        if let title = job?.title,
           let urgency = job?.urgency,
           let price = job?.price {
            titleLabel.text = title
            
            switch urgency {
            case .High:
                urgencyIndicator.layer.backgroundColor = UIColor.init(named: "highUrgency")?.cgColor
            case .Medium:
                urgencyIndicator.layer.backgroundColor = UIColor.init(named: "mediumUrgency")?.cgColor
            default:
                urgencyIndicator.layer.backgroundColor = UIColor.init(named: "lowUrgency")?.cgColor
            }
            
            //TODO : format currency
//            priceLabel = price
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
