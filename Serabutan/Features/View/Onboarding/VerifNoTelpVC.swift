//
//  VerifNoTelpVC.swift
//  Serabutan
//
//  Created by Patya Pindo on 05/08/21.
//

import Foundation
import UIKit

class VerifNoTelpVC: UIViewController {

    @IBOutlet weak var codeField1: UITextField!
    @IBOutlet weak var codeField2: UITextField!
    @IBOutlet weak var codeField3: UITextField!
    @IBOutlet weak var codeField4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToFormulirProfil(_ sender: Any) {
        let formulirProfilVC = FormulirProfilVC()
        self.navigationController?.pushViewController(formulirProfilVC, animated: true)
    }
    
}
