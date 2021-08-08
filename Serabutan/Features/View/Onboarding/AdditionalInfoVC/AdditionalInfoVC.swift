//
//  AdditionalInfoVC.swift
//  Serabutan
//
//  Created by Patya Pindo on 05/08/21.
//

import Foundation
import UIKit

class AdditionalInfoVC: UIViewController {
    
    var activeTextField: UITextField? = nil
    
    var newDescription: String? = ""
    
    //    var genderPV =  UIPickerView()
    //    var genderPVData: [String] = ["Laki-laki", "Perempuan", "Tidak ada preferensi"]
    //    var formulirData: Any = []
    //
    //    var newNamaLengkap: String? = ""
    //    var newTanggalLahir: String? = ""
    //    var newSelectedGender: String? = ""
    //
    //    var namaLengkap: String?
    //    var tanggalLahir: String?
    //    var selectedGender: String?
    
    @IBOutlet weak var deskripsiField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
    }
}

extension AdditionalInfoVC{
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
        textField.superview?.animateBorder(true, type: .border)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        if textField == deskripsiField {
    //            @sesuatu@.becomeFirstResponder()
    //        } else {
    //            textField.resignFirstResponder()
    //        }
    //        return true
    //    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.superview?.animateBorder(false, type: .border)
        
        if textField == deskripsiField{
            let currDeskripsi = deskripsiField.text!
            
            if (deskripsiField .isEditing) {
                let viewDeskripsi = String(currDeskripsi)
                deskripsiField.text = viewDeskripsi
            }
            
            if (deskripsiField .endEditing(true)) {
                let viewDeskripsi = String(currDeskripsi) ?? newDescription
                deskripsiField.text = viewDeskripsi
            }
        }
    }
}
