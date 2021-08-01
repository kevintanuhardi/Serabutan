//
//  EditProfileVCViewController.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 01/08/21.
//

import UIKit

class EditProfileVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var avatarContainer: UIView!
    @IBOutlet weak var nameField: UIStackView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullName: UITextField!
    
    @IBOutlet weak var buttonUbah: UIButton!
    @IBOutlet weak var charCount: UILabel!
    
    var user: UserProfile?
    var tempName: String?
    var tempDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        descriptionTextView.delegate = self
        
        tempName = fullName.text
        tempDescription = descriptionTextView.text
    }
    
    func updateUI() {
        navigationUI()
        
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
        
        buttonUbah.backgroundColor = UIColor.ColorLibrary.darkGrey.withAlphaComponent(0.75)
        charCount.text = "\(descriptionTextView.text.count) / 300"

    }
    
    // Navigation related UI
    func navigationUI() {
        navigationController?.navigationBar.barTintColor = UIColor.ColorLibrary.lightGrey
        navigationController?.navigationBar.shadowImage = UIImage()

        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 65, height: 30)
        button.setTitle("Simpan", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.ColorLibrary.accentColor
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    // Dismissing the View Controller
    @objc func dismissVC() {
        if (tempName != fullName.text) || (tempDescription != descriptionTextView.text) {
            let alert = UIAlertController(title: "Simpan Perubahan?",
                                          message: "Anda telah melakukan perubahan.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Simpan",
                                          style: .default,
                                          handler: nil))
            alert.addAction(UIAlertAction(title: "Batal",
                                          style: .cancel,
                                          handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        charCount.text = "\(descriptionTextView.text.count) / 300"
        
        return true
    }
}
