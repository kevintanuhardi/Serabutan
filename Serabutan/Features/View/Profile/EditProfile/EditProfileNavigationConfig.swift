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
            navigationController?.popViewController(animated: true)
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
}
