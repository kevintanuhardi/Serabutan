//
//  NADataConfig.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 08/08/21.
//

import Foundation
import UIKit
import TagListView
import MapKit

extension NewAssistanceVC: TagListViewDelegate, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate {
    
    @IBAction func cancelButtonAction(_sender: Any){
        guard let text = titleTF.text, text.isEmpty else { dismissAlert(); return }
        guard let text = descTV.text, text.isEmpty else { dismissAlert(); return }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareButtonAction(_sender: Any){
        initOtherData()
        initCreateNewJob()
        self.dismiss(animated: true, completion: nil)
    }
    
    func initOtherData(){
        let jobPosterId = DummyData.shared.getUserProfile()[userDefault]
        newAssistanceJobPosterId = jobPosterId
    }
    
    func initCreateNewJob(){
        if (titleTF.text?.isEmpty ?? true) || titleTF.text == "" || titleTF.text == "\n" {
            createTitleEmpty()
            titleTF.becomeFirstResponder()
        } else if (descTV.text?.isEmpty ?? true) || descTV.text == "" || descTV.text == "\n" {
            createDescEmpty()
            descTV.becomeFirstResponder()
        } else {
            guard let jobPosterId = newAssistanceJobPosterId else { return }
            
            let job = Jobs(id: DummyData.shared.getJobsList().count,
                           jobPosterId: jobPosterId,
                           postingDate: Date(),
                           urgency: newAssistanceUrgency,
                           title: titleTF.text,
                           desc: descTV.text,
                           price: newAssistanceCompensation,
                           status: newAssistanceStatus,
                           distance: 0.0,
                           coordinate: newAssistanceCoordinate ?? CLLocationCoordinate2D(),
                           tags: newAssistanceInfo,
                           medias: newAssistanceMediaImage,
                           helperId: newAssistanceHelperId,
                           genderPreference: newAssistanceGenderPref,
                           agePreference: newAssistanceAgePref)
            
            DummyData.shared.addNewJob(job: job)
        }
        
    }
    
    @IBAction func addMediaImageAction(_ sender: Any) {
        createAlert()
    }
    
    //MARK: - TextView
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.superview?.animateBorder(true, type: .border)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.superview?.animateBorder(false, type: .border)
    }
    
    //MARK: - TextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
        textField.superview?.animateBorder(true, type: .border)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
        textField.superview?.animateBorder(false, type: .border)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case compensationTF :
            let text: NSString = (textField.text ?? "") as NSString
            var finalString = text.replacingCharacters(in: range, with: string)
            
            finalString = finalString.replacingOccurrences(of: ".", with: "")
            newAssistanceCompensation = Int(finalString) ?? 0
            compensationTF.text = StringFormatter().priceFormatting(amount: newAssistanceCompensation )
            return false
            
        case infoTF :
            let acceptableChar = "abcdefghijklmnopqrstuvwxyz"
            let cs = NSCharacterSet(charactersIn: acceptableChar).inverted
            let filtered = string.components(separatedBy: cs).joined(separator: "")
            
            if string == " " {
                addTag()
            }
            return (string == filtered)
            
        default :
            break
            
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == urgencyTF {
            titleTF.becomeFirstResponder()
        } else if textField == titleTF {
            descTV.becomeFirstResponder()
        } else if textField == descTV {
            compensationTF.becomeFirstResponder()
        } else if textField == compensationTF {
            genderTF.becomeFirstResponder()
        } else if textField == genderTF {
            ageTF.becomeFirstResponder()
        } else if textField == ageTF {
            infoTF.becomeFirstResponder()
        } else if textField == infoTF {
            addTag()
        } else {
            textField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.superview?.animateBorder(false, type: .border)
        
        switch textField {
        case urgencyTF :
            let currUrgency = urgencyTF.text ?? ""
            
            if currUrgency == "Tinggi" {
                newAssistanceUrgency = Urgency.high
                urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.highUrgency.cgColor
            } else if currUrgency == "Sedang" {
                newAssistanceUrgency = Urgency.medium
                urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.mediumUrgency.cgColor
            } else {
                newAssistanceUrgency = Urgency.low
                urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.lowUrgency.cgColor
            }
            
        case genderTF :
            let currGender = genderTF.text ?? ""
            
            if currGender == Gender.male.rawValue {
                newAssistanceGenderPref = Gender.male
            } else if currGender == Gender.female.rawValue {
                newAssistanceGenderPref = Gender.female
            } else {
                newAssistanceGenderPref = nil
            }
            
        case ageTF :
            let currAge = ageTF.text ?? ""
            
            if currAge == AgePreference.youngAdult.rawValue {
                newAssistanceAgePref = AgePreference.youngAdult
            } else if currAge == AgePreference.middleAdult.rawValue {
                newAssistanceAgePref = AgePreference.middleAdult
            } else if currAge == AgePreference.lateAdult.rawValue {
                newAssistanceAgePref = AgePreference.lateAdult
            } else {
                newAssistanceAgePref = nil
            }

        default :
            break
        }
    }
    
    //MARK: - Tag List View Actions
    func addTag() {
        var duplicate: Bool = false
        let newTag = infoTF.text!
        
        for tag in newAssistanceInfo {
            if newTag == tag {
                duplicate = true
            }
        }
        
        guard !duplicate else { return }
        
        currTags = newTag
        newAssistanceInfo.append(newTag)
        tagListView.addTag(newTag)
        infoTF.resignFirstResponder()
        infoTF.text = ""
        
        (newAssistanceInfo.count < 1) ? (infoSV.spacing = 0) : (infoSV.spacing = 5)
    }
    
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        sender.removeTagView(tagView)
        
        for (index, arrayTitle) in newAssistanceInfo.enumerated() {
            if title == arrayTitle {
                newAssistanceInfo.remove(at: index)
                (newAssistanceInfo.count < 1) ? (infoSV.spacing = 0) : (infoSV.spacing = 5)
            }
        }
    }
    
    //MARK: - Get Current location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        newAssistanceCoordinate = locValue
    }
}
