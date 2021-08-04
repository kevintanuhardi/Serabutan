//
//  NewAssistanceVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 28/07/21.
//

import UIKit


class NewAssistanceVC: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var urgencyView: UIView!
    @IBOutlet weak var urgencyTFView: UIView!
    @IBOutlet weak var urgencyTF: UITextField!
    @IBOutlet weak var urgencyIndicatorImage: UIImageView!
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
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoTFView: UIView!
    @IBOutlet weak var infoStackView: UIView!
    @IBOutlet weak var infoTF: UITextField!
    @IBOutlet weak var infoCollectionView: UICollectionView!
    @IBOutlet weak var infoCollectionLayout: UICollectionViewFlowLayout! {
        didSet {
            infoCollectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var mediaAddView: UIView!
    @IBOutlet weak var mediaAddButton: UIButton!
    @IBOutlet weak var mediaImageCollectionView: UICollectionView!
    
    var newAssistanceUrgency: String? = ""
    var newAssistanceTitle: String? = ""
    var newAssistanceDes: String? = ""
    var newAssistanceCompensation: Int? = 0
    var newAssistanceGenderPref: String? = ""
    var newAssistanceAgePref: String? = ""
    var newAssistanceInfo: [TagModel] = []
    var newAssistanceMediaImage: [UIImage] = []
    
    var activeTextField: UITextField? = nil
    
    var currTags: String?
    var currImage: UIImage?
    var currMediaImages: [UIImage] = []
    let urgencyPreferenceData = ["Tinggi", "Sedang", "Rendah"]
    let genderPreferenceData = ["Tidak ada preferensi", "Pria", "Perempuan"]
    let agePreferenceData = ["Tidak ada preferensi", "18-25", "25-40", "> 40"]
    
    var urgencyPickerView = UIPickerView()
    var genderPickerView = UIPickerView()
    var agePickerView = UIPickerView()
    var selectedValueUrgency: String? = "Tinggi"
    var selectedValueGender : String? = "Tidak ada Preferensi"
    var selectedValueAge : String? = "Tidak ada Preferensi"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buat Permintaan Bantuan"
        tabBarController?.tabBar.isHidden = true
        
        initCollectionView()
    }
    
    func initCollectionView(){
        infoCollectionView.dataSource = self
        infoCollectionView.delegate = self
        infoCollectionView.register(TagCell.nib(), forCellWithReuseIdentifier: TagCell.identifier)
        print(infoCollectionView.frame.height)
        
        //        mediaImageCollectionView.dataSource = self
        //        mediaImageCollectionView.delegate = self
        //        mediaImageCollectionView.register(MediaCollectionViewCell.nib(), forCellWithReuseIdentifier: MediaCollectionViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        urgencyTF.delegate = self
        titleTF.delegate = self
        descTV.delegate = self
        compensationTF.delegate = self
        genderTF.delegate = self
        ageTF.delegate = self
        infoTF.delegate = self
        
        initKeyboardObserver()
        setCustomTextField()
        setNavigationBarItems()
        createPickerGender()
        createPickerAge()
        createPickerUrgency()
        getTagInput()
        initFlowLayout()
    }
    
}

extension NewAssistanceVC {
    
    @IBAction func cancelButtonAction(_sender: Any){
        let myViewController = HomeVC(nibName: "HomeVC", bundle: nil)
        self.present(myViewController, animated: true, completion: nil)
    }
    
    @IBAction func shareButtonAction(_sender: Any){
        //        let activityVC = activityVC()
        //        self.navigationController?.pushViewController(listBantuanVC, animated: true)
        
        print("NEW:", newAssistanceUrgency!)
        print("NEW:", newAssistanceTitle!)
        print("NEW:", newAssistanceDes!)
        print("NEW:", newAssistanceCompensation!)
        print("NEW:", newAssistanceGenderPref!)
        print("NEW:", newAssistanceAgePref!)
        print("NEW:", newAssistanceInfo[0].name)
        print("IMAGES count:", newAssistanceMediaImage)
    }
    
    func getTagInput(){
        
    }
    
    @IBAction func addMediaImageAction(_ sender: Any) {
            createAlert()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
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
        let currUrgency = urgencyTF.text!
        newAssistanceUrgency = currUrgency
     
        let currTitle = titleTF.text!
        newAssistanceTitle = currTitle
    
        let currDesc = descTV.text!
        newAssistanceDes = currDesc
        
        if textField == compensationTF {
            let currComp = compensationTF.text!.replacingOccurrences(of: ".", with: "")
            
            if (compensationTF .isEditing) {
                let viewComp = Int(currComp)
                compensationTF.text = priceFormatting(amount: viewComp!)
            }
            
            if (compensationTF .endEditing(true)) {
                let viewComp = Int(currComp) ?? newAssistanceCompensation
                compensationTF.text = priceFormatting(amount: viewComp!)
            }
            newAssistanceCompensation = Int(currComp) ?? 0
        }
        
        let currGender = genderTF.text!
        newAssistanceGenderPref = currGender
        
        let currAge = ageTF.text!
        newAssistanceAgePref = currAge
        
        if textField == infoTF{
            let newTag = infoTF.text!
            currTags = newTag
            newAssistanceInfo.append(TagModel(name: currTags!))
            infoCollectionView.reloadData()
            infoTF.resignFirstResponder()
            infoTF.text = ""
        } else {
            print("nothing insert")
        }
        
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
    
}

//MARK: - Custom CollectionView FlowLayout
class LeftEqualFlowLayout: UICollectionViewFlowLayout {
    
    // Left aligned equal spacing layout (maximum spacing is set)
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let answer = super.layoutAttributesForElements(in: rect)
        for (index,value) in (answer?.enumerated())!
        {
            if index > 0{
                let currentLayoutAttributes :UICollectionViewLayoutAttributes = value
                let prevLayoutAttributes:UICollectionViewLayoutAttributes = answer![index - 1]
                let maximumSpacing = 15 //Set the maximum spacing here
                let origin = prevLayoutAttributes.frame.maxX
                if(origin + CGFloat(maximumSpacing) + currentLayoutAttributes.frame.size.width < self.collectionViewContentSize.width) {
                    var frame = currentLayoutAttributes.frame;
                    frame.origin.x = origin + CGFloat(maximumSpacing);
                    currentLayoutAttributes.frame = frame;
                }
            }
        }
        return answer
    }
}

public extension CollectionCellAutoLayout where Self: UICollectionViewCell {
    func preferredLayoutAttributes(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        newFrame.size.width = CGFloat(ceilf(Float(size.width)))
        layoutAttributes.frame = newFrame
        cachedSize = newFrame.size
        return layoutAttributes
    }
}
