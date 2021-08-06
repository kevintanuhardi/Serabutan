//
//  CustomButton.swift
//  Serabutan
//
//  Created by Patya Pindo on 06/08/21.
//

import Foundation
import UIKit

class PrimaryButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
        setup()
    }
    
    private func setup() {
        self.titleLabel?.font = .FontLibrary.button
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .ColorLibrary.accentColor
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
    }
}

class PrimaryButtonWhite: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
        setup()
    }
    
    private func setup() {
        self.titleLabel?.font = .FontLibrary.button
        self.setTitleColor(.ColorLibrary.accentColor, for: .normal)
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
    }
}
