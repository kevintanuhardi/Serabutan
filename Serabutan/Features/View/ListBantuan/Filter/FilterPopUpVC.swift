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

class FilterPopUpVC: UIViewController {

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
    
    var delegate: FilterPopUpVCDelegate?
    var activeTextField: UITextField? = nil
    
    var sortBy : AssistanceSortByFilter? = .nearest
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
        setKeyboardNotification()
        minValTF.delegate = self
        maxValTF.delegate = self
        minValTF.keyboardType = .numberPad
        maxValTF.keyboardType = .numberPad
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupSelectedButton()
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        resetFilterValue()
    }
    
    @IBAction func sortBySelectedButton(_ sender: UIButton) {
        sortByCollectionButton.forEach({ $0.backgroundColor = .white})
        sortByCollectionButton.forEach({ $0.setTitleColor(blackColor, for: .normal)})
        sortByCollectionButton.forEach({ $0.layer.borderColor = blackColor.cgColor})
        
        setButtonColor(button: sender)
    }
    
    @IBAction func applyButtonTapped(_ sender: Any) {
        navigateToAssistanceList()
    }
    
}

extension FilterPopUpVC: UITextFieldDelegate {
    
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
                minValTF.text = "Rp " + StringFormatter().priceFormatting(amount: viewMinVal)
            }
            else if (minValTF .endEditing(true)) {
                guard let viewMinVal = Int(currMinValue) else { return }
                minValTF.text = "Rp " +  StringFormatter().priceFormatting(amount: viewMinVal)
            }
            minValue = Int(currMinValue)
        }
        
        if textField == maxValTF {
            
            guard let currMaxValue1 = maxValTF.text?.replacingOccurrences(of: "Rp ", with: "") else { return }
            let currMaxValue = currMaxValue1.replacingOccurrences(of: ".", with: "")
            
            if maxValTF == .none{
                guard let viewMaxVal = Int(currMaxValue) ?? maxValue else { return }
                maxValTF.text = "Rp " + StringFormatter().priceFormatting(amount: viewMaxVal)
            } else if maxValTF .endEditing(true){
                guard let viewMaxVal = Int(currMaxValue) else { return }
                maxValTF.text = "Rp " + StringFormatter().priceFormatting(amount: viewMaxVal)
            }
            maxValue = Int(currMaxValue)
        }
        
        for view in textField.subviews {
            if view.restorationIdentifier == "Border" {
                view.animateBorder(false, type: .color)
            }
        }
        
    }
    
    @objc func minValueDoneButtonTapped(){
        maxValTF.becomeFirstResponder()
    }
    
    @objc func maxValueDoneButtonTapped(){
        maxValTF.resignFirstResponder()
    }
    
}

extension FilterPopUpVC {
    
    func resetFilterValue() {
        sortBySelectedButton(closestButton)
        sortBy = AssistanceSortByFilter.nearest
        
        minValue = 0
        minValTF.placeholder = "Rp 50.000"
        minValTF.text = ""
    
        maxValue = 1000000
        maxValTF.text = ""
        maxValTF.placeholder = "Rp 500.000"
    }
    
    func setupSelectedButton() {
        guard let sort = sortBy else { return }
        
        if sort == .nearest {
            setButtonColor(button: closestButton)
        } else if sort == .newest {
            setButtonColor(button: newestButton)
        } else if sort == .highestCompensation {
            setButtonColor(button: highestCompensationButton)
        } else if sort == .lowestCompensation {
            setButtonColor(button: lowestCompensationButton)
        }
    }
    
    func setButtonColor(button: UIButton) {
        button.backgroundColor = tintColor
        button.setTitleColor(mainColor, for: .normal)
        button.layer.masksToBounds = true
        button.layer.borderColor = mainColor.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
    }
    
    func getSortByFilter() -> AssistanceSortByFilter {
        for (index, button) in sortByCollectionButton.enumerated() {
            if button.backgroundColor == tintColor {
                return AssistanceSortByFilter(rawValue: index) ?? .nearest
            }
        }
        return .nearest
    }
    
    func setKeyboardNotification() {
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
