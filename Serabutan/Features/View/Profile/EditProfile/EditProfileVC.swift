//
//  EditProfileVCViewController.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 01/08/21.
//

import UIKit
import AVKit
import MobileCoreServices

class EditProfileVC: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var avatarContainer: UIView!
    @IBOutlet weak var nameField: UIStackView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var shortDesc: UILabel!
    
    @IBOutlet weak var buttonUbah: UIButton!
    @IBOutlet weak var charCount: UILabel!
    
    var user: UserProfile?
    var tempName: String?
    var tempDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetup()
        updateUI()
        
        descriptionTextView.delegate = self
        fullName.delegate = self
        
        tempName = fullName.text
        tempDescription = descriptionTextView.text
    }
    
    func updateUI() {
        
        // Set user
        fullName.text = user?.name
        profileImage.image = user?.avatar
        descriptionTextView.text = user?.bio
        
        // Set page UI
        self.title = "Sunting Profile"
        
        buttonUbah.setTitleColor(.white, for: .normal)
        buttonUbah.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        avatarContainer.layer.masksToBounds = true
        avatarContainer.layer.cornerRadius = avatarContainer.frame.height / 2
        descriptionTextView.textContainerInset = .zero
        descriptionTextView.textContainer.lineFragmentPadding = 0
        
        shortDesc.font = UIFont.FontLibrary.caption2
        
        buttonUbah.backgroundColor = UIColor.ColorLibrary.darkGrey.withAlphaComponent(0.75)
        charCount.text = "\(descriptionTextView.text.count) / 300"
        
    }
    
    @IBAction func changeProfilePicture(_ sender: Any) {
        self.changeProfilePictureAlert()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        charCount.text = "\(descriptionTextView.text.count) / 300"
        
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.superview?.animateBorder(true, type: .border)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.superview?.animateBorder(false, type: .border)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.superview?.animateBorder(true, type: .border)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.superview?.animateBorder(false, type: .border)
    }
}
