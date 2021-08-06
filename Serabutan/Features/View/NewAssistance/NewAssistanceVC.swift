//
//  NewAssistanceVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 28/07/21.
//

import UIKit
import MapKit
import TagListView

class NewAssistanceVC: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, TagListViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var urgencyView: UIView!
    @IBOutlet weak var urgencyTFView: UIView!
    @IBOutlet weak var urgencyTF: UITextField!
    @IBOutlet weak var urgencyIndicatorView: UIView!
    @IBOutlet weak var urgencyImage: UIImageView!
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleTFView: UIView!
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var descView: UIView!
    @IBOutlet weak var decTFView: UIView!
    @IBOutlet weak var descTV: UITextView!
    
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
    
    @IBOutlet weak var tagListHeight: NSLayoutConstraint!
    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var infoSV: UIStackView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoTFView: UIView!
    @IBOutlet weak var infoStackView: UIView!
    @IBOutlet weak var infoTF: UITextField!

    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var mediaAddView: UIView!
    @IBOutlet weak var mediaAddButton: UIButton!
    @IBOutlet weak var mediaImageCollectionView: UICollectionView!
    
    var dummyData = DummyData.shared.getJobsList()
    let locationManager = CLLocationManager()
    
    var newAssistanceJobId: Int?
    var newAssistanceJobPosterId: UserProfile?
    var newAssistancePostDate: Date?
    var newAssistanceUrgency: BantuanUrgency?
    var newAssistanceTitle: String? = ""
    var newAssistanceDes: String? = ""
    var newAssistanceCompensation: Int? = 0
    var newAssistanceStatus: JobStatus = .active
    var newAssistanceDistance: Int? = nil
    var newAssistanceCoordinate: CLLocationCoordinate2D?
    var newAssistanceHelperId: UserProfile? = nil
    var newAssistanceGenderPref: Gender?
    var newAssistanceAgePref: AgePreference?
    var newAssistanceInfo: [String] = []
    var newAssistanceMediaImage: [UIImage] = []
   
    var currTags: String?
    var currImage: UIImage?
    var currMediaImages: [UIImage] = []
    
    var activeTextField: UITextField? = nil
    var urgencyPickerView = UIPickerView()
    var genderPickerView = UIPickerView()
    var agePickerView = UIPickerView()
    let urgencyPreferenceData = ["Tinggi", "Sedang", "Rendah"]
    let genderPreferenceData = ["Tidak ada preferensi", "Laki-Laki", "Perempuan"]
    let agePreferenceData = ["18-25", "26-40", "40"]
    var selectedValueUrgency: String? = "Tinggi"
    var selectedValueGender : String? = "Tidak ada Preferensi"
    var selectedValueAge : String? = "Tidak ada Preferensi"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buat Permintaan Bantuan"
        tabBarController?.tabBar.isHidden = true
        
        urgencyTF.delegate = self
        titleTF.delegate = self
        descTV.delegate = self
        compensationTF.delegate = self
        genderTF.delegate = self
        ageTF.delegate = self
        infoTF.delegate = self
        tagListView.delegate = self
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initKeyboardObserver()
        setCustomTextField()
        setNavigationBarItems()
        createPickerGender()
        createPickerAge()
        createPickerUrgency()
        initCollectionView()
    }
    
    func initCollectionView(){
//        mediaImageCollectionView.dataSource = self
//        mediaImageCollectionView.delegate = self
//        mediaImageCollectionView.register(MediaCollectionViewCell.nib(), forCellWithReuseIdentifier: MediaCollectionViewCell.identifier)
    }
    
}

extension NewAssistanceVC {
    
    @IBAction func cancelButtonAction(_sender: Any){
        let myViewController = HomeVC(nibName: "HomeVC", bundle: nil)
        self.present(myViewController, animated: true, completion: nil)
    }
    
    @IBAction func shareButtonAction(_sender: Any){
        initOtherData()
        //        let activityVC = activityVC()
        //        self.navigationController?.pushViewController(listBantuanVC, animated: true)
        print("NEW JobID:", newAssistanceJobId!)
        print("NEW Job Poster ID", newAssistanceJobPosterId!)//
        print("NEW Post DateTime", newAssistancePostDate!)
        print("NEW Urgency:", newAssistanceUrgency!)
        print("NEW Title:", newAssistanceTitle!)
        print("NEW Desc:", newAssistanceDes!)
        print("NEW Compensation:", newAssistanceCompensation!)
        print("NEW Status:", newAssistanceStatus)
        print("NEW Distance:", newAssistanceDistance)
        print("NEW Coordinate:", newAssistanceCoordinate!)
        print("NEW HelperId:", newAssistanceHelperId)//
        print("NEW Gender Pref:", newAssistanceGenderPref!)
        print("NEW Age Pref:", newAssistanceAgePref!)
        print("NEW Info Tags:", newAssistanceInfo)
        print("NEW Images:", newAssistanceMediaImage)
    }
    
    func initCreateNewJob(){
        
    }
    
    @IBAction func addMediaImageAction(_ sender: Any) {
            createAlert()
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        //textView.superview?.animateBorder(true, type: .border)
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
        //textField.superview?.animateBorder(true, type: .border)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == urgencyTF {
            titleTF.becomeFirstResponder()
        } else if textField == titleTF {
            descTV.becomeFirstResponder()
        } else if textField == descTV {
            compensationTF.becomeFirstResponder()
        } else if textField == compensationTF {
            genderTF.becomeFirstResponder()
        } else if textField == genderTF {
            ageTF.becomeFirstResponder()
        } else if textField == ageTF {
            infoTF.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        //textField.superview?.animateBorder(false, type: .border)
        
        if textField == urgencyTF {
            let currUrgency = urgencyTF.text!
            
            if currUrgency == "Tinggi"{
                newAssistanceUrgency = BantuanUrgency.tinggi
                urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.highUrgency.cgColor
            } else if currUrgency == "Sedang"{
                newAssistanceUrgency = BantuanUrgency.sedang
                urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.mediumUrgency.cgColor
            } else {
                newAssistanceUrgency = BantuanUrgency.rendah
                urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.lowUrgency.cgColor
            }
            
        }
        
        let currTitle = titleTF.text!
        newAssistanceTitle = currTitle
    
        let currDesc = descTV.text!
        newAssistanceDes = currDesc
        
        if textField == compensationTF {
            let currComp = compensationTF.text!.replacingOccurrences(of: ".", with: "")
            
            if (compensationTF .isEditing) {
                let viewComp = Int(currComp)
                compensationTF.text = StringFormatter().priceFormatting(amount: viewComp!)
            }
            
            if (compensationTF .endEditing(true)) {
                let viewComp = Int(currComp) ?? newAssistanceCompensation
                compensationTF.text = StringFormatter().priceFormatting(amount: viewComp!)
            }
            newAssistanceCompensation = Int(currComp) ?? 0
        }
        
        if textField == genderTF {
            let currGender = genderTF.text!
            
            if currGender == "Tidak ada preferensi"{
                newAssistanceGenderPref = Gender.other
            } else if currGender == "Laki-laki"{
                newAssistanceGenderPref = Gender.male
            } else {
                newAssistanceGenderPref = Gender.female
            }
        }
        
        if textField == ageTF {
            let currAge = ageTF.text!
            
            if currAge == "18-25"{
                newAssistanceAgePref = AgePreference.youngAdult
            } else if currAge == "26-40"{
                newAssistanceAgePref = AgePreference.middleAdult
            } else {
                newAssistanceAgePref = AgePreference.lateAdult
            }
        }
        
        if textField == infoTF{
            let newTag = infoTF.text!
            currTags = newTag
            newAssistanceInfo.append(newTag)
            tagListView.addTag(newTag)
            infoTF.resignFirstResponder()
            infoTF.text = ""
            
            (newAssistanceInfo.count < 1) ? (infoSV.spacing = 0) : (infoSV.spacing = 10)
        } else {
            print("nothing insert")
        }
            
    }
    
    func initOtherData(){
        let newId = dummyData.count + 1
        newAssistanceJobId = newId
        
        let newDate = Date(timeInterval: 60, since: Date())
        newAssistancePostDate = newDate
        
        let jobPosterId = dummyData[0].jobPosterId
        newAssistanceJobPosterId = jobPosterId
    }
    
    
    
    //MARK: - Create Alert for Media Button
    func createAlert(){
        let alert = UIAlertController(title: "Lorem", message: "Lorem Ipsum", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera",
                                      style: .default,
                                      handler: { action in
                                        ImageHelper.startMediaBrowser(delegate: self, sourceType: .camera)
                                      }))
        
        alert.addAction(UIAlertAction(title: "Photos",
                                      style: .default,
                                      handler: { action in
                                        ImageHelper.startMediaBrowser(delegate: self, sourceType: .savedPhotosAlbum)
                                      }))
            
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func createWarningAlert(){
        let alert = UIAlertController(title: "Image", message: "The maximum number image that can be uploaded is up to 3 images", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    //MARK: - Tag List View Actions
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag Remove pressed: \(title), \(sender)")
        sender.removeTagView(tagView)
        
        for (index, arrayTitle) in newAssistanceInfo.enumerated() {
            if title == arrayTitle {
                newAssistanceInfo.remove(at: index)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        newAssistanceCoordinate = locValue
    }
    
}
