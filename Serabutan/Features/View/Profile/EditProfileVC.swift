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
        updateUI()
        descriptionTextView.delegate = self
        fullName.delegate = self
        
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
        
        shortDesc.font = UIFont.FontLibrary.caption2
        
        buttonUbah.backgroundColor = UIColor.ColorLibrary.darkGrey.withAlphaComponent(0.75)
        charCount.text = "\(descriptionTextView.text.count) / 300"
        
    }
    
    // Navigation related UI
    func navigationUI() {
        navigationController?.navigationBar.barTintColor = .ColorLibrary.lightGrey
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.ColorLibrary.customBlack]
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 65, height: 30)
        button.setTitle("Simpan", for: .normal)
        button.titleLabel?.font = .FontLibrary.textLink1
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .ColorLibrary.accentColor
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    @IBAction func changeProfilePicture(_ sender: Any) {
        self.changeProfilePictureAlert()
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
                                          style: .default,
                                          handler: nil))
            alert.addAction(UIAlertAction(title: "Keluar",
                                          style: .cancel,
                                          handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    // Change profile picture alert handler (camera, gallery, or cancel)
    func changeProfilePictureAlert() {
        let alert = UIAlertController(title: "Pick source",
                                      message: "Lorem ipsum.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ambil Foto",
                                      style: .default,
                                      handler: { action in
                                        ImageHelper.startMediaBrowser(delegate: self, sourceType: .camera)
                                      }))
        alert.addAction(UIAlertAction(title: "Album",
                                      style: .default,
                                      handler: { action in
                                        ImageHelper.startMediaBrowser(delegate: self, sourceType: .savedPhotosAlbum)
                                      }))
        alert.addAction(UIAlertAction(title: "Batal",
                                      style: .cancel,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
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
