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
        navigationController?.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btnMulai(_ sender: Any) {
        
        let formulirProfilVC = FormulirProfilVC()
        self.navigationController?.pushViewController(formulirProfilVC, animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
}
