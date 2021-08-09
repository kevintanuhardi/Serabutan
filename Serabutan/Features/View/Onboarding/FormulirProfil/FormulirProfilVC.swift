//
//  FormulirProfilVC.swift
//  Serabutan
//
//  Created by Patya Pindo on 05/08/21.
//

import DropDown
import Foundation
import UIKit


class FormulirProfilVC: UIViewController, UITextFieldDelegate {
    
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["item1", "item2", "item3"]
        return menu
    }()
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var namaLengkapTxt: UITextField!
    @IBOutlet weak var genderTxt: UITextField!
    
    var genderPV =  UIPickerView()
    var genderPVData: [Gender] = [.male, .female, .other]
    var selectedGender: String?
    var formulirData: Any = []
    
    var activeTextField: UITextField? = nil
    var newName: String?
    var newDOB: Date?
    var newGender: Gender? = .male
    
    @IBAction func goToAdditionalInfo(_ sender: Any) {
        if newName == .none {
            nameAlert()
        } else if newDOB == .none {
            dobAlert()
        } else if newGender == .none {
            genderAlert()
        } else {
            let additionalInfoVC = AdditionalInfoVC()
            additionalInfoVC.onboardingName = newName
            additionalInfoVC.onboardingDOB = newDOB
            additionalInfoVC.onboardingGender = newGender
        
            UserDefaults.standard.set(true, forKey: "doneOnboarding")
            
            self.navigationController?.pushViewController(additionalInfoVC, animated: true)
        }
//        print("PASSED NAME:", newName)
//        print("PASSED DOB:" , newDOB)
//        print("PASSED GENDER:", newGender)
//        print("selected Gender:", selectedGender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namaLengkapTxt.delegate = self
        genderTxt.delegate = self
        setNavigation()
        showDatePicker()
        createPickerGender()
        UserDefaults.standard.set(false, forKey: "doneOnboarding")
    }
    
}


