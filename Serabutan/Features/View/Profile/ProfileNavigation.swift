//
//  ProfileNavigation.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 08/08/21.
//

import UIKit

extension ProfileVC {
    
    // Go to 'Sunting Profile' page
    @objc func goToEditProfile() {
        let editProfile = EditProfileVC()
        editProfile.user = self.user
        self.navigationController?.pushViewController(editProfile, animated: true)
    }
    
}
