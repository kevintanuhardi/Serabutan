//
//  NewAssistanceExtenstion.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 23/08/21.
//

import Foundation
import UIKit

//MARK: - CollectionView
extension NewAssistanceVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newAssistanceMediaImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mediaImageCollectionView.dequeueReusableCell(withReuseIdentifier: ImageCarouselCVC.identifier, for: indexPath) as? ImageCarouselCVC else { fatalError("Table View Dequeue Error")}
        cell.imageView.image = newAssistanceMediaImage[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        self.newAssistanceMediaImage.remove(at: indexPath.row)
        //        self.mediaImageCollectionView.deleteItems(at: [indexPath])
        //        self.mediaImageCollectionView.reloadData()
    }
     
}

//MARK: - Picker View
extension NewAssistanceVC: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func createPickerUrgency(){
        let toolbar = UIToolbar()//
        toolbar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonUrgency))
        toolbar.setItems([spaceButton, doneButton], animated: true)
        
        urgencyTF.inputAccessoryView = toolbar//
        urgencyTF.inputView = urgencyPickerView
        urgencyPickerView.delegate = self
        urgencyPickerView.dataSource = self
        
        urgencyPickerView.tag = 1
    }
    
    @objc func doneButtonUrgency(){
        urgencyTF.text = selectedValueUrgency
        titleTF.becomeFirstResponder()
    }
    
    func createPickerGender(){
        let toolbar = UIToolbar()//
        toolbar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonGender))
        toolbar.setItems([spaceButton, doneButton], animated: true)
        
        genderTF.inputAccessoryView = toolbar//
        genderTF.inputView = genderPickerView
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        
        genderPickerView.tag = 2
    }
    
    @objc func doneButtonGender(){
        genderTF.text = selectedValueGender//
        ageTF.becomeFirstResponder()
    }
    
    func createPickerAge(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTappedAge))
        toolbar.setItems([spaceButton, doneButton], animated: true)
        
        ageTF.inputAccessoryView = toolbar//
        ageTF.inputView = agePickerView
        agePickerView.delegate = self
        agePickerView.dataSource = self
        agePickerView.tag = 3
    }
    
    @objc func doneButtonTappedAge(){
        ageTF.text = selectedValueAge
        ageTF.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //MARK: - Picker View Data Passing Logic
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag{
        case 1:
            return urgencyPreferenceData.count
        case 2:
            return genderPreferenceData.count
        case 3:
            return agePreferenceData.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 1:
            return urgencyPreferenceData[row]
        case 2:
            return genderPreferenceData[row]
        case 3:
            return agePreferenceData[row]
        default:
            return "No Data Found"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag{
        case 1:
            let value = urgencyPreferenceData[row]
            selectedValueUrgency = value
        case 2:
            let value = genderPreferenceData[row]
            selectedValueGender = value
        case 3:
            let value = agePreferenceData[row]
            selectedValueAge = value
        default:
            print("No Data Selected")
        }
    }
}

//MARK: -Keyboard Delegate
extension NewAssistanceVC {
   
    func setupKeyboardObserver() {
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
        myScrollView.contentInset = .zero
        myScrollView.scrollIndicatorInsets = .zero
    }
    
    func setupKeyboardDismissMethod() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        myScrollView.keyboardDismissMode = .onDrag
        urgencyIndicatorView.backgroundColor = UIColor.systemBlue
    }
}
