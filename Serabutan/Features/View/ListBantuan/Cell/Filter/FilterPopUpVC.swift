//
//  FilterPopUpVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import UIKit
import Foundation

protocol FilterPopUpVCDelegate {
    func setSortDataInvoke(assignedSortBy: AssistanceSortByFilter)
    func setPriceRangeInvoke(minCompensation: Int, maxCompensation: Int)
    
}

class FilterPopUpVC: UIViewController, UITextFieldDelegate {
    
    var delegate: FilterPopUpVCDelegate?
    var activeTextField: UITextField? = nil
    
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
    
    var sortBy : AssistanceSortByFilter?
    var minValue : Int? = 0
    var maxValue : Int? = 1000000
    
    let tintColor = UIColor.ColorLibrary.accentBackground
    let blackColor = UIColor.ColorLibrary.customBlack
    let mainColor = UIColor.ColorLibrary.accentColor
    
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
        setKeyboardNotification()
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        sortBySelectedButton(closestButton)
        sortBy = AssistanceSortByFilter.nearest
        
        minValue = 0
        minValTF.placeholder = "Rp 50.000"
        minValTF.text = ""
        
        maxValue = 1000000
        maxValTF.text = ""
        maxValTF.placeholder = "Rp 500.000"
    }
    
    @IBAction func sortBySelectedButton(_ sender: UIButton) {
        sortByCollectionButton.forEach({ $0.backgroundColor = .white})
        sortByCollectionButton.forEach({ $0.setTitleColor(blackColor, for: .normal)})
        sortByCollectionButton.forEach({ $0.layer.borderColor = blackColor.cgColor})
        
        sender.backgroundColor = tintColor
        sender.setTitleColor(mainColor, for: .normal)
        sender.layer.masksToBounds = true
        sender.layer.borderColor = mainColor.cgColor
        sender.layer.borderWidth = 0.5
        sender.layer.cornerRadius = 5
    }
    
    @IBAction func applyButtonTapped(_ sender: Any) {
        let filterBy: AssistanceSortByFilter = getSortByFilter()
        guard let minCompensation = minValue else { return }
        guard let maxCompensation = maxValue else { return }
        
        let listBantuanVC = AssistanceListVC()
        delegate?.setSortDataInvoke(assignedSortBy: filterBy)
        delegate?.setPriceRangeInvoke(minCompensation: minCompensation, maxCompensation: maxCompensation)
        self.navigationController?.pushViewController(listBantuanVC, animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}

extension FilterPopUpVC {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        for view in textField.subviews {
            if view.restorationIdentifier == "Border" {
                view.animateBorder(true, type: .color)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == minValTF {
            maxValTF.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == minValTF {
            guard let currMinValue1 = minValTF.text?.replacingOccurrences(of: "Rp ", with: "") else { return }
            let currMinValue = currMinValue1.replacingOccurrences(of: ".", with: "")
            
            if (minValTF == .none) {
                guard let viewMinVal = Int(currMinValue) ?? minValue else { return }
                minValTF.text = "Rp " + priceFormatting(amount: viewMinVal)
            }
            else if (minValTF .endEditing(true)) {
                guard let viewMinVal = Int(currMinValue) else { return }
                minValTF.text = "Rp " + priceFormatting(amount: viewMinVal)
            }
            minValue = Int(currMinValue)
        }
        
        if textField == maxValTF {
            guard let currMaxValue1 = maxValTF.text?.replacingOccurrences(of: "Rp ", with: "") else { return }
            let currMaxValue = currMaxValue1.replacingOccurrences(of: ".", with: "")
            
            if maxValTF == .none{
                guard let viewMaxVal = Int(currMaxValue) ?? maxValue else { return }
                maxValTF.text = "Rp " + priceFormatting(amount: viewMaxVal)
            } else if maxValTF .endEditing(true){
                guard let viewMaxVal = Int(currMaxValue) else { return }
                maxValTF.text = "Rp " + priceFormatting(amount: viewMaxVal)
            }
            maxValue = Int(currMaxValue)
        }
        
        for view in textField.subviews {
            if view.restorationIdentifier == "Border" {
                view.animateBorder(false, type: .color)
            }
        }
    }

    func getSortByFilter() -> AssistanceSortByFilter{
        for (index, button) in sortByCollectionButton.enumerated() {
            if button.backgroundColor == tintColor {
                return AssistanceSortByFilter(rawValue: index)!
            }
        }
        return .nearest
    }
    
    @objc func minValueDoneButtonTapped(){
        maxValTF.becomeFirstResponder()
    }
    
    @objc func maxValueDoneButtonTapped(){
        maxValTF.resignFirstResponder()
    }
    
    func setKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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

extension FilterPopUpVC {
    
    func priceFormatting(amount: Int) -> String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "id_UD")
        currencyFormatter.groupingSeparator = "."
        currencyFormatter.numberStyle = .decimal
        
        return currencyFormatter.string(from: NSNumber(value: amount))!
    }
    
}


