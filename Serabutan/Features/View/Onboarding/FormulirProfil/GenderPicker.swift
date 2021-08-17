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
        genderTxt.inputView = genderPV
        genderPV.delegate = self
        genderPV.dataSource = self
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
        genderTxt.text = gender
    }
}
