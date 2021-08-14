//
//  NewAssistanceView.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 28/07/21.
//

import Foundation
import UIKit

extension NewAssistanceVC {

    func initStyling(){
        setCustomTextField()
        setNavigationBarItems()
        initCancelButton()
        initShareButton()
    }
    
    
    func setCustomTextField(){
        urgencyView.backgroundColor = UIColor.white
        urgencyTFView.layer.borderWidth = 0.5
        urgencyTFView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        urgencyTFView.layer.cornerRadius = 5
        urgencyTF.inputView = nil
        urgencyTF.font = .FontLibrary.body
        urgencyTF.isUserInteractionEnabled = true
        urgencyTitle.font = .FontLibrary.caption1
        urgencyIndicatorView.isHidden = false
        urgencyIndicatorView.layer.cornerRadius = 4
        urgencyIndicatorView.backgroundColor = UIColor.ColorLibrary.highUrgency
        urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.highUrgency.cgColor
        urgencyIndicatorView.tintColor = UIColor.ColorLibrary.highUrgency
        urgencyIndicatorView.layer.borderColor = UIColor.ColorLibrary.highUrgency.cgColor
        urgencyIndicatorView.alpha = 1
        
        titleTitle.font = .FontLibrary.caption1
        titleTF.font = .FontLibrary.body
        titleView.layer.backgroundColor = UIColor.white.cgColor
        titleTFView.layer.borderWidth = 0.5
        titleTFView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        titleTFView.layer.cornerRadius = 5
        
        descTitle.font = .FontLibrary.caption1
        descView.layer.backgroundColor = UIColor.white.cgColor
        descTV.textContainerInset = .zero
        descTV.textContainer.lineFragmentPadding = 0
        decTFView.layer.borderWidth = 0.5
        decTFView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        decTFView.layer.cornerRadius = 5
        
        compensationTitle.font = .FontLibrary.caption1
        compensationView.layer.backgroundColor = UIColor.white.cgColor
        compensationTF.font = .FontLibrary.body
        compensationTFView.layer.borderWidth = 0.5
        compensationTFView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        compensationTFView.layer.cornerRadius = 5
        
        preferenceView.layer.backgroundColor = UIColor.white.cgColor
        genderTitle.font = .FontLibrary.caption1
        genderView.layer.backgroundColor = UIColor.white.cgColor
        genderView.layer.borderWidth = 0.5
        genderView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        genderView.layer.cornerRadius = 5
        genderTF.font = .FontLibrary.body
        genderTF.inputView = nil
        genderImage.image = UIImage(systemName: "chevron.down")
        
        ageTitle.font = .FontLibrary.caption1
        ageView.layer.backgroundColor = UIColor.white.cgColor
        ageView.layer.borderWidth = 0.5
        ageView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        ageView.layer.cornerRadius = 5
        ageTF.inputView = nil
        ageImage.image = UIImage(named: "chevron.down")
        
        tagTitle.font = .FontLibrary.caption1
        infoView.layer.backgroundColor = UIColor.white.cgColor
        infoStackView.layer.backgroundColor = UIColor.white.cgColor
        infoTFView.layer.borderWidth = 0.5
        infoTFView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        infoTFView.layer.cornerRadius = 5
        
        mediaView.layer.backgroundColor = UIColor.white.cgColor
        mediaAddView.layer.borderWidth = 0.5
        mediaAddView.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        mediaAddView.layer.cornerRadius = 5
    }
        
    func setNavigationBarItems(){
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.ColorLibrary.customBlack, .font: UIFont.FontLibrary.largeTitle]
        view.backgroundColor = .white
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.setBackgroundImage(UIColor.clear.as1ptImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIColor.ColorLibrary.mediumGrey.as1ptImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.title = "Buat Permintaan Bantuan"
    }
    
    func initCancelButton(){
        let cancelButton = UIButton(type: .system)
        cancelButton.setImage(UIImage(systemName: "xmark")?.withRenderingMode(.alwaysOriginal), for: .normal)
        cancelButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        cancelButton.tintColor = UIColor.black
        cancelButton.addTarget(self, action: #selector(cancelButtonAction(_sender:)), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelButton)
    }
    
    func initShareButton(){
        let shareButton = UIButton(type: .system)
        shareButton.frame = CGRect(x: 0, y: 0, width: 65, height: 30)
        shareButton.setTitle("Bagikan", for: .normal)
        shareButton.titleLabel?.font = .FontLibrary.textLink1
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.backgroundColor = UIColor.ColorLibrary.accentColor
        shareButton.layer.cornerRadius = 5
        shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
        navigationItem.rightBarButtonItem =  UIBarButtonItem(customView: shareButton)
    }
}

extension UIColor {
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 0.5, height: 0.5))
        setFill()
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 0.5, height: 0.5))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
}
