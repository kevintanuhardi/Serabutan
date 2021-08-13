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
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        containerView.layer.masksToBounds = true
        
        topBarView.layer.masksToBounds = true
        topBarView.layer.cornerRadius = 3
        topBarView.layer.backgroundColor = UIColor.ColorLibrary.mediumGrey.cgColor
        
        minValTF.addLine(position: .bottom, color: .ColorLibrary.mediumGrey, width: 1)
        maxValTF.addLine(position: .bottom, color: .ColorLibrary.mediumGrey, width: 1)
        
    }
    
    func initCloseButton(){
        closestButton.titleLabel?.font = .FontLibrary.body
        closestButton.layer.masksToBounds = true
        closestButton.layer.borderColor = mainColor.cgColor
        closestButton.layer.backgroundColor = tintColor.cgColor
        closestButton.setTitleColor(.ColorLibrary.accentColor, for: .normal)
        closestButton.layer.borderWidth = 0.5
        closestButton.layer.cornerRadius = 5
    }
    
    
    func initNewestButton(){
        newestButton.titleLabel?.font = .FontLibrary.body
        newestButton.layer.masksToBounds = true
        newestButton.layer.borderColor = blackColor.cgColor
        newestButton.layer.borderWidth = 0.5
        newestButton.layer.cornerRadius = 5
    }
    
    func initHighestCompensationButton(){
        highestCompensationButton.titleLabel?.font = .FontLibrary.body
        highestCompensationButton.layer.masksToBounds = true
        highestCompensationButton.layer.borderColor = blackColor.cgColor
        highestCompensationButton.layer.borderWidth = 0.5
        highestCompensationButton.layer.cornerRadius = 5
    }
    
    func initLowestCompensationButton(){
        lowestCompensationButton.titleLabel?.font = .FontLibrary.body
        lowestCompensationButton.layer.masksToBounds = true
        lowestCompensationButton.layer.borderColor = blackColor.cgColor
        lowestCompensationButton.layer.borderWidth = 0.5
        lowestCompensationButton.layer.cornerRadius = 5
    }
    
    func initApplyButton(){
        applyButton.layer.masksToBounds = true
        applyButton.layer.backgroundColor = mainColor.cgColor
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
