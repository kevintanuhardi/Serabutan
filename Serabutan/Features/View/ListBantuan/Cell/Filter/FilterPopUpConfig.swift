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
        closestButton.layer.masksToBounds = true
        closestButton.layer.borderColor = mainColor
        closestButton.layer.borderWidth = 1
        closestButton.layer.cornerRadius = 5
        
        newestButton.layer.masksToBounds = true
        newestButton.layer.borderColor = mainColor
        newestButton.layer.borderWidth = 1
        newestButton.layer.cornerRadius = 5
        
        higestCompensationButton.layer.masksToBounds = true
        higestCompensationButton.layer.borderColor = mainColor
        higestCompensationButton.layer.borderWidth = 1
        higestCompensationButton.layer.cornerRadius = 5
        
        lowestCompensationButton.layer.masksToBounds = true
        lowestCompensationButton.layer.borderColor = mainColor
        lowestCompensationButton.layer.borderWidth = 1
        lowestCompensationButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
        
        applyButton.layer.masksToBounds = true
        applyButton.layer.backgroundColor = mainColor
        applyButton.layer.cornerRadius = 5
    }
    
    
    
}
