//
//  NewAssistanceVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 28/07/21.
//

import UIKit



class NewAssistanceVC: UIViewController, UITextFieldDelegate, UITextViewDelegate{
    
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
    var newAssistanceCompensation: String? = ""
    var newAssistanceGenderPref: String? = ""
    var newAssistanceAgePref: String? = ""
    var newAssistanceInfo: [TagModel] = []
    var newAssistanceMediaImage: [String] = []
    
    var tags: [TagModel] = [
        TagModel(name: "Test12345"),
        TagModel(name: "Sakit"),
        TagModel(name: "Bantuan"),
        TagModel(name: "Bukan"),
        TagModel(name: "Main"),
        TagModel(name: "Minta"),
        TagModel(name: "Bantuan"),
        TagModel(name: "Nyangkut"),
        TagModel(name: "Sakit")
    ]
    
    var activeTextField: UITextField? = nil
    
    var currTags: String?
    var currMediaImage: [String] = []
    let urgencyPreferenceData = ["Tinggi", "Sedang", "Rendah"]
    let agePreferenceData = ["Tidak ada preferensi", "Pria", "Perempuan"]
    let genderPreferenceData = ["Tidak ada preferensi", "18-25", "25-40", "> 40"]
    
    var urgencyPickerView = UIPickerView()
    var genderPickerView = UIPickerView()
    var agePickerView = UIPickerView()
    var selectedValueUrgency: String?
    var selectedValueGender : String?
    var selectedValueAge : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buat Permintaan Bantuan"
        //infoCollectionView.isHidden = true
        tabBarController?.tabBar.isHidden = true
        
        setupView()
        infoCollectionView.dataSource = self
        infoCollectionView.delegate = self
        infoCollectionView.register(TagCell.nib(), forCellWithReuseIdentifier: TagCell.identifier)
        print(infoCollectionView.frame.height)
        
        //        mediaImageCollectionView.dataSource = self
        //        mediaImageCollectionView.delegate = self
        //        mediaImageCollectionView.register(MediaCollectionViewCell.nib(), forCellWithReuseIdentifier: MediaCollectionViewCell.identifier)
        urgencyTF.delegate = self
        titleTF.delegate = self
        descTV.delegate = self
        compensationTF.delegate = self
        genderTF.delegate = self
        ageTF.delegate = self
        infoTF.delegate = self
        
        if let flowLayout = infoCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .vertical
//        flowLayout.minimumInteritemSpacing = 0
//        flowLayout.minimumLineSpacing = 0
//        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        infoCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        
        let columnLayout = CustomViewFlowLayout()
        
        if #available(iOS 10.0, *) {
            columnLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        } else {
            columnLayout.estimatedItemSize = CGSize(width: 41, height: 30)
        }

        infoCollectionView.collectionViewLayout = columnLayout

    }
    
    func setupView(){
        setCustomTextField()
        setNavigationBarItems()
        createPickerGender()
        createPickerAge()
        createPickerUrgency()
        getTagInput()
    }
    
    
    
    
    @IBAction func cancelButtonAction(_sender: Any){
        let myViewController = HomeVC(nibName: "HomeVC", bundle: nil)
        self.present(myViewController, animated: true, completion: nil)
    }
    
    @IBAction func shareButtonAction(_sender: Any){
        //        let activityVC = activityVC()
        //        listBantuanVC.sortBy = filterBy
        //        listBantuanVC.minValue = minValue
        //        listBantuanVC.maxValue = maxValue
        //        listBantuanVC.applySortData()
        //        self.navigationController?.pushViewController(listBantuanVC, animated: true)
        
        print("NEW:", newAssistanceUrgency!)
        print("NEW:", newAssistanceTitle!)
        print("NEW:", newAssistanceDes!)
        print("NEW:", newAssistanceAgePref!)
        print("NEW:", newAssistanceGenderPref!)
        print("NEW:", newAssistanceAgePref!)
        print("NEW:", tags[0].name)
    }
    
    func getTagInput(){
        
    }
    
    @IBAction func addMediaImageAction(_ sender: Any) {
        
    }
}

extension NewAssistanceVC {
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
    
    func textFieldDidEndEditing(_ textField: UITextField, _ textView: UITextView) {
        if textField == urgencyTF {
            let currUrgency = textField.text!
            newAssistanceUrgency = currUrgency
            titleTF.becomeFirstResponder()
        } else if textField == titleTF {
            let currTitle = textField.text!
            newAssistanceTitle = currTitle
            descTV.becomeFirstResponder()
        } else if textField == descTV {
            let currDesc = textField.text!
            newAssistanceDes = currDesc
            compensationTF.becomeFirstResponder()
        } else if textField == compensationTF {
            let currComp = textField.text!
            newAssistanceAgePref = currComp
            genderTF.becomeFirstResponder()
        } else if textField == genderTF {
            let currGender = textField.text!
            newAssistanceGenderPref = currGender
            ageTF.becomeFirstResponder()
        } else if textField == ageTF {
            let currAge = textField.text!
            newAssistanceAgePref = currAge
            infoTF.becomeFirstResponder()
        } else {
            let newTag = textField.text!
            currTags = newTag
            tags.append(TagModel(name: currTags!))
            infoCollectionView.reloadData()
            
            textField.resignFirstResponder()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        let currUrgency = urgencyTF.text!
        newAssistanceUrgency = currUrgency
        
        let currTitle = titleTF.text!
        newAssistanceTitle = currTitle
        
        let currDesc = descTV.text!
        newAssistanceDes = currDesc
        
        let currComp = compensationTF.text!
        newAssistanceAgePref = currComp
        
        let currGender = genderTF.text!
        newAssistanceGenderPref = currGender
        
        let currAge = ageTF.text!
        newAssistanceAgePref = currAge
        
        if textField == infoTF{
            let newTag = infoTF.text!
            currTags = newTag
            tags.append(TagModel(name: currTags!))
            infoCollectionView.reloadData()
            infoTF.resignFirstResponder()
            infoTF.text = ""
        } else {
            print("nothing insert")
        }
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
        
        
        // reset back the content inset to zero after keyboard is gone
        myScrollView.contentInset = contentInsets
        myScrollView.scrollIndicatorInsets = contentInsets
    }
    
}




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

//
//class DynamicHeightCollectionView: UICollectionView {
//  override func layoutSubviews() {
//    super.layoutSubviews()
//    if!__CGSizeEqualToSize(bounds.size,self.intrinsicContentSize){
//      self.invalidateIntrinsicContentSize()
//    }
//  }
//  override var intrinsicContentSize: CGSize {
//    return contentSize
//  }
//}


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
