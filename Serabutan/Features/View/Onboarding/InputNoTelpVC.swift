//
//  InputNoTelpVC.swift
//  Serabutan
//
//  Created by Patya Pindo on 04/08/21.
//

import Foundation
import UIKit

class InputNoTelpVC: UIViewController {
    
    @IBOutlet var fieldBorder: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToVerifNoTelp(_ sender: Any) {
        let verifNoTelpVC = VerifNoTelpVC()
        self.navigationController?.pushViewController(verifNoTelpVC, animated: true)
    }
    
}
