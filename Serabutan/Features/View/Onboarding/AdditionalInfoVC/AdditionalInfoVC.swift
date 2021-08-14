//
//  AdditionalInfoVC.swift
//  Serabutan
//
//  Created by Patya Pindo on 05/08/21.
//

import Foundation
import UIKit

class AdditionalInfoVC: UIViewController, UITextViewDelegate {
    
    var onboardingName: String!
    var onboardingDOB: Date!
    var onboardingGender: Gender!
    
    @IBOutlet weak var descTV: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingName = "Yahya Ayyash"
        onboardingDOB = Date()
        onboardingGender = .male
        
        descTV.delegate = self
        setNavigation()
        doneButton.backgroundColor = UIColor.ColorLibrary.mediumGrey
        descTV.textContainerInset = .zero
        descTV.textContainer.lineFragmentPadding = 0
        
    }
    
    @IBAction func testFunction(_ sender: Any) {
        applyDummyValue(bio: true)
    }
    
    @objc func finishOnboardingWithoutDesc(_ sender: Any){
        applyDummyValue(bio: false)
    }
    
    func applyDummyValue(bio: Bool){
        let id = DummyData.shared.getUserProfile().count
        let statistics = ProfileStatistic(reviewAggregate: 0, totalReview: 0, dibantu: 0, membantu: 0)
        
        let user = UserProfile(id: id, name: "", dob: Date(), gender: .other, avatar: UIImage(named: "Avatar")!, bio: "", joinDate: Date(), isVerified: false, statistics: statistics)
        
        guard let name = onboardingName else { return }
        user.name = name
        
        guard let dob = onboardingDOB else { return }
        user.dob = dob
        
        guard let gender = onboardingGender else { return }
        user.gender = gender
        
        if bio {
            guard let bio = descTV.text else { return }
            user.bio = bio
        }
        
        DummyData.shared.addProfile(user: user)
        UserDefaults.standard.set(user.id, forKey: "loggedUser")
        
        // Segue
        let homeVC = TabBarController()
        homeVC.modalPresentationStyle = .overFullScreen
        self.navigationController?.present(homeVC, animated: true)
        
        print("Segue")
    }
}
