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
        urgencyView.backgroundColor = UIColor.white
        urgencyTFView.layer.borderWidth = 1
        urgencyTFView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        urgencyTFView.layer.cornerRadius = 5
        urgencyTF.inputView = nil
        urgencyTF.isUserInteractionEnabled = true
        urgencyIndicatorView.isHidden = false
        urgencyIndicatorView.layer.cornerRadius = 25
        urgencyIndicatorView.backgroundColor = UIColor.ColorLibrary.highUrgency
        urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.highUrgency.cgColor
        urgencyIndicatorView.tintColor = UIColor.ColorLibrary.highUrgency
        urgencyIndicatorView.layer.borderColor = UIColor.ColorLibrary.highUrgency.cgColor
        urgencyIndicatorView.alpha = 1
        
        titleView.layer.backgroundColor = UIColor.white.cgColor
        titleTFView.layer.borderWidth = 1
        titleTFView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        titleTFView.layer.cornerRadius = 5
        
        descView.layer.backgroundColor = UIColor.white.cgColor
        decTFView.layer.borderWidth = 1
        decTFView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        decTFView.layer.cornerRadius = 5
        
        compensationView.layer.backgroundColor = UIColor.white.cgColor
        compensationTFView.layer.borderWidth = 1
        compensationTFView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        compensationTFView.layer.cornerRadius = 5
        
        preferenceView.layer.backgroundColor = UIColor.white.cgColor
        genderView.layer.backgroundColor = UIColor.white.cgColor
        genderView.layer.borderWidth = 1
        genderView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        genderView.layer.cornerRadius = 5
        genderTF.inputView = nil
        genderImage.image = UIImage(named: "Down")
        
        ageView.layer.backgroundColor = UIColor.white.cgColor
        ageView.layer.borderWidth = 1
        ageView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        ageView.layer.cornerRadius = 5
        ageTF.inputView = nil
        ageImage.image = UIImage(named: "Down")
        
        tagListHeight.isActive = false
        infoView.layer.backgroundColor = UIColor.white.cgColor
        infoStackView.layer.backgroundColor = UIColor.white.cgColor
        infoTFView.layer.borderWidth = 1
        infoTFView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        infoTFView.layer.cornerRadius = 5
        
        mediaView.layer.backgroundColor = UIColor.white.cgColor
        mediaAddView.layer.borderWidth = 1
        mediaAddView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        mediaAddView.layer.cornerRadius = 5
    }
    
    func setNavigationBarItems(){
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.ColorLibrary.customBlack, .font: UIFont.FontLibrary.largeTitle]
        view.backgroundColor = .ColorLibrary.lightGrey
        
        self.navigationController!.navigationBar.prefersLargeTitles = true
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.title = "Buat Permintaan Bantuan"
          
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

