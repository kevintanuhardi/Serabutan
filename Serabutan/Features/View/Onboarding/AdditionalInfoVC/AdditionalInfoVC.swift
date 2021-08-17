//
//  AdditionalInfoVC.swift
//  Serabutan
//
//  Created by Patya Pindo on 05/08/21.
//

import Foundation
import UIKit

class AdditionalInfoVC: UIViewController, UITextViewDelegate {
    
    var onboardingName: String?
    var onboardingDOB: Date?
    var onboardingGender: Gender?
    
    @IBOutlet weak var descTV: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let user = UserProfile(id: id, name: "", dob: Date(), gender: .other, avatar: nil, bio: "", joinDate: Date(), isVerified: false, statistics: statistics)
        
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
        
    }
	
	func textViewDidBeginEditing(_ textView: UITextView) {
		textView.superview?.animateBorder(true, type: .border)
	}
	
	func textViewDidEndEditing(_ textView: UITextView) {
		textView.superview?.animateBorder(false, type: .border)
	}
	
	func textViewDidChange(_ textView: UITextView) {
		if textView.text.isEmpty || textView.text == "" || textView.text == "\n" {
			doneButton.isUserInteractionEnabled = false
			doneButton.backgroundColor = UIColor.ColorLibrary.mediumGrey
		} else {
			doneButton.isUserInteractionEnabled = true
			doneButton.backgroundColor = UIColor.ColorLibrary.accentColor
		}
	}
	
	func setNavigation() {
		initSkipButton()
		
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
		navigationItem.largeTitleDisplayMode = .never
		self.tabBarController?.tabBar.isHidden = true
		
		//Back Button
		self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
		self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
		navigationController?.navigationBar.isHidden = false
	}
	
	func initSkipButton(){
		let rightBarButton = UIBarButtonItem(title: "Lewati", style: .plain, target: self, action: #selector(finishOnboardingWithoutDesc))
		navigationItem.rightBarButtonItem = rightBarButton
		rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.FontLibrary.textLink1], for: .normal)
		rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.FontLibrary.textLink1], for: .application)
	}
}
