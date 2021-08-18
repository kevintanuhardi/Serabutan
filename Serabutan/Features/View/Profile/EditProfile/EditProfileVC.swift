//
//  EditProfileVCViewController.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 01/08/21.
//

import UIKit
import AVKit
import MobileCoreServices

class EditProfileVC: UIViewController, UITextFieldDelegate, UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var user: UserProfile?
    var tempName: String?
    var tempDescription: String?
    var tempAvatar: UIImage?
    let currentUser = UserDefaults.standard.integer(forKey: "loggedUser")
    
    @IBOutlet weak var avatarContainer: UIView!
    @IBOutlet weak var nameField: UIStackView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var shortDesc: UILabel!
    
    @IBOutlet weak var buttonUbah: UIButton!
    @IBOutlet weak var charCount: UILabel!
    
    // MARK: - View Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
}
