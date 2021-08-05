//
//  DetailBantuanVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 29/07/21.
//

import UIKit
import TagListView

class DetailBantuanVC: UIViewController, UITextViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let stringWithLink = "https://www.instagram.com/yahyayyashaa/"
    
    //    var selectedJob: Jobs?
    var selectedJob = DummyData.shared.getJobsList()[2]
    var triggerHelpButton : Bool = false
    
    @IBOutlet weak var helpFinishButton: UIButton!
    @IBOutlet weak var waButton: UIButton!
    
    @IBOutlet weak var urgencyView: UIView!
    
    @IBOutlet weak var urgencyLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var jobGiverLabel: UILabel!
    @IBOutlet weak var timePostElapsed: UILabel!
    @IBOutlet weak var distanceToJob: UILabel!
    @IBOutlet weak var helperName: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel! 
    
    @IBOutlet weak var urgencyCircleFill: UIImageView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileImage2: UIImageView!
    
    @IBOutlet weak var helpStatusLabel: UILabel!
    
    @IBOutlet weak var jobImgCarousel: UICollectionView!
    
    @IBOutlet weak var tagView: TagListView!
    
    // Constraint
    @IBOutlet weak var tagHeight: NSLayoutConstraint!
    
    @objc func backButtonAction(_ sender:UIButton!){
        navigateToListBantuan()
    }
    
    @objc func moreButtonAction(_ sender:UIButton!){
        
    }
    
    func setTagList() {
        tagView.textFont = .FontLibrary.body
        
        if selectedJob.tags != nil {
            tagView.addTags(selectedJob.tags!)
        }
    }
    
    @objc func shareButtonAction(_ sender:UIButton!){
        let items: [Any] = ["This app is my favorite", URL(string: "https://www.apple.com")!]
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        activityController.completionWithItemsHandler = { (nil, completed, _, error) in
            if completed{
                
            } else {
                
            }
        }
        
        present(activityController, animated: true){
        }
    }
    
    @IBAction func helpFinishButton(_ sender: Any) {
        helpFinishButton.setTitle("Selesai", for: .normal)
        helpFinishButton.isHidden = false
        triggerHelpButton = true
        viewDidLoad()
    }
    
    @IBAction func waButton(_ sender: Any) {
    }
    
    private func navigateToListBantuan(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func posterAtauPekerja(){
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagHeight.isActive = false
        
        //collection view pertama
        let imageCell = UINib(nibName: ImageCarouselCVC.identifier,  bundle: nil)
        jobImgCarousel.register(imageCell, forCellWithReuseIdentifier: ImageCarouselCVC.identifier)
        jobImgCarousel.delegate = self
        jobImgCarousel.dataSource = self
        
        //button finish
        helpFinishButton.layer.cornerRadius = 10
        helpFinishButton.setTitle("Saya Bersedia Membantu", for: .normal)
        helpFinishButton.titleLabel?.font = .FontLibrary.button
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
        
        setTagList()
    }
}

extension DetailBantuanVC {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedJob.medias?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = jobImgCarousel.dequeueReusableCell(withReuseIdentifier: ImageCarouselCVC.identifier, for: indexPath) as! ImageCarouselCVC
        cell.imageView.image = selectedJob.medias?[indexPath.row]
        return cell
        
    }
}

extension DetailBantuanVC {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
