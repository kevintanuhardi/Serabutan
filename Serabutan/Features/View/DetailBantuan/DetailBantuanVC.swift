//
//  DetailBantuanVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 29/07/21.
//

import UIKit
import TagListView

class DetailBantuanVC: UIViewController, UITextViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    final private let stringWithLink = "https://www.instagram.com/yahyayyashaa/"
    var imageShare: [UIImage] = []
    
    //    var selectedJob: Jobs?
    var selectedJob = DummyData.shared.getJobsList()[3]
    
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
    
    var triggerHelpButton : Bool = false
    
    // Collection View Constraint
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionViewBottomMargin: NSLayoutConstraint!
    
    @IBOutlet weak var tagView: TagListView!
    
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
        let activityController = UIActivityViewController(activityItems: [imageShare[0]], applicationActivities: nil)
        
        activityController.completionWithItemsHandler = { (nil, completed, _, error)
            in
            if completed{
                print("completed")
            } else {
                print("canceled")
            }
        }
        
        present(activityController, animated: true){
            print("presented")
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
        
        //collection view pertama
        let imageCell = UINib(nibName: ImageCarouselCVC.identifier,  bundle: nil)
        jobImgCarousel.register(imageCell, forCellWithReuseIdentifier: ImageCarouselCVC.identifier)
        jobImgCarousel.delegate = self
        jobImgCarousel.dataSource = self
        
        //button finish
        helpFinishButton.layer.cornerRadius = 10
        helpFinishButton.setTitle("Saya bersedia membantu", for: .normal)
        
        setTagList()
    }
}

extension DetailBantuanVC {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var collectionCount = 0
        
        collectionCount = selectedJob.medias?.count ?? 0
        
        return collectionCount
        
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

extension DetailBantuanVC {
    
}
