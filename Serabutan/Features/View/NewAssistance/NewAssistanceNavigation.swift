//
//  NANavigation.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 16/08/21.
//

import Foundation

extension NewAssistanceVC {
    
    func navigateCancel() {
        guard let text = titleTF.text, text.isEmpty else { dismissAlert(); return }
        guard let text = descTV.text, text.isEmpty else { dismissAlert(); return }
        self.dismiss(animated: true, completion: nil)
    }
    
}
