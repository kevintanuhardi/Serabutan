//
//  EditProfileNavigationConfig.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 08/08/21.
//

import UIKit

extension EditProfileVC {
    func navigationSetup() {
        navigationController?.navigationBar.barTintColor = .ColorLibrary.lightGrey
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.ColorLibrary.customBlack]
        
        navigationButtonSetup()
    }
    
    func navigationButtonSetup() {
        // Simpan Button
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
    
    // MARK: - Alert
    
    // Dismissing the View Controller
    @objc func dismissVC() {
        if (tempName != fullName.text) || (tempDescription != descriptionTextView.text) {
            let alert = UIAlertController(title: "Perubahan Belum Disimpan",
                                          message: "Anda memiliki perubahan yang belum disimpan. Anda yakin ingin membatalkan?",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ya, batalkan",
                                          style: .destructive,
                                          handler: { action in
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
        let delete = UIAlertAction(title: "Hapus Foto Saat Ini",
                                  style: .default,
                                  handler: { action in
                                    self.user?.avatar = nil
                                  })
        let camera = UIAlertAction(title: "Ambil Foto",
                                   style: .default,
                                   handler: { action in
                                     ImageHelper.startMediaBrowser(delegate: self, sourceType: .camera)
                                   })
        let gallery = UIAlertAction(title: "Pilih dari Galeri",
                                    style: .default,
                                    handler: { action in
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
