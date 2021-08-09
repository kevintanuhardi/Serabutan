//
//  GenderPicker.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 08/08/21.
//

import Foundation
import UIKit

extension FormulirProfilVC: UIPickerViewDelegate {
    
    //MARK: - Create Gender Picker
    func createPickerGender(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTappedGender))
        doneButton.tintColor = UIColor.ColorLibrary.accentColor
        toolbar.setItems([spaceButton, doneButton], animated: true)
        
        genderTxt.inputAccessoryView = toolbar
        genderTxt.inputView = genderPV
        genderPV.delegate = self
        genderPV.dataSource = self
    }
    
    @objc func doneButtonTappedGender(){
        genderTxt.text = selectedGender
        genderTxt.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //MARK: - Gender Picker View Data Passing Logic
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderPVData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderPVData[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let gender = genderPVData[row].rawValue
        selectedGender = gender
    }
    
}
