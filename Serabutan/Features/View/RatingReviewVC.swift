//
//  RatingReviewVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 28/07/21.
//

import UIKit

class RatingReviewVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var kirimBtn: UIButton!
    @IBOutlet weak var lewatiBtn: UIButton!
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var namaLbl: UILabel!
    
    @IBOutlet weak var viewBintang: UIView!
    
    @IBOutlet weak var reviewTextView: UITextView!
    
    @IBAction func lewatiBtn(_ sender: Any) {
    }
    @IBAction func kirimBtn(_ sender: Any) {
    }
    
    var textView: Int = 0

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray{
            textView.text = nil
            textView.textColor = UIColor.black
            kirimBtn.backgroundColor = UIColor.purple
            kirimBtn.isEnabled = true
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = "Review"
            textView.textColor = UIColor.lightGray
            kirimBtn.backgroundColor = UIColor.lightGray
            kirimBtn.isEnabled = false
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
        
        viewBintang.backgroundColor = .clear
        
        
        setupReviewText()
        
        kirimBtn.layer.cornerRadius = 10
        kirimBtn.backgroundColor = UIColor.lightGray
        kirimBtn.isEnabled = false

    }
}
