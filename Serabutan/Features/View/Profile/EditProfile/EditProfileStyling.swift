//
//  EditProfileStyling.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 08/08/21.
//

import UIKit

extension EditProfileVC {
    
    func setupUI() {
        setStyle()
        configureText()
    }
    
    // MARK: - Navigation Items
    func setNavigation() {
        title = "Sunting Profile"
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.barTintColor = .ColorLibrary.lightGrey
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.ColorLibrary.customBlack]
        
        setNavigationItems()
        
        // Custom View for Dark Mode
        setDarkView()
    }
    
    func setNavigationItems() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 65, height: 30)
        button.setTitle("Simpan", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .FontLibrary.textLink1
        button.backgroundColor = .ColorLibrary.accentColor
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(saveUpdates), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)

    }
    
    // MARK: - Static UI
    func setStyle() {
        // Delegate
        descriptionTextView.delegate = self
        fullName.delegate = self
        
        buttonUbah.setTitleColor(.white, for: .normal)
        buttonUbah.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        avatarContainer.layer.masksToBounds = true
        avatarContainer.layer.cornerRadius = avatarContainer.frame.height / 2
        fullName.font = .FontLibrary.body
        fullName.textColor = .ColorLibrary.customBlack
        descriptionTextView.font = .FontLibrary.body
        descriptionTextView.textColor = .ColorLibrary.customBlack
        descriptionTextView.textContainerInset = .zero
        descriptionTextView.textContainer.lineFragmentPadding = 0
        shortDesc.font = .FontLibrary.caption2
        
        buttonUbah.backgroundColor = .ColorLibrary.accentColor.withAlphaComponent(0.75)
        charCount.text = "\(user?.bio?.count ?? 0) / 300"
        
        // Avatar background image
        let backgroundImage = UIImageView(frame: avatarContainer.bounds)
        backgroundImage.image = UIImage(named: "avatarIcon")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        avatarContainer.insertSubview(backgroundImage, at: 0)
        
    }
    
    func configureText() {
        fullName.text = user?.name
        profileImage.image = user?.avatar
        descriptionTextView.text = user?.bio
        
        // Temporary Variables
        tempName = fullName.text
        tempAvatar = profileImage.image
        tempDescription = descriptionTextView.text
    }
    
    func setDarkView() {
        if traitCollection.userInterfaceStyle == .dark {
            self.view.backgroundColor = .ColorLibrary.customBlackBackground
            navigationController?.navigationBar.barTintColor = .ColorLibrary.customBlackBackground
        }
    }
    
    // MARK: - Alert
    @objc func dismissVC() {
        if (tempName != fullName.text) || (tempDescription != descriptionTextView.text) || (tempAvatar != profileImage.image) {
            let alert = UIAlertController(title: "Perubahan Belum Disimpan",
                                          message: "Anda memiliki perubahan yang belum disimpan. Anda yakin ingin membatalkan?",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ya, batalkan",
                                          style: .destructive,
                                          handler: { _ in
                                            self.navigationController?.popViewController(animated: true)
                                          }))
            alert.addAction(UIAlertAction(title: "Tidak",
                                          style: .default,
                                          handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    // Change profile picture alert handler (camera, gallery, or cancel)
    func changeProfilePictureAlert() {
        let alert = UIAlertController(title: "Ganti Foto Profil",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Hapus Foto",
                                  style: .destructive,
                                  handler: { _ in
                                    self.profileImage.image = nil
                                  })
        let camera = UIAlertAction(title: "Ambil Foto",
                                   style: .default,
                                   handler: { _ in
                                     ImageHelper.startMediaBrowser(delegate: self, sourceType: .camera)
                                   })
        let gallery = UIAlertAction(title: "Pilih dari Galeri",
                                    style: .default,
                                    handler: { _ in
                                      ImageHelper.startMediaBrowser(delegate: self, sourceType: .savedPhotosAlbum)
                                    })
        let cancel = UIAlertAction(title: "Batal",
                                   style: .cancel,
                                   handler: nil)
        
        // Delete option if user already set their avatar
        if user?.avatar != nil {
            alert.addAction(delete)
        }
        
        alert.addAction(camera)
        alert.addAction(gallery)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}
