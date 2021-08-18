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
	
	var delegate: NewAssitanceDelegate?
	
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
        setupTextFieldDelegate()
        setupKeyboardDismissMethod()
        setupLocationManager()
        
        title = "Buat Permintaan Bantuan"
        self.navigationController?.presentationController?.delegate = self
        self.presentationController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        guard let text = titleTF.text, text.isEmpty else { return false }
        guard let text = descTV.text, text.isEmpty else { return false }
        return true
    }
    
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        dismissAlert()
    }

}

extension NewAssistanceVC: TagListViewDelegate, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate {
    
    func setupView() {
        setupKeyboardObserver()
        initStyling()
        createPickerGender()
        createPickerAge()
        createPickerUrgency()
        setupCollectionView()
        tagListHeight?.isActive = false
    }
    
    func setupTextFieldDelegate(){
        urgencyTF.delegate = self
        titleTF.delegate = self
        descTV.delegate = self
        compensationTF.delegate = self
        genderTF.delegate = self
        ageTF.delegate = self
        infoTF.delegate = self
        tagListView.delegate = self
    }
    
    func setupCollectionView(){
        mediaImageCollectionView.dataSource = self
        mediaImageCollectionView.delegate = self
        mediaImageCollectionView.register(ImageCarouselCVC.nib(), forCellWithReuseIdentifier: ImageCarouselCVC.identifier)
    }
    
    @IBAction func cancelButtonAction(_sender: Any){
       navigateCancel()
    }
    
    @IBAction func shareButtonAction(_sender: Any){
        setupOtherData()
        createNewJob()
    }
    
    func setupOtherData(){
        let jobPosterId = DummyData.shared.getUserProfile()[userDefault]
        newAssistanceJobPosterId = jobPosterId
    }
    
    func createNewJob(){
        if (titleTF.text?.isEmpty ?? true) || titleTF.text == "" || titleTF.text == "\n" {
            createTitleEmpty()
        } else if (descTV.text?.isEmpty ?? true) || descTV.text == "" || descTV.text == "\n" {
            createDescEmpty()
        } else {
            guard let jobPosterId = newAssistanceJobPosterId else { return }
            
            let job = Jobs(id: DummyData.shared.getJobsList().count,
                           jobPosterId: jobPosterId,
                           postingDate: Date(),
                           urgency: newAssistanceUrgency,
                           title: titleTF.text,
                           desc: descTV.text,
                           price: newAssistanceCompensation,
                           status: newAssistanceStatus,
                           distance: 0.0,
                           coordinate: newAssistanceCoordinate ?? CLLocationCoordinate2D(),
                           tags: newAssistanceInfo,
                           medias: newAssistanceMediaImage,
                           helperId: nil,
                           genderPreference: newAssistanceGenderPref,
                           agePreference: newAssistanceAgePref)
            
            DummyData.shared.addNewJob(job: job)
            
            // Segue
            let latestDummyData = DummyData.shared.getJobsList()
            self.dismiss(animated: true, completion: {
                guard let lastJob = latestDummyData.last else {return}
                self.delegate?.navigateToDetailProduct(job: lastJob)
            })
        }
    }
    
    @IBAction func addMediaImageAction(_ sender: Any) {
        createAlert()
    }
    
    //MARK: - TextView
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.superview?.animateBorder(true, type: .border)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.superview?.animateBorder(false, type: .border)
    }
    
    //MARK: - TextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
        textField.superview?.animateBorder(true, type: .border)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
        textField.superview?.animateBorder(false, type: .border)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case compensationTF :
            let text: NSString = (textField.text ?? "") as NSString
            var finalString = text.replacingCharacters(in: range, with: string)
            
            finalString = finalString.replacingOccurrences(of: ".", with: "")
            newAssistanceCompensation = Int(finalString) ?? 0
            compensationTF.text = StringFormatter().priceFormatting(amount: newAssistanceCompensation )
            return false
            
        case infoTF :
            let acceptableChar = "abcdefghijklmnopqrstuvwxyz"
            let cs = NSCharacterSet(charactersIn: acceptableChar).inverted
            let filtered = string.components(separatedBy: cs).joined(separator: "")
            
            if string == " " {
                addTag()
            }
            return (string == filtered)
            
        default :
            break
            
        }
        return true
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
        } else if textField == infoTF {
            addTag()
        } else {
            textField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.superview?.animateBorder(false, type: .border)
        
        switch textField {
        case urgencyTF :
            let currUrgency = urgencyTF.text ?? ""
            
            if currUrgency == "Tinggi" {
                newAssistanceUrgency = Urgency.high
                urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.highUrgency.cgColor
            } else if currUrgency == "Sedang" {
                newAssistanceUrgency = Urgency.medium
                urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.mediumUrgency.cgColor
            } else {
                newAssistanceUrgency = Urgency.low
                urgencyIndicatorView.layer.backgroundColor = UIColor.ColorLibrary.lowUrgency.cgColor
            }
            
        case genderTF :
            let currGender = genderTF.text ?? ""
            
            if currGender == Gender.male.rawValue {
                newAssistanceGenderPref = Gender.male
            } else if currGender == Gender.female.rawValue {
                newAssistanceGenderPref = Gender.female
            } else {
                newAssistanceGenderPref = nil
            }
            
        case ageTF :
            let currAge = ageTF.text ?? ""
            
            if currAge == AgePreference.youngAdult.rawValue {
                newAssistanceAgePref = AgePreference.youngAdult
            } else if currAge == AgePreference.middleAdult.rawValue {
                newAssistanceAgePref = AgePreference.middleAdult
            } else if currAge == AgePreference.lateAdult.rawValue {
                newAssistanceAgePref = AgePreference.lateAdult
            } else {
                newAssistanceAgePref = nil
            }

        default :
            break
        }
    }
    
    //MARK: - Tag List View Actions
    func addTag() {
        var duplicate: Bool = false
        guard let newTag = infoTF.text,
              (newTag != "" && newTag.isEmpty == false) else { return }
        
        for tag in newAssistanceInfo {
            if newTag == tag {
                duplicate = true
            }
        }
        guard !duplicate else { return }
        
        currTags = newTag
        newAssistanceInfo.append(newTag)
        tagListView.addTag(newTag)
        infoTF.resignFirstResponder()
        infoTF.text = ""
        
        (newAssistanceInfo.count < 1) ? (infoSV.spacing = 0) : (infoSV.spacing = 5)
    }
    
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        sender.removeTagView(tagView)
        
        for (index, arrayTitle) in newAssistanceInfo.enumerated() {
            if title == arrayTitle {
                newAssistanceInfo.remove(at: index)
                (newAssistanceInfo.count < 1) ? (infoSV.spacing = 0) : (infoSV.spacing = 5)
            }
        }
    }
    
    func setupLocationManager() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    //MARK: - Get Current location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        newAssistanceCoordinate = locValue
    }
    
    //MARK: - ImagePicker Handler
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)

        currImage = image
        guard let newImage = currImage else { return }
        newAssistanceMediaImage.append(newImage)
        
        DispatchQueue.main.async {
            self.mediaImageCollectionView.reloadData()
        }
    }
}

//MARK: - Alerts
extension NewAssistanceVC {

    func createAlert(){
        let alert = UIAlertController(title: "Tambahkan Media", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Ambil Foto",
                                      style: .default,
                                      handler: { _ in
                                        ImageHelper.startMediaBrowser(delegate: self, sourceType: .camera)
                                      }))
        
        alert.addAction(UIAlertAction(title: "Pilih dari Galeri",
                                      style: .default,
                                      handler: { _ in
                                        ImageHelper.startMediaBrowser(delegate: self, sourceType: .savedPhotosAlbum)
                                      }))
        
        alert.addAction(UIAlertAction(title: "Batalkan", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func createTitleEmpty() {
        let alert = UIAlertController(title: "", message: "Judul Bantuan tidak boleh kosong", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            self.titleTF.becomeFirstResponder()
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func createDescEmpty() {
        let alert = UIAlertController(title: "", message: "Judul Bantuan tidak boleh kosong", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            self.descTV.becomeFirstResponder()
        }))
        
        present(alert, animated: true, completion: nil)
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

//MARK: -Keyboard Delegate
extension NewAssistanceVC {
   
    func setupKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
            // if keyboard size is not available for some reason, dont do anything
            return
        }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height , right: 0.0)
        myScrollView.contentInset = contentInsets
        myScrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        myScrollView.contentInset = contentInsets
        myScrollView.scrollIndicatorInsets = contentInsets
    }
    
    func setupKeyboardDismissMethod() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        myScrollView.keyboardDismissMode = .onDrag // or .interactive
        urgencyIndicatorView.backgroundColor = UIColor.systemBlue
    }
}

