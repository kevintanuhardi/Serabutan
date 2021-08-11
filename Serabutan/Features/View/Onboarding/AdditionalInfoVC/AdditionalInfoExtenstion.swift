//
//  AdditionalInfoExtenstion.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 08/08/21.
//

import Foundation
import UIKit

extension AdditionalInfoVC {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.superview?.animateBorder(true, type: .border)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.activeTextField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.superview?.animateBorder(false, type: .border)
        let currDesc = descTV.text!
        onboardingDescription = currDesc
    }
    
    func setNavigation() {
        initSkipButton()
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        navigationItem.largeTitleDisplayMode = .never
        self.tabBarController?.tabBar.isHidden = true
        
        //Back Button
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        navigationController?.navigationBar.isHidden = false
    }
    
    func initSkipButton(){
        let rightBarButton = UIBarButtonItem(title: "Lewati", style: .plain, target: self, action: #selector(finishOnboardingWithoutDesc))
        navigationItem.rightBarButtonItem = rightBarButton
        rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.FontLibrary.textLink1], for: .normal)
        rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.FontLibrary.textLink1], for: .application)
    }
    
}
