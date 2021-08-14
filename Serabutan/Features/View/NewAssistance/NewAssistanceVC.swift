//
//  NewAssistanceVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 28/07/21.
//

import UIKit
import MapKit
import TagListView

class NewAssistanceVC: UIViewController, UINavigationControllerDelegate, CLLocationManagerDelegate, UIAdaptivePresentationControllerDelegate{
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var urgencyView: UIView!
    @IBOutlet weak var urgencyTFView: UIView!
    @IBOutlet weak var urgencyTitle: UILabel!
    @IBOutlet weak var urgencyTF: UITextField!
    @IBOutlet weak var urgencyIndicatorView: UIView!
    @IBOutlet weak var urgencyImage: UIImageView!
    
    @IBOutlet weak var titleTitle: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleTFView: UIView!
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var descTitle: UILabel!
    @IBOutlet weak var descView: UIView!
    @IBOutlet weak var decTFView: UIView!
    @IBOutlet weak var descTV: UITextView!
    
    @IBOutlet weak var compensationTitle: UILabel!
    @IBOutlet weak var compensationView: UIView!
    @IBOutlet weak var compensationTFView: UIView!
    @IBOutlet weak var compensationTF: UITextField!
    
    @IBOutlet weak var preferenceView: UIView!
    
    @IBOutlet weak var genderTitle: UILabel!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var genderImage: UIImageView!
    
    @IBOutlet weak var ageTitle: UILabel!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var ageImage: UIImageView!
    
    
    @IBOutlet weak var tagTitle: UILabel!
    @IBOutlet weak var tagListHeight: NSLayoutConstraint?
    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var infoSV: UIStackView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoTFView: UIView!
    @IBOutlet weak var infoStackView: UIView!
    @IBOutlet weak var infoTF: UITextField!
    
    @IBOutlet weak var mediaTitle: UIScrollView!
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var mediaAddView: UIView!
    @IBOutlet weak var mediaAddButton: UIButton!
    @IBOutlet weak var mediaImageCollectionView: UICollectionView!
    
    var dummyData = DummyData.shared.getJobsList()
    let locationManager = CLLocationManager()
    var userDefault = UserDefaults.standard.integer(forKey: "loggedUser")
    
    var newAssistanceJobPosterId: UserProfile?
    var newAssistanceUrgency: Urgency = .high
    var newAssistanceTitle: String = ""
    var newAssistanceDes: String = ""
    var newAssistanceCompensation: Int = 0
    var newAssistanceStatus: JobStatus = .active
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
    var activeTextView: UITextView? = nil
    var urgencyPickerView = UIPickerView()
    var genderPickerView = UIPickerView()
    var agePickerView = UIPickerView()
    let urgencyPreferenceData = ["Tinggi", "Sedang", "Rendah"]
    let genderPreferenceData = ["-",
                                Gender.male.rawValue,
                                Gender.female.rawValue]
    let agePreferenceData = ["-",
                             AgePreference.youngAdult.rawValue,
                             AgePreference.middleAdult.rawValue,
                             AgePreference.lateAdult.rawValue]
    var selectedValueUrgency : String? = "Tinggi"
    var selectedValueGender : String? = "-"
    var selectedValueAge : String? = "-"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buat Permintaan Bantuan"
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        myScrollView.keyboardDismissMode = .onDrag // or .interactive
        urgencyIndicatorView.backgroundColor = UIColor.systemBlue
        
        self.navigationController?.presentationController?.delegate = self
        self.presentationController?.delegate = self
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
        initStyling()
        createPickerGender()
        createPickerAge()
        createPickerUrgency()
        initCollectionView()
        tagListHeight?.isActive = false
    }
    
    func initCollectionView(){
        mediaImageCollectionView.dataSource = self
        mediaImageCollectionView.delegate = self
        mediaImageCollectionView.register(ImageCarouselCVC.nib(), forCellWithReuseIdentifier: ImageCarouselCVC.identifier)
    }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        guard let text = titleTF.text, text.isEmpty else { return false }
        guard let text = descTV.text, text.isEmpty else { return false }
        return true
    }
    
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        dismissAlert()
    }
    
    func dismissAlert() {
        let alert = UIAlertController(title: "Batalkan Publikasi?",
                                      message: "Terdapat perubahan, anda yakin ingin membatalkan publikasi?",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .destructive,
                                      handler: { action in
                                        self.dismiss(animated: true, completion: nil)
                                      }))
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
