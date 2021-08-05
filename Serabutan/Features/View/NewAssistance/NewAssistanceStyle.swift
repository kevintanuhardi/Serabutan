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
        urgencyView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        urgencyTFView.layer.borderWidth = 0.25
        urgencyTFView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        urgencyTFView.layer.cornerRadius = 5
        urgencyTF.inputView = nil
        
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
        genderTF.inputView = nil
        genderImage.image = UIImage(named: "Down")
        
        ageView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        ageView.layer.borderWidth = 0.25
        ageView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        ageView.layer.cornerRadius = 5
        ageTF.inputView = nil
        ageImage.image = UIImage(named: "Down")
        
        tagListHeight.isActive = false
        infoView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        infoStackView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        infoTFView.layer.borderWidth = 0.25
        infoTFView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        infoTFView.layer.cornerRadius = 5
        
        mediaView.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        mediaAddView.layer.borderWidth = 0.25
        mediaAddView.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        mediaAddView.layer.cornerRadius = 5
    }
    
    func setNavigationBarItems(){
        self.navigationController!.navigationBar.prefersLargeTitles = true
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.title = "Buat Permintaan Bantuan"
        
//        let attrs = [
//            NSAttributedString.Key.foregroundColor: UIColor.red,
//            NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 24)!
//        ]
//        UINavigationBar.appearance().titleTextAttributes = attrs
        
        let cancelButton = UIButton(type: .system)
        cancelButton.setImage(UIImage(systemName: "xmark")?.withRenderingMode(.alwaysOriginal), for: .normal)
        cancelButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        cancelButton.tintColor = UIColor.black
        cancelButton.addTarget(self, action: #selector(cancelButtonAction(_sender:)), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelButton)
        
        let shareButton = UIButton(type: .system)
        shareButton.setTitle("Bagikan", for: .normal)
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.frame = CGRect(x: 0, y: 0, width: 69, height: 34)
        shareButton.layer.backgroundColor = UIColor(red: 0.50, green: 0.31, blue: 0.82, alpha: 1.00).cgColor
        shareButton.layer.cornerRadius = 5
        shareButton.addTarget(self, action: #selector(shareButtonAction(_sender:)), for: .touchUpInside)
        navigationItem.rightBarButtonItem =  UIBarButtonItem(customView: shareButton)
    }
}

