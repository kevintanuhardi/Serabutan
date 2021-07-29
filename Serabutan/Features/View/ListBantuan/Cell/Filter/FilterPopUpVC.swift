//
//  FilterPopUpVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import UIKit
import Foundation

class FilterPopUpVC: UIViewController {

    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var closestButton: UIButton!
    @IBOutlet weak var newestButton: UIButton!
    @IBOutlet weak var higestCompensationButton: UIButton!
    @IBOutlet weak var lowestCompensationButton: UIButton!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var minValTF: UITextField!
    @IBOutlet weak var maxValTF: UITextField!
    
    var sortBy: String? = "Paling Dekat"
    var minValue: Int? = 0
    var maxValue: Int? = 10000000
    
    let mainColor = UIColor(red: 0.50, green: 0.31, blue: 0.82, alpha: 1.00).cgColor
    
    static let identifier  = "FilterPopUpViewVC"
    static func nib() -> UINib {
        return UINib(nibName: "FilterPopUpViewVC", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func applyButtonAction(_ sender: Any) {
        print("Filter Applied")
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        print("Filter Reset")
    }
}



