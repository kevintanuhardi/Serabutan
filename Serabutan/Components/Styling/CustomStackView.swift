//
//  CustomTextField.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 01/08/21.
//

import Foundation
import UIKit

class CustomStackView : UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}
