//
//  NewAssistanceVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 28/07/21.
//

import UIKit
import MapKit
import TagListView

protocol NewAssitanceDelegate {
	func navigateToDetailProduct(job: Jobs)
}

class NewAssistanceVC: UIViewController, UINavigationControllerDelegate, CLLocationManagerDelegate{
    
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
    
    @IBOutlet weak var tagListHeight: NSLayoutConstraint?
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
	
	var delegate: NewAssitanceDelegate?
	
    var dummyData = DummyData.shared.getJobsList()
    let locationManager = CLLocationManager()
    var userDefault = UserDefaults.standard.integer(forKey: "loggedUser")
    
    var newAssistanceJobId: Int?
    var newAssistanceJobPosterId: UserProfile?
    var newAssistancePostDate: Date?
    var newAssistanceUrgency: Urgency? = .high
    var newAssistanceTitle: String? = ""
    var newAssistanceDes: String? = ""
    var newAssistanceCompensation: Int? = 0
    var newAssistanceStatus: JobStatus = .active
    var newAssistanceDistance: Double? = nil
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
    let genderPreferenceData = ["Tidak ada preferensi", "Laki-laki", "Perempuan"]
    let agePreferenceData = ["18-25", "26-40", "40"]
    var selectedValueUrgency : String? = "Tinggi"
    var selectedValueGender : String? = "Tidak ada preferensi"
    var selectedValueAge : String? = "Tidak ada preferensi"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buat Permintaan Bantuan"
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        myScrollView.keyboardDismissMode = .onDrag // or .interactive
        urgencyIndicatorView.backgroundColor = UIColor.systemBlue
        
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

}
