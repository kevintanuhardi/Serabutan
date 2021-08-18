//
//  RatingReviewVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 28/07/21.
//

import UIKit

class RatingReviewVC: UIViewController, UITextViewDelegate {
    
    var reviewee: UserProfile?
    var reviewer: UserProfile?
    var selectedJob: Jobs?
    
    var user = UserDefaults.standard.integer(forKey: "loggedUser")
    
    var reviewTextChecked: Bool = false
    var bintangTapped: Bool = false
    var reviewPoint: Int?
    
    @IBOutlet weak var kirimBtn: UIButton!
    @IBOutlet var bintangBtn: [UIButton]!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var namaLbl: UILabel!
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var verified: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setupUser()
        setupTextView()
        setupKirimBtn()

    }
    
    // Set Displayed Stars (ratings)
    @IBAction func buttonTapped(_ sender: UIButton) {
        for button in bintangBtn {
            let config = UIImage.SymbolConfiguration(scale: .large)
            if button.tag <= sender.tag {
                button.setImage(UIImage(systemName: "star.fill", withConfiguration: config), for: .normal)
                button.tintColor = .systemYellow
            } else {
                button.setImage(UIImage(systemName: "star.fill", withConfiguration: config), for: .normal)
                button.tintColor = .ColorLibrary.mediumGrey
            }
            reviewPoint = sender.tag
            bintangTapped = true
            
            setupKirimBtn()
        }
    }
    
    // MARK: - TextView Related
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
}
