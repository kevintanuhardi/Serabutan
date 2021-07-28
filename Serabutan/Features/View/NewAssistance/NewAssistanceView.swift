//
//  NewAssistanceView.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 28/07/21.
//

import Foundation
import UIKit

extension NewAssistanceVC {

    func setCustomTextField(){
        titleView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        titleTFView.layer.borderWidth = 0.25
        titleTFView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        titleTFView.layer.cornerRadius = 5
        
        descView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        decTFView.layer.borderWidth = 0.25
        decTFView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        decTFView.layer.cornerRadius = 5
        
        compensationView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        compensationTFView.layer.borderWidth = 0.25
        compensationTFView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        compensationTFView.layer.cornerRadius = 5
        
        preferenceView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        genderView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        genderView.layer.borderWidth = 0.25
        genderView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        genderView.layer.cornerRadius = 5
        genderImage.image = UIImage(named: "Down")
        
        ageView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        ageView.layer.borderWidth = 0.25
        ageView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        ageView.layer.cornerRadius = 5
        ageImage.image = UIImage(named: "Down")
        
        infoView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        infoTFView.layer.borderWidth = 0.25
        infoTFView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        infoTFView.layer.cornerRadius = 5
        

        mediaView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        mediaAddView.layer.borderWidth = 0.25
        mediaAddView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        mediaAddView.layer.cornerRadius = 5
    }
}

