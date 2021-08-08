//
//  FormulirProfilVC.swift
//  Serabutan
//
//  Created by Patya Pindo on 05/08/21.
//

import DropDown
import Foundation
import UIKit


class FormulirProfilVC: UIViewController {
    
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["item1", "item2", "item3"]
        return menu
    }()
    
    let datePicker = UIDatePicker()

    @IBOutlet weak var birthDateTxt: UITextField!
    
    @IBOutlet weak var namaLengkapTxt: UITextField!
    
    @IBOutlet weak var genderTxt: UITextField!
    
    var genderPV =  UIPickerView()
    var genderPVData: [String] = ["Laki-laki", "Perempuan", "Tidak ada preferensi"]
    var formulirData: Any = []
    
    var activeTextField: UITextField? = nil
    
    var newNamaLengkap: String? = ""
    var newTanggalLahir: String? = ""
    var newSelectedGender: String? = ""
    
    var namaLengkap: String?
    var tanggalLahir: String?
    var selectedGender: String?
    
    @IBAction func goToAdditionalInfo(_ sender: Any) {
        let additionalInfoVC = AdditionalInfoVC()
        self.navigationController?.pushViewController(additionalInfoVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        createDatePicker()
        createPickerGender()
    }
    
}


