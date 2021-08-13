//
//  DetailBantuanVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 29/07/21.
//

import UIKit
import TagListView
import NotificationBannerSwift

class DetailBantuanVC: UIViewController, UITextViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //    var selectedJob: Jobs?
    var selectedJob = DummyData.shared.getJobsList()[2]
    let currentUser = UserDefaults.standard.integer(forKey: "loggedUser")
    
    @IBOutlet weak var helpFinishButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    
    // Job Related
    @IBOutlet weak var urgencyView: UIView!
    @IBOutlet weak var urgencyCircleFill: UIImageView!
    @IBOutlet weak var urgencyLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    
    @IBOutlet weak var posterStackView: UIStackView!
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
    @IBOutlet weak var separatorHeight: NSLayoutConstraint!
    
    @IBAction func helpFinishButton(_ sender: Any) {
        switch selectedJob.status {
        case .active :
            whatsappAlert()
        case .taken :
            finishedAlert()
        case .cancelled:
            break
        case .done:
            break
        }
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
    
    @IBAction func whatsappButton(_ sender: Any) {
        sendWhatsApp(template: false)
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            self.triggerHelper()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    func triggerHelper() {
        // Auto assign helper
        guard (selectedJob.status == .active) && (selectedJob.jobPosterId.id == currentUser) else { return }
        
        let helperIndex = Int.random(in: 0..<DummyData.shared.getUserProfile().count)
        selectedJob.status = .taken
        selectedJob.helperId = DummyData.shared.getUserProfile()[helperIndex]
        configureHelper()
        
        // Show floating notification
        FloatingNotification.shared.showNotification(type: .helpeeAssigned, job: selectedJob)
    }
    
}
