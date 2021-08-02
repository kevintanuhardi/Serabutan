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
    
}
