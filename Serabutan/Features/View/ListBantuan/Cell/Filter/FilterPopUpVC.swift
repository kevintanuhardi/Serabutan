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
    @IBOutlet var sortByCollectionButton: [UIButton]!
    @IBOutlet weak var closestButton: UIButton!
    @IBOutlet weak var newestButton: UIButton!
    @IBOutlet var compensationCollection: [UITextField]!
    @IBOutlet weak var highestCompensationButton: UIButton!
    @IBOutlet weak var lowestCompensationButton: UIButton!
    
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var minValTF: UITextField!
    @IBOutlet weak var maxValTF: UITextField!
    
    //Filter Vars
    var sortBy: Any? = AssistanceSortByFilter.nearest
    var minValue: Int? = 0
    var maxValue: Int? = 500000
    
    let tintColor = UIColor(red: 0.50, green: 0.31, blue: 0.82, alpha: 1.00)
    let mainColor = UIColor(red: 0.50, green: 0.31, blue: 0.82, alpha: 1.00).cgColor
    
    static let identifier  = "FilterPopUpViewVC"
    static func nib() -> UINib {
        return UINib(nibName: "FilterPopUpViewVC", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        minValTF.keyboardType = .numberPad
        maxValTF.keyboardType = .numberPad
    }
        
    func priceFormatting(amount: Int) -> String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "id_UD")
        currencyFormatter.groupingSeparator = "."
        currencyFormatter.numberStyle = .decimal
        
        return currencyFormatter.string(from: NSNumber(value: amount))!
    }
    
    func getSortByFilter() -> AssistanceSortByFilter{
        for (index, button) in sortByCollectionButton.enumerated() {
            if button.backgroundColor == tintColor {
                return AssistanceSortByFilter(rawValue: index) ?? .nearest
            }
        }
        return .nearest
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        sortBySelected(closestButton)
        sortBy = AssistanceSortByFilter.nearest
        closestButton.layer.backgroundColor = mainColor
        closestButton.setTitleColor(.white, for: .normal)
        minValue = 0
        minValTF.placeholder = "Rp " + priceFormatting(amount: minValue!)
        minValTF.text = ""
        maxValue = 500000
        maxValTF.text = ""
        maxValTF.placeholder = "Rp " + priceFormatting(amount: maxValue!)
    }
    
    @IBAction func sortBySelected(_ sender: UIButton) {
        sortByCollectionButton.forEach({ $0.backgroundColor = .white})
        sortByCollectionButton.forEach({ $0.setTitleColor(.black, for: .normal)})
        
        sender.backgroundColor = tintColor
        sender.setTitleColor(.white, for: .normal)
        sender.layer.masksToBounds = true
        sender.layer.borderColor = mainColor
        sender.layer.borderWidth = 1
        sender.layer.cornerRadius = 5
    }
    
    @objc func minValueDoneButtonTapped(){
        let newMinVal = minValTF.text ?? ""
        minValue = Int(newMinVal) ?? 0
        minValTF.text = "Rp " + priceFormatting(amount: minValue!)
        maxValTF.becomeFirstResponder()
    }
    
    @objc func maxValueDoneButtonTapped(){
        let newMaxVal = maxValTF.text ?? ""
        maxValue = Int(newMaxVal) ?? 500000
        maxValTF.text = "Rp " + priceFormatting(amount: maxValue!)
        maxValTF.resignFirstResponder()
    }
    

    @IBAction func applyButtonAction(_ sender: Any) {
        //let filterBy: AssistanceSortByFilter = getSortByFilter()
        let listBantuanVC = AssistanceListVC()
        listBantuanVC.sortBy = sortBy
        listBantuanVC.minValue = minValue
        listBantuanVC.maxValue = maxValue
        self.navigationController?.pushViewController(listBantuanVC, animated: true)
    }
    
}



