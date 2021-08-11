//
//  EditProfileExtension.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 08/08/21.
//

import UIKit

extension EditProfileVC {
    
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
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.isEmpty == true {
            navigationItem.rightBarButtonItem?.isEnabled = false
            navigationItem.rightBarButtonItem?.customView?.backgroundColor = .ColorLibrary.mediumGrey
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = true
            navigationItem.rightBarButtonItem?.customView?.backgroundColor = .ColorLibrary.accentColor
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.superview?.animateBorder(true, type: .border)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.superview?.animateBorder(false, type: .border)
    }
    
    // MARK: - ImagePicker
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        
        profileImage.image = image
        user?.avatar = image
    }
}
