//
//  ProfileVCNavigationSetup.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 08/08/21.
//

import UIKit

extension ProfileVC {
    func navigationSetup() {
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        
        // Back Button
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    // Check if the visited profile is their own
    func checkLoggedUser() {
        if user?.id == loggedUser {
            // If visited profile is their own, 'Sunting' button will appear
            let rightBarButton = UIBarButtonItem(title: "Sunting", style: .plain, target: self, action: #selector(suntingProfile))
            rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.FontLibrary.textLink1], for: .normal)
            navigationItem.rightBarButtonItem = rightBarButton
        }
    }
    
    // Go to 'Sunting Profile' page
    @objc func suntingProfile() {
        let editProfile = EditProfileVC()
        editProfile.user = self.user
        self.navigationController?.pushViewController(editProfile, animated: true)
    }
}
