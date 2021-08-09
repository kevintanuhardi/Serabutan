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
    
    @IBAction func goToFormulirProfil(_ sender: Any) {
        let formulirProfilVC = FormulirProfilVC()
        self.navigationController?.pushViewController(formulirProfilVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
    }
}

extension VerifNoTelpVC{
    func setNavigation() {
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .white
        
        navigationItem.largeTitleDisplayMode = .never
        self.tabBarController?.tabBar.isHidden = true
        
        //Back Button
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        navigationController?.navigationBar.isHidden = false
    }
}

