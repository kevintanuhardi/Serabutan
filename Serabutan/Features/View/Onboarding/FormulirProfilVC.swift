//
//  FormulirProfilVC.swift
//  Serabutan
//
//  Created by Patya Pindo on 05/08/21.
//

import Foundation
import UIKit

class FormulirProfilVC: UIViewController {

    @IBOutlet weak var namaLengkapField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToAdditionalInfo(_ sender: Any) {
        let additionalInfoVC = AdditionalInfoVC()
        self.navigationController?.pushViewController(additionalInfoVC, animated: true)
    }
    
}
