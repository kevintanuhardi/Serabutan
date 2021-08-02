//
//  FilterPopUpVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import UIKit
import Foundation


protocol FilterPopUpVCDelegate {
    func viewControllerDidUpdate(_ controller: AssistanceListVC)
}


class FilterPopUpVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var containerView: UIView!
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
    
    //public weak var delagate: AssistanceListVCDelegate?
    
    //Filter Vars
    var sortBy: AssistanceSortByFilter?
    var minValue: Int? = 50000
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
        minValTF.delegate = self
        maxValTF.delegate = self
        minValTF.keyboardType = .numberPad
        maxValTF.keyboardType = .numberPad
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
                return AssistanceSortByFilter(rawValue: index)!
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
        maxValTF.becomeFirstResponder()
    }
    
    @objc func maxValueDoneButtonTapped(){
        let newMaxVal = maxValTF.text ?? ""
        let viewValue = Int(newMaxVal)
        maxValTF.text = "Rp " + priceFormatting(amount: viewValue!)
        maxValTF.resignFirstResponder()
    }
    
    @IBAction func applyButtonAction(_ sender: Any) {
        let filterBy: AssistanceSortByFilter = getSortByFilter()
        print (filterBy)
        print(minValue!)
        print(maxValue!)
        
        let listBantuanVC = AssistanceListVC()
        listBantuanVC.sortBy = filterBy
        listBantuanVC.minValue = minValue
        listBantuanVC.maxValue = maxValue
        listBantuanVC.applySortData()
        self.navigationController?.pushViewController(listBantuanVC, animated: true)
        dismiss(animated: true, completion: nil)
    }
     
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}


