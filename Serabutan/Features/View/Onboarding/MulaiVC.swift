//
//  MulaiVC.swift
//  Serabutan
//
//  Created by Patya Pindo on 04/08/21.
//

import Foundation
import UIKit

class MulaiVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
        
    }
    
    @IBAction func mulai(_ sender: Any) {
        
        let inputNoTelpVC = InputNoTelpVC()
        self.navigationController?.pushViewController(inputNoTelpVC, animated: true)
            
    }
    
}
