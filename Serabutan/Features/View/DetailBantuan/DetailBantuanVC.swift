//
//  DetailBantuanVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 29/07/21.
//

import UIKit
import TagListView
import NotificationBannerSwift

class DetailBantuanVC: UIViewController, UITextViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate, TagListViewDelegate {
    
    static let identifier = "DetailBantuanVC"
    let currentUser = UserDefaults.standard.integer(forKey: "loggedUser")
    var selectedJob: Jobs?
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var floatingTopView: UIView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    
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
    
    // MARK: - IBActiom
    @IBAction func actionButton(_ sender: Any) {
        confirmationAlert(status: selectedJob?.status ?? .active)
    }
    
    @IBAction func profileButton(_ sender: UIButton) {
        goToProfile(sender: sender.tag)
    }
    
    @IBAction func whatsappButton(_ sender: Any) {
        sendWhatsApp(template: false)
    }
    
    // MARK: - View Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        jobImgCarousel.register(ImageCarouselCVC.nib(), forCellWithReuseIdentifier: ImageCarouselCVC.identifier)
        jobImgCarousel.delegate = self
        jobImgCarousel.dataSource = self
        contentScrollView.delegate = self
        tagView.delegate = self
        
        // TODO: - Remove this, only used in TestFlight to trigger dummy helper
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            self.triggerHelper()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
}
