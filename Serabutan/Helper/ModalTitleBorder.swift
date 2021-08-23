//
//  ModalTitleBorder.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 23/08/21.
//

import Foundation
import UIKit

extension UIColor {
    func setupmodalBottomBorder() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 0.5, height: 0.5))
        setFill()
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 0.5, height: 0.5))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
}
