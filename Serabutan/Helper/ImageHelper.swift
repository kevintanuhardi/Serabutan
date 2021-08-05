//
//  ImageHelper.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 02/08/21.
//

import UIKit
import MobileCoreServices

enum ImageHelper {
    static func startMediaBrowser (
        delegate: UIViewController & UINavigationControllerDelegate & UIImagePickerControllerDelegate,
        sourceType: UIImagePickerController.SourceType
    ) {
        guard UIImagePickerController.isSourceTypeAvailable(sourceType)
        else { return }
        
        let mediaUI = UIImagePickerController()
        mediaUI.sourceType = sourceType
        mediaUI.mediaTypes = [kUTTypeImage as String]
        mediaUI.allowsEditing = true
        mediaUI.delegate = delegate
        
        delegate.present(mediaUI, animated: true, completion: nil)
    }
}
