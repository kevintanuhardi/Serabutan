//
//  InputNoTelpVC.swift
//  Serabutan
//
//  Created by Patya Pindo on 04/08/21.
//

import Foundation
import UIKit

class InputNoTelpVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var noTelpField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        noTelpField.delegate = self
    }
    
    @IBAction func btnLanjut(_ sender: Any) {
        let verifNoTelpVC = VerifNoTelpVC()
        //if noTelpField.text.size
        
        self.navigationController?.pushViewController(verifNoTelpVC, animated: true)
    }
}

extension InputNoTelpVC{
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
