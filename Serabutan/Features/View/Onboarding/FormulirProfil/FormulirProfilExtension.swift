//
//  FormulirProfilExtension.swift
//  Serabutan
//
//  Created by Gilang Adrian on 07/08/21.
//

import Foundation
import UIKit

extension FormulirProfilVC: UIPickerViewDataSource {
    
    //MARK: - Set navigation
    func setNavigation() {
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
    
    //MARK: - Get Data from Textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
        textField.superview?.animateBorder(true, type: .border)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == namaLengkapTxt {
            datePicker.resignFirstResponder()
        } else if textField == datePicker {
            genderTxt.becomeFirstResponder()
            showDatePicker()
        } else {
            textField.resignFirstResponder()
        }
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.superview?.animateBorder(false, type: .border)
        
        if textField == namaLengkapTxt {
            let currName = namaLengkapTxt.text!
            newName = currName
        }
        
        if textField == genderTxt {
            let currGender = genderTxt.text
            
            if currGender == Gender.male.rawValue {
                newGender = Gender.male
            } else if currGender == Gender.female.rawValue {
                newGender = Gender.female
            } else {
                newGender = Gender.other
            }
        }
        
    }
    
    //MARK: - Create Date Picker
    func showDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.locale = .current
        datePicker.preferredDatePickerStyle = .compact
        datePicker.addTarget(self, action: #selector(datePickerColorChange), for: UIControl.Event.allEvents)
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: UIControl.Event.valueChanged)
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker){
        let date = sender.date
        newDOB = date
        
    }
    
    @objc func datePickerColorChange(sender: UIDatePicker){
        datePicker.tintColor = UIColor.ColorLibrary.accentColor
    }
    
    
    //MARK: - ALERTS
    func nameAlert(){
        let alert = UIAlertController(title: "Nama",
                                      message: "Nama lengkap harus diisi.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .cancel,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func dobAlert() {
        let alert = UIAlertController(title: "Tanggal Lahir",
                                      message: "Tanggal lahir harus diisi.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .cancel,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func genderAlert(){
        let alert = UIAlertController(title: "Gender",
                                      message: "Gender harus dipilih.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .cancel,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
}
