//
//  AdditionalInfoVC.swift
//  Serabutan
//
//  Created by Patya Pindo on 05/08/21.
//

import Foundation
import UIKit

class AdditionalInfoVC: UIViewController, UITextViewDelegate {
    
    var activeTextField: UITextField?
    var dummy = DummyData.shared.getUserProfile()
    var onboardingDescription: String? = ""
    var onboardingName: String!
    var onboardingDOB: Date!
    var onboardingGender: Gender!
    
    @IBOutlet weak var descTV: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descTV.delegate = self
        setNavigation()
        doneButton.backgroundColor = UIColor.ColorLibrary.mediumGrey
    }
    
    @IBAction func finishOnboardingDesc(sender: UIButton){
        if onboardingDescription == "" {
            doneButton.isUserInteractionEnabled = false
        } else {
            doneButton.isUserInteractionEnabled = true
            doneButton.tintColor = UIColor.ColorLibrary.accentColor
            applyDummyValue()
            let homeVC = HomeVC()
            self.navigationController?.pushViewController(homeVC, animated: true)
            print("DUMMY 0:", dummy[0])
        }
    }
    
    @IBAction func finishOnboardingWithoutDesc(_ sender: Any){
        applyDummyValue()
        let homeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: true)
        print("DUMMY 0:", dummy[0])
    }
    
    func applyDummyValue(){
        var data  = dummy[0]
        
        guard let name = onboardingName else { return }
        data.name = name
        
        guard let dob = onboardingDOB else { return }
        data.dob = dob
        
        guard let gender = onboardingGender else { return }
        data.gender = gender
        
        guard let bio = onboardingDescription else { return }
        data.bio = bio
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            doneButton.isUserInteractionEnabled = true
            doneButton.backgroundColor = UIColor.ColorLibrary.accentColor
            return false
        }
        return true
    }
}
