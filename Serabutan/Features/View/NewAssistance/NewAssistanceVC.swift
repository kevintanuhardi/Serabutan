//
//  NewAssistanceVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 28/07/21.
//

import UIKit

class NewAssistanceVC: UIViewController{
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleTFView: UIView!
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var descView: UIView!
    @IBOutlet weak var decTFView: UIView!
    @IBOutlet weak var descTF: UILabel!
    
    @IBOutlet weak var compensationView: UIView!
    @IBOutlet weak var compensationTFView: UIView!
    @IBOutlet weak var compensationTF: UITextField!
    
    @IBOutlet weak var preferenceView: UIView!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var genderImage: UIImageView!
    
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var ageImage: UIImageView!
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoTFView: UIView!
    @IBOutlet weak var infoTF: UITextField!
    @IBOutlet weak var infoCollectionView: UICollectionView!
    
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var mediaAddView: UIView!
    @IBOutlet weak var mediaAddButton: UIButton!
    @IBOutlet weak var mediaImageCollectionView: UICollectionView!
    
    private var newAssistanceTitle: String = ""
    private var newAssistanceDes: String = ""
    private var newAssistanceCompensation: String = ""
    private var newAssistanceGenderPref: String = ""
    private var newAssistanceAgePref: String = ""
    private var newAssistanceInfo: [String] = []
    private var newAssistanceMediaImage: [String] = []
    
    var currTags: [TagModel] = []
    var currMediaImage: [String] = []
    let agePreferenceData = ["Pria", "Perempuan"]
    let genderPreferenceData = ["18-25", "25-40", "> 40"]
    
    var genderPickerView = UIPickerView()
    var agePickerView = UIPickerView()
    var selectedValueGender : String?
    var selectedValueAge : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buat Permintaan Bantuan"
        infoCollectionView.isHidden = true
        tabBarController?.tabBar.isHidden = true
        
        setupView()
        infoCollectionView.dataSource = self
        infoCollectionView.delegate = self
        infoCollectionView.register(TagCollectionViewCell.nib(), forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        
//        mediaImageCollectionView.dataSource = self
//        mediaImageCollectionView.delegate = self
//        mediaImageCollectionView.register(MediaCollectionViewCell.nib(), forCellWithReuseIdentifier: MediaCollectionViewCell.identifier)
    }
    
    func setupView(){
        setCustomTextField()
        setNavigationBarItems()
        createPickerGender()
        createPickerAge()
        
        getTagInput()
    }
    
    @IBAction func cancelButtonAction(_sender: Any){
        let myViewController = HomeVC(nibName: "HomeVC", bundle: nil)
        self.present(myViewController, animated: true, completion: nil)
    }
    
    @IBAction func shareButtonAction(_sender: Any){
        print("Share Button Clicked")
    }
    
    func getTagInput(){
        
    }
    
    @IBAction func addMediaImageAction(_ sender: Any) {
        
    }
    
}


extension NewAssistanceVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField, _button: UIButton) -> Bool {
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField, _ button: UIButton) {
        
    }

}

