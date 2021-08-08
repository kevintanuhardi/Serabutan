//
//  RatingReviewVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 28/07/21.
//

import UIKit

class RatingReviewVC: UIViewController, UITextViewDelegate {
    
//    var reviewedUser: UserProfile?
//    var reviewer: UserProfile?
//    var selectedJob: Jobs?
    
    var reviewedUser: UserProfile = DummyData.shared.getUserProfile()[0]
    var reviewer: UserProfile = DummyData.shared.getUserProfile()[1]
    var selectedJob: Jobs = DummyData.shared.getJobsList()[4]
    
    var reviewTextChecked: Bool = false
    var bintangTapped: Bool = false
    var reviewPoint: Int?

    @IBOutlet weak var kirimBtn: UIButton!
   
    @IBOutlet var bintangBtn: [UIButton]!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var namaLbl: UILabel!
    
    @IBOutlet weak var reviewTextView: UITextView!
    
    @IBAction func lewatiBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        for button in bintangBtn {
            button.imageView?.contentMode = .scaleToFill
            if button.tag <= sender.tag {
                button.setImage(UIImage.init(named: "bintangKuning"), for: .normal) //selected
            } else {
                button.setImage(UIImage.init(named: "bintangAbu"), for: .normal) //notselected
            }
            reviewPoint = sender.tag + 1
            bintangTapped = true
            setupKirimBtn()
        }
    }
    
    @IBAction func kirimBtn(_ sender: Any) {
        DummyData.shared.addUserReview(job: selectedJob, reviewPoint: reviewPoint ?? 0, reviewText: reviewTextView.text, reviewer: reviewer)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setupKirimBtn(){
        kirimBtn.layer.cornerRadius = 5
        kirimBtn.backgroundColor = .ColorLibrary.mediumGrey
        kirimBtn.isEnabled = false
        if (reviewTextView.textColor != .ColorLibrary.mediumGrey) && !reviewTextView.text.isEmpty && bintangTapped {
            kirimBtn.backgroundColor = .ColorLibrary.accentColor
            kirimBtn.isEnabled = true
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        setupKirimBtn()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .ColorLibrary.mediumGrey {
            textView.text = nil
            textView.textColor = .ColorLibrary.customBlack
        }
        reviewTextView.superview?.animateBorder(true, type: .border)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            reviewTextView.text = "Tulis review anda disini"
            reviewTextView.textColor = .ColorLibrary.mediumGrey
        }
        reviewTextView.superview?.animateBorder(false, type: .border)
    }
    
    func setupUser() {
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        profileImg.layer.masksToBounds = true
        profileImg.image = reviewedUser.avatar
        
        namaLbl.font = .FontLibrary.title1
        namaLbl.text = reviewedUser.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        
        let rightBarButton = UIBarButtonItem(title: "Lewati", style: .plain, target: self, action: nil)
        rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.FontLibrary.textLink1], for: .normal)
        rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.FontLibrary.textLink1], for: .application)
        navigationItem.rightBarButtonItem = rightBarButton
        
        self.title = "Beri Penilaian"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.ColorLibrary.customBlack]
        
        reviewTextView.delegate = self
        
        setupUser()
        setupReviewText()
        setupKirimBtn()
        
        reviewTextView.text = "Tulis review anda disini"
        reviewTextView.textColor = .ColorLibrary.mediumGrey
    }
}
