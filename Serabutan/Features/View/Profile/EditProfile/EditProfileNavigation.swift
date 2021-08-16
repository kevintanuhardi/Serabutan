//
//  EditProfileNavigation.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 08/08/21.
//

import UIKit

extension EditProfileVC {
    
    @IBAction func changeProfilePicture(_ sender: Any) {
        self.changeProfilePictureAlert()
    }
    
    @objc func saveUpdates() {
        user?.avatar = profileImage.image
        user?.name = fullName.text ?? ""
        user?.bio = descriptionTextView.text
        self.navigationController?.popViewController(animated: true)
    }
}
