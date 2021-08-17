//
//  TableViewHelper.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 17/08/21.
//

import Foundation
import UIKit

extension UITableView {
    
    func EmptyMessage(_ message: String) {
        let rect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.bounds.height / 1.5)
        let messageLabel = UILabel(frame: rect)
        messageLabel.text = message
        messageLabel.textColor = .ColorLibrary.darkGrey
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = .FontLibrary.bodyBold
        
        self.tableFooterView = messageLabel
        
    }
}
