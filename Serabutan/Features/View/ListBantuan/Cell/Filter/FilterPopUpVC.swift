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
    
    //Filter Vars
    var sortBy : AssistanceSortByFilter?
    var minValue : Int? = 50000
    var maxValue : Int? = 500000
    
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
    
    
    @IBAction func resetButtonAction(_ sender: Any) {
        sortBySelected(closestButton)
        sortBy = AssistanceSortByFilter.nearest
        
        minValue = 50000
        minValTF.placeholder = "Rp " + priceFormatting(amount: minValue!)
        minValTF.text = ""
        
        maxValue = 500000
        maxValTF.text = ""
        maxValTF.placeholder = "Rp " + priceFormatting(amount: maxValue!)
    }
    
    //Button Collection: Nearest, Newset, Highest Price, Lowest Price
    @IBAction func sortBySelected(_ sender: UIButton) {
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
    
    @IBAction func applyButtonAction(_ sender: Any) {
        let filterBy: AssistanceSortByFilter = getSortByFilter()
        guard let minCompensation = minValue else { return }
        guard let maxCompensation = maxValue else { return }
        
        let listBantuanVC = AssistanceListVC()
		delegate?.setSortDataInvoke(assignedSortBy: filterBy)
		delegate?.setPriceRangeInvoke(minCompensation: 0, maxCompensation: 200000)
        self.navigationController?.pushViewController(listBantuanVC, animated: true)
        dismiss(animated: true, completion: nil)
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
        let newMaxVal = maxValTF.text ?? ""
        let viewValue = Int(newMaxVal)
        maxValTF.text = "Rp " + priceFormatting(amount: viewValue!)
        maxValTF.resignFirstResponder()
    }
    
    //MARK: - Keyboard Observer
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


