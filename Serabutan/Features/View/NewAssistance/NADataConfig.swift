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
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareButtonAction(_sender: Any){
        initOtherData()
        initCreateNewJob()
		let latestDummyData = DummyData.shared.getJobsList()
		print(latestDummyData.last?.price)
        self.dismiss(animated: true, completion: {
			guard let lastJob = latestDummyData.last else {return}
			self.delegate?.navigateToDetailProduct(job: lastJob)
        })
    }
    
    func initOtherData(){
        let newId = dummyData.count
        newAssistanceJobId = newId
        
        let newDate = Date()
        newAssistancePostDate = newDate
        
        let jobPosterId = DummyData.shared.getUserProfile()[userDefault]
        newAssistanceJobPosterId = jobPosterId
    }
    
    func initCreateNewJob(){
        if newAssistanceTitle == ""{
            createTitleEmpty()
            titleTF.becomeFirstResponder()
        } else if newAssistanceDes == ""{
            createDescEmpty()
            descTV.becomeFirstResponder()
        } else {
            guard let jobPosterId = newAssistanceJobPosterId else { return }
            
            let job = Jobs(id: newAssistanceJobId!,
                           jobPosterId: jobPosterId,
                           postingDate: newAssistancePostDate!,
                           urgency: newAssistanceUrgency!,
                           title: newAssistanceTitle!,
                           desc: newAssistanceDes!,
                           price: newAssistanceCompensation!,
                           status: newAssistanceStatus,
                           distance: newAssistanceDistance ?? 0,
                           coordinate: newAssistanceCoordinate!,
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
        self.activeTextView = textView
        textView.superview?.animateBorder(true, type: .border)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.superview?.animateBorder(false, type: .border)
        
        let currDesc = descTV.text!
        newAssistanceDes = currDesc
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
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
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.superview?.animateBorder(false, type: .border)
        
        if textField == urgencyTF {
            let currUrgency = urgencyTF.text!
            
            if currUrgency == "Tinggi"{
                newAssistanceUrgency = Urgency.high
                urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.highUrgency.cgColor
            } else if currUrgency == "Sedang"{
                newAssistanceUrgency = Urgency.medium
                urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.mediumUrgency.cgColor
            } else {
                newAssistanceUrgency = Urgency.low
                urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.lowUrgency.cgColor
            }
        }
        
        let currTitle = titleTF.text!
        newAssistanceTitle = currTitle
        
        if textField == compensationTF {
            let currComp = compensationTF.text!.replacingOccurrences(of: ".", with: "")
            
            if (compensationTF .isEditing) {
                let viewComp = Int(currComp)
                compensationTF.text = StringFormatter().priceFormatting(amount: viewComp!)
            }
            
            if (compensationTF .endEditing(true)) {
                let viewComp = Int(currComp) ?? newAssistanceCompensation
                compensationTF.text = StringFormatter().priceFormatting(amount: viewComp!)
            }
            newAssistanceCompensation = Int(currComp) ?? 0
        }
        
        if textField == genderTF {
            let currGender = genderTF.text!
            
            if currGender == "Tidak ada preferensi"{
                newAssistanceGenderPref = Gender.other
            } else if currGender == "Laki-laki"{
                newAssistanceGenderPref = Gender.male
            } else {
                newAssistanceGenderPref = Gender.female
            }
        }
        
        if textField == ageTF {
            let currAge = ageTF.text!
            
            if currAge == "18-25"{
                newAssistanceAgePref = AgePreference.youngAdult
            } else if currAge == "26-40"{
                newAssistanceAgePref = AgePreference.middleAdult
            } else {
                newAssistanceAgePref = AgePreference.lateAdult
            }
        }
        
        if textField == infoTF{
            let newTag = infoTF.text!
            currTags = newTag
            newAssistanceInfo.append(newTag)
            tagListView.addTag(newTag)
            infoTF.resignFirstResponder()
            infoTF.text = ""
            
            (newAssistanceInfo.count < 1) ? (infoSV.spacing = 0) : (infoSV.spacing = 5)
        } else {
            print("nothing insert")
        }
        
    }
    
    //MARK: - Tag List View Actions
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag Remove pressed: \(title), \(sender)")
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
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        newAssistanceCoordinate = locValue
    }
    
}
