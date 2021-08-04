//
//  FilterPopUpConfig.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import Foundation
import UIKit

extension FilterPopUpVC{
    func setupView(){
        initCloseButton()
        initNewestButton()
        initHighestCompensationButton()
        initLowestCompensationButton()
        initApplyButton()

        minValueTFToolbar()
        maxValueTFToolbar()
    
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 5
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        containerView.layer.masksToBounds = true
        
        topBarView.layer.masksToBounds = true
        topBarView.layer.cornerRadius = 3
        topBarView.layer.backgroundColor = UIColor(red: 0.81, green: 0.81, blue: 0.81, alpha: 1.00).cgColor
    }
    
    func initCloseButton(){
        closestButton.layer.masksToBounds = true
        closestButton.layer.borderColor = mainColor
        closestButton.layer.backgroundColor = mainColor
        closestButton.setTitleColor(.white, for: .normal)
        closestButton.layer.borderWidth = 1
        closestButton.layer.cornerRadius = 5
    }
    
    
    func initNewestButton(){
        newestButton.layer.masksToBounds = true
        newestButton.layer.borderColor = mainColor
        newestButton.layer.borderWidth = 1
        newestButton.layer.cornerRadius = 5
    }
    
    func initHighestCompensationButton(){
        highestCompensationButton.layer.masksToBounds = true
        highestCompensationButton.layer.borderColor = mainColor
        highestCompensationButton.layer.borderWidth = 1
        highestCompensationButton.layer.cornerRadius = 5
    }
    
    func initLowestCompensationButton(){
        lowestCompensationButton.layer.masksToBounds = true
        lowestCompensationButton.layer.borderColor = mainColor
        lowestCompensationButton.layer.borderWidth = 1
        lowestCompensationButton.layer.cornerRadius = 5
    }
    
    func initApplyButton(){
        applyButton.layer.masksToBounds = true
        applyButton.layer.backgroundColor = mainColor
        applyButton.layer.cornerRadius = 5
    }
    
    func minValueTFToolbar(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(minValueDoneButtonTapped))
        toolbar.setItems([spaceButton, doneButton], animated: true)
        minValTF.inputAccessoryView = toolbar
    }
    
    func maxValueTFToolbar(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(maxValueDoneButtonTapped))
        toolbar.setItems([spaceButton, doneButton], animated: true)
        maxValTF.inputAccessoryView = toolbar
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let currMinValue1 = minValTF.text?.replacingOccurrences(of: "Rp ", with: "")
        let currMinValue = currMinValue1!.replacingOccurrences(of: ".", with: "")
        let currMaxValue1 = maxValTF.text?.replacingOccurrences(of: "Rp ", with: "")
        let currMaxValue = currMaxValue1!.replacingOccurrences(of: ".", with: "")
        print("Curr MIN is:" + currMinValue)
        print("Curr MAX is:" + currMaxValue)
        
        if (minValTF .isEditing) {
            let viewMinVal = Int(currMinValue)
            minValTF.text = "Rp " + priceFormatting(amount: viewMinVal!)
        } else if maxValTF .isEditing{
            let viewMaxVal = Int(currMaxValue)
            maxValTF.text = "Rp " + priceFormatting(amount: viewMaxVal!)
        }
        
        if (minValTF .endEditing(true)) {
            let viewMinVal = Int(currMinValue) ?? minValue
            minValTF.text = "Rp " + priceFormatting(amount: viewMinVal!)
        } else if maxValTF .endEditing(true){
            let viewMaxVal = Int(currMaxValue) ?? maxValue
            maxValTF.text = "Rp " + priceFormatting(amount: viewMaxVal!)
        }
        
        minValue = Int(currMinValue) ?? 50000
        maxValue = Int(currMaxValue) ?? 500000
    }
    
}
