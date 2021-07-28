//
//  NewAssistanceVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 28/07/21.
//

import UIKit

class NewAssistanceVC: UIViewController {
    
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleTFView: UIView!
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var descView: UIView!
    @IBOutlet weak var decTFView: UIView!
    @IBOutlet weak var descTF: UILabel!
    
    @IBOutlet weak var compensationView: UIView!
    @IBOutlet weak var compensationTFView: UIView!
    @IBOutlet weak var compensationTF: UITextField!
    
    @IBOutlet weak var preferenceView: UIView!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var genderButton: UIButton!
    @IBOutlet weak var genderImage: UIImageView!
    
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var ageButton: UILabel!
    @IBOutlet weak var ageImage: UIImageView!
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoTFView: UIView!
    @IBOutlet weak var infoTF: UITextField!
    @IBOutlet weak var infoCollectionView: UICollectionView!
    
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var mediaAddView: UIView!
    @IBOutlet weak var mediaAddButton: UIButton!
    
    private var newAssistanceTitle: String = ""
    private var newAssistanceDes: String = ""
    private var newAssistanceCompensation: String = ""
    private var newAssistanceGenderPref: String = ""
    private var newAssistanceAgePref: String = ""
    private var newAssistanceInfo: [String] = []
    private var newAssistanceMediaImage: [String] = []
    
    private var selectedTags: [String] = []
    
    private var currInfo: [String] = []
    private var currMediaImage: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buat Permintaan Bantuan"
        infoCollectionView.isHidden = true
        tabBarController?.tabBar.isHidden = true
        setCustomTextField()
        setNavigationBarItems()
    }
    
    
}

//extension NewAssistanceVC: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField, _button: UIButton) -> Bool {
//        if textField == titleTF {
//            descTF.becomeFirstResponder()
//        } else if textField == descTF {
//            compensationTF.becomeFirstResponder()
//        } else if textField == compensationTF {
//            genderButton.becomeFirstResponder()
//        } else if textField == genderButton {
//            ageButton.becomeFirstResponder()
//        } else if textField == ageButton {
//            infoTF.becomeFirstResponder()
//        } else if textField == infoTF {
//            mediaAddButton.becomeFirstResponder()
//        } else {
//            textField.resignFirstResponder()
//        }
//        return true
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField, _ button: UIButton) {
//        if textField == titleTF {
//            newAssistanceTitle = textField.text!
//            descTF.becomeFirstResponder()
//        } else if textField == descTF {
//            newAssistanceDes = textField.text!
//            compensationTF.becomeFirstResponder()
//        } else if textField == compensationTF {
//            newAssistanceCompensation = textField.text!
//            genderButton.becomeFirstResponder()
//                        } else if textField == genderButton {
//                            newAssistanceGenderPref = textField.text!
//                            ageButton.becomeFirstResponder()
//                        } else if textField == ageButton {
//                            newAssistanceAgePref = textField.text!
//                            infoTF.becomeFirstResponder()
//                        } else if textField == infoCollectionView {
//                            newAssistanceInfo = textField.text!
//                            mediaAddButton.becomeFirstResponder()
//                        } else {
//                            newAssistanceMediaImage = textField.text!
//                            actStatusTxt.becomeFirstResponder()
//        }
//    }
//
//}
