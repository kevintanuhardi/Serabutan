//
//  DetailBantuanVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 29/07/21.
//

import UIKit
import TagListView

class DetailBantuanVC: UIViewController, UITextViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //    var selectedJob: Jobs?
    var selectedJob = DummyData.shared.getJobsList()[2]
    
    @IBOutlet weak var helpFinishButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    
    // Job Related
    @IBOutlet weak var urgencyView: UIView!
    @IBOutlet weak var urgencyCircleFill: UIImageView!
    @IBOutlet weak var urgencyLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    
    @IBOutlet weak var jobPosterAvatar: UIImageView!
    @IBOutlet weak var jobPosterName: UIButton!
    @IBOutlet weak var jobPosterVerified: UIImageView!
    @IBOutlet weak var timePostElapsed: UILabel!
    @IBOutlet weak var distanceToJob: UILabel!
    
    @IBOutlet weak var jobImgCarousel: UICollectionView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagView: TagListView!
    
    // Helper Related
    @IBOutlet weak var helperAvatar: UIImageView!
    @IBOutlet weak var helperName: UIButton!
    @IBOutlet weak var helperVerified: UIImageView!
    @IBOutlet weak var helpStatusLabel: UILabel!
    @IBOutlet weak var helperView: UIView!
    @IBOutlet weak var floatingBottom: UIView!
    
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
        let items: [Any] = [selectedJob.title, URL(string: "https://www.bantuinapp.com/qwerty") as Any]
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
        selectedJob.status = .taken
        configureHelper()
    }
    
    @IBAction func goToProfile(_ sender: UIButton) {
        let userProfile = ProfileVC()
        if sender.tag == 0 {
            userProfile.user = self.selectedJob.jobPosterId
        } else {
            userProfile.user = self.selectedJob.helperId
        }
        
        self.navigationController?.pushViewController(userProfile, animated: true)
    }
    
    @IBAction func sendWhatsApp(_ sender: Any) {
        let message = """
            Halo Pak/Bu \(selectedJob.jobPosterId.name),
            saya *\(DummyData.shared.getUserProfile()[0].name)* dari _BantuinApp_ bersedia membantu Bapak/Ibu untuk _\(selectedJob.title)_.
            Bagaimana saya bisa membantu? 🙂
            """
        let messageURL = message.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let whatsappURL = URL(string: "https://api.whatsapp.com/send?phone=+6281910077402&text=\(messageURL ?? "")")
        UIApplication.shared.open(whatsappURL!)
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
