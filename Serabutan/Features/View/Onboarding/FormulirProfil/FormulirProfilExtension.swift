//
//  FormulirProfilExtension.swift
//  Serabutan
//
//  Created by Gilang Adrian on 07/08/21.
//

import Foundation
import UIKit

extension FormulirProfilVC: UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate{
    func createPickerGender(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTappedGender))
        toolbar.setItems([spaceButton, doneButton], animated: true)
        
        genderTxt.inputAccessoryView = toolbar
        genderTxt.inputView = genderPV
        genderPV.delegate = self
        genderPV.dataSource = self
        genderPV.tag = 1
    }
    
    @objc func doneButtonTappedGender(){
        genderTxt.text = selectedGender
        genderTxt.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //MARK: - Picker View Data Passing Logic
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag{
        case 1:
            return genderPVData.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 1:
            return genderPVData[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag{
        case 1:
            let gender = genderPVData[row]
            selectedGender = gender
        default:
            print("didSelect")
        }
    }
    
    func setNavigation() {
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .white
        
        navigationItem.largeTitleDisplayMode = .never
        self.tabBarController?.tabBar.isHidden = true
        
        //Back Button
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        navigationController?.navigationBar.isHidden = false
        
    }
    
    func createDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        //toolbar.sizeToFit()
        
        //button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar
        birthDateTxt.inputAccessoryView = toolbar
        
        //assign date picker to txtfield
        birthDateTxt.inputView = datePicker
        
        //date picker mode
        datePicker.datePickerMode = .date
    }
    
    @objc func donePressed(){
        //date format
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        birthDateTxt.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
        textField.superview?.animateBorder(true, type: .border)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == namaLengkapTxt {
            birthDateTxt.becomeFirstResponder()
        } else if textField == birthDateTxt {
            genderTxt.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.superview?.animateBorder(false, type: .border)
        
        if textField == namaLengkapTxt {
            let currNamaLengkap = namaLengkapTxt.text!
            
            if (namaLengkapTxt .isEditing) {
                let viewName = String(currNamaLengkap)
                namaLengkapTxt.text = viewName
            }
            
            if (namaLengkapTxt .endEditing(true)) {
                let viewName = String(currNamaLengkap) ?? newNamaLengkap
                namaLengkapTxt.text = viewName
            }
        }
        
        if textField == birthDateTxt {
            let currBirthDate = birthDateTxt.text!
        }
        
        if textField == genderTxt {
            let currGender = genderTxt.text!
            
            if currGender == "Laki-laki"{
                newSelectedGender = genderPVData[0]
            } else if currGender == "Perempuan"{
                newSelectedGender = genderPVData[1]
            } else {
                newSelectedGender = genderPVData[2]
            }
        }
    }
}
