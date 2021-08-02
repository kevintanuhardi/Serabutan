//
//  RatingReviewVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 28/07/21.
//

import UIKit

class RatingReviewVC: UIViewController, UITextViewDelegate {
    
    var reviewTextChecked: Bool = false
    var bintangTapped : Bool = false

    @IBOutlet weak var kirimBtn: UIButton!
    @IBOutlet weak var lewatiBtn: UIButton!
   
    @IBOutlet var bintangBtn: [UIButton]!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var namaLbl: UILabel!
    
    @IBOutlet weak var reviewTextView: UITextView!
    
    @IBAction func lewatiBtn(_ sender: Any) {
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Rated \(sender.tag) stars.")
        
        for button in bintangBtn{
            if button.tag <= sender.tag{
                button.setImage(UIImage.init(named: "bintangKuning"), for: .normal) //selected
            }else{
                button.setImage(UIImage.init(named: "bintangAbu"), for: .normal) //notselected
            }
            bintangTapped = true
            setupKirimBtn()
        }
    }
    
    @IBAction func kirimBtn(_ sender: Any) {
    }
    
    func setupKirimBtn(){
        kirimBtn.backgroundColor = UIColor.lightGray
        kirimBtn.isEnabled = false
        if reviewTextChecked == true && bintangTapped == true{
            kirimBtn.backgroundColor = UIColor.purple
            kirimBtn.isEnabled = true
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray{
            textView.text = nil
            textView.textColor = UIColor.black
            reviewTextChecked = true
            setupKirimBtn()
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = "Review"
            textView.textColor = UIColor.lightGray
            reviewTextChecked = false
            setupKirimBtn()
        }
    }
    
    func setupReviewText(){
        reviewTextView.delegate = self
        reviewTextView.layer.borderWidth = 1
        reviewTextView.layer.borderColor = UIColor.gray.cgColor
        reviewTextView.layer.cornerRadius = 5
        reviewTextView.text = "Review"
        reviewTextView.textColor = UIColor.lightGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        
        profileImg.image = #imageLiteral(resourceName: "bintangKuning")
        namaLbl.text = "Agus Susanto"
    
        setupReviewText()
        
        kirimBtn.layer.cornerRadius = 10
        kirimBtn.backgroundColor = UIColor.lightGray
        kirimBtn.isEnabled = false

    }
}
