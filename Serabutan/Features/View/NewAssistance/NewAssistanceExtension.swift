//
//  NewAssistanceExtentsion.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import Foundation
import UIKit

extension NewAssistanceVC {
   
    func initFlowLayout(){
        if let flowLayout = infoCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        let columnLayout = CustomViewFlowLayout()
        
        if #available(iOS 10.0, *) {
            columnLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        } else {
            columnLayout.estimatedItemSize = CGSize(width: 41, height: 15)
        }
        infoCollectionView.collectionViewLayout = columnLayout
    }
    
    //MARK: - Price Formatting
    func priceFormatting(amount: Int) -> String{
            let currencyFormatter = NumberFormatter()
            currencyFormatter.numberStyle = .currency
            currencyFormatter.locale = Locale(identifier: "id_UD")
            currencyFormatter.groupingSeparator = "."
            currencyFormatter.numberStyle = .decimal
            
            return currencyFormatter.string(from: NSNumber(value: amount))!
        }
    
    
    
    //MARK: -Keyboard Delegate
    func initKeyboardObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
            // if keyboard size is not available for some reason, dont do anything
            return
        }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height , right: 0.0)
        myScrollView.contentInset = contentInsets
        myScrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        myScrollView.contentInset = contentInsets
        myScrollView.scrollIndicatorInsets = contentInsets
    }
    
}
