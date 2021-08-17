//
//  DetailBantuanStyling.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 04/08/21.
//

import UIKit
import TagListView

extension DetailBantuanVC {
    
    func setupUI(){
        setStyle()
        configureText()
        configureHelper()
    }
    
    // MARK: - Navigation Items
    func setNavigation() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.largeTitleDisplayMode = .never
        tabBarController?.tabBar.isHidden = true
        
        // Back Button
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                           style: UIBarButtonItem.Style.plain,
                                                           target: nil,
                                                           action: nil)
        
        // Assigning navigation items
        setNavigationItems()
    }
    
    func setNavigationItems() {
        let moreButton = UIBarButtonItem(title: nil,
                                         image: UIImage(systemName: "ellipsis"),
                                         primaryAction: nil,
                                         menu: popUpMenu())
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(shareButtonAction))
        
        navigationItem.rightBarButtonItems = [moreButton, shareButton]
        
        // Remove items if job is finished or cancelled
        if selectedJob?.status == .cancelled || selectedJob?.status == .done {
            navigationItem.rightBarButtonItems?.removeAll()
        }
    }
    
    // MARK: - Static UI
    func setStyle() {
        // Delegate
        jobImgCarousel.register(ImageCarouselCVC.nib(), forCellWithReuseIdentifier: ImageCarouselCVC.identifier)
        jobImgCarousel.delegate = self
        jobImgCarousel.dataSource = self
        contentScrollView.delegate = self
        tagView.delegate = self
        
        urgencyView.layer.borderWidth = 0.5
        urgencyView.layer.cornerRadius = urgencyView.frame.height / 2
        urgencyView.layer.masksToBounds = true
        jobPosterAvatar.layer.cornerRadius = jobPosterAvatar.frame.height / 2
        jobPosterAvatar.layer.masksToBounds = true
        jobPosterVerified.isHidden = !(selectedJob?.jobPosterId.isVerified ?? false)
        helperAvatar.layer.cornerRadius = jobPosterAvatar.frame.height / 2
        helperAvatar.layer.masksToBounds = true
        actionButton.layer.cornerRadius = 10
        helperView.layer.cornerRadius = 5
        helperView.layer.masksToBounds = true
        floatingBottom.dropShadow(opacity: 0.25, offset: -5, scale: true)
        separatorHeight.constant = 0.5
        jobImgCarousel.isHidden = (selectedJob?.medias?.isEmpty ?? true)
        tagView.isHidden = (selectedJob?.tags?.isEmpty ?? true)
        
        // Set Font
        jobTitleLabel.font = .FontLibrary.largeTitle
        jobPosterName.titleLabel?.font = .FontLibrary.textLink1
        helperName.titleLabel?.font = .FontLibrary.textLink1
        salaryLabel.font = .FontLibrary.title2
        timePostElapsed.font = .FontLibrary.body
        distanceToJob.font = .FontLibrary.body
        descriptionLabel.font = .FontLibrary.headline
        helpStatusLabel.font = .FontLibrary.body
        actionButton.titleLabel?.font = .FontLibrary.button
        tagView.textFont = .FontLibrary.body
        
        // Set Color
        jobTitleLabel.textColor = .ColorLibrary.customBlack
        jobPosterName.tintColor = .ColorLibrary.customBlack
        salaryLabel.textColor = .ColorLibrary.darkGrey
        timePostElapsed.textColor = .ColorLibrary.darkGrey
        distanceToJob.textColor = .ColorLibrary.darkGrey
        descriptionLabel.textColor = .ColorLibrary.customBlack
        helpStatusLabel.textColor = .ColorLibrary.darkGrey
        
        guard let urgency = selectedJob?.urgency else { return }
        setStatusView(urgency: urgency)
        guard tagHeight != nil else { return }
        tagHeight.isActive = false
    }
    
    func configureText() {
        urgencyLabel.text = selectedJob?.urgency.rawValue
        jobTitleLabel.text = selectedJob?.title
        salaryLabel.text = StringFormatter().priceFormatting(amount: selectedJob?.price ?? 0)
        jobPosterName.titleLabel?.text = selectedJob?.jobPosterId.name
        jobPosterName.setTitle(selectedJob?.jobPosterId.name, for: .normal)
        jobPosterAvatar.image = selectedJob?.jobPosterId.avatar
        timePostElapsed.text = StringFormatter().relativeDateFormatter(date: selectedJob?.postingDate ?? Date())
        distanceToJob.text = StringFormatter().distance(selectedJob?.distance ?? 0.0)
        descriptionLabel.text = selectedJob?.desc
        
        guard let tags = selectedJob?.tags else { return }
        tagView.removeAllTags()
        tagView.addTags(tags)
    }
    
    // MARK: - Dynamic UI
    func setStatusView(urgency: Urgency) {
        var colorSolid = UIColor()
        var colorTransparent = UIColor()
        
        switch urgency {
        case .high :
            colorSolid = .ColorLibrary.highUrgency
            colorTransparent = .ColorLibrary.highUrgencyBackground
            urgencyLabel.text = urgency.rawValue
        case .medium:
            colorSolid = .ColorLibrary.mediumUrgency
            colorTransparent = .ColorLibrary.mediumUrgencyBackground
            urgencyLabel.text = urgency.rawValue
        case .low:
            colorSolid = .ColorLibrary.lowUrgency
            colorTransparent = .ColorLibrary.lowUrgencyBackground
            urgencyLabel.text = urgency.rawValue
        }
        
        urgencyCircleFill.tintColor = colorSolid
        urgencyView.layer.borderColor = colorSolid.cgColor
        urgencyView.layer.backgroundColor = colorTransparent.cgColor
        
    }
    
    func checkUser() {
        if (selectedJob?.helperId == nil || selectedJob?.helperId?.id == currentUser) && assignSelf == true {
            // If the job is taken by current user or is currently nil
            selectedJob?.helperId = DummyData.shared.getUserProfile()[currentUser]
            helperAvatar.isHidden = true
            helperVerified.isHidden = true
            helperName.setTitle("Anda", for: .normal)
        } else {
            // If the job was taken by other user
            helperAvatar.image = selectedJob?.helperId?.avatar
            helperName.setTitle(selectedJob?.helperId?.name, for: .normal)
            helperAvatar.isHidden = false
            helperAvatar.isHidden = false
            helperVerified.isHidden = !(selectedJob?.helperId?.isVerified ?? false)
        }
    }
    
    func configureHelper() {
        setNavigationItems()
        checkUser()
        floatingBottom.isHidden = false
        
        switch selectedJob?.status {
        case .taken :
            helperName.isHidden = false
            chatButton.isHidden = false
            actionButton.setTitle("Selesai", for: .normal)
            helpStatusLabel.text = "bersedia membantu."
        case .active:
            helperAvatar.isHidden = true
            helperName.isHidden = true
            chatButton.isHidden = true
            helperVerified.isHidden = true
            floatingBottom.isHidden = (selectedJob?.jobPosterId.id == currentUser)
            actionButton.setTitle("Saya Bersedia Membantu", for: .normal)
            helpStatusLabel.text = "Belum ada yang bersedia membantu."
        case .cancelled:
            actionButton.setTitle("Bantuan Dibatalkan", for: .normal)
            actionButton.backgroundColor = .ColorLibrary.mediumGrey
            chatButton.isHidden = true
        case .done:
            actionButton.setTitle("Bantuan Telah Selesai", for: .normal)
            actionButton.backgroundColor = .systemGreen
            chatButton.isHidden = true
        case .none:
            break
        }
    }
    
    func confirmationAlert(status: JobStatus) {
        switch status {
        case .active :
            whatsappAlert()
        case .taken :
            finishedAlert()
        case .cancelled :
            break
        case .done :
            break
        }
        configureHelper()
    }
    
    func triggerHelper() {
        guard let assignedNotif = selectedJob else { return }
        guard (assignedNotif.status == .active) && (assignedNotif.jobPosterId.id == currentUser) else { return }
        
        let helperIndex = Int.random(in: 0..<(DummyData.shared.getUserProfile().count - 1))
        assignedNotif.status = .taken
        assignedNotif.helperId = DummyData.shared.getUserProfile()[helperIndex]
        configureHelper()
        
        FloatingNotification.shared.showNotification(type: .helpeeAssigned, job: assignedNotif )
    }
    
    // MARK: - Menu
    func popUpMenu() -> UIMenu {
        var menu = UIMenu()
        let loggedUser = UserDefaults.standard.integer(forKey: "loggedUser")
        let currentUser = DummyData.shared.getUserProfile()[loggedUser].id
        let jobPoster = selectedJob?.jobPosterId.id
        
        let editPermintaan = UIAction(title: "Edit Bantuan",
                                      image: UIImage(),
                                      attributes: .destructive,
                                      handler: { _ in
                                        print("Laporkan")
                                      })
        let gantiHelper = UIAction(title: "Ganti Helper",
                                   image: UIImage(),
                                   attributes: .destructive,
                                   handler: { _ in
                                    self.changeHelpee()
                                   })
        let hapusPermintaan = UIAction(title: "Hapus Bantuan",
                                       image: UIImage(),
                                       attributes: .destructive,
                                       handler: { _ in
                                        self.cancelJob()
                                       })
        let batalkan = UIAction(title: "Batalkan Lamaran",
                                image: UIImage(),
                                attributes: .destructive,
                                handler: { _ in
                                    self.cancelHelpee()
                                })
        let laporkan = UIAction(title: "Laporkan",
                                image: UIImage(),
                                attributes: .destructive,
                                handler: { _ in
                                    print("Laporkan")
                                })
        
        // Adjust menu according to job status & logged user role
        switch selectedJob?.status {
        case .taken :
            if jobPoster == currentUser {
                menu = UIMenu(options: .displayInline, children: [gantiHelper, hapusPermintaan])
            } else {
                menu = UIMenu(options: .displayInline, children: [batalkan, laporkan])
            }
        case .active :
            if jobPoster == currentUser {
                menu = UIMenu(options: .displayInline, children: [editPermintaan, hapusPermintaan])
            } else {
                menu = UIMenu(options: .displayInline, children: [laporkan])
            }
        case .cancelled :
            break
        case .done :
            break
        case .none :
            break
        }
        return menu
    }
    
    // MARK: - Alert
    // Shown when user tap on 'Finish' button
    func finishedAlert() {
        let alert = UIAlertController(title: "Bantuan Telah Selesai?",
                                      message: "Mohon pastikan bantuan anda telah selesai.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .destructive,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .default,
                                      handler: { _ in
                                        self.selectedJob?.status = .done
                                        self.configureHelper()
                                        self.goToRateProfile()
                                      }))
        present(alert, animated: true, completion: nil)
    }
    
    // Shown when user applying for the job
    func whatsappAlert() {
        let alert = UIAlertController(title: "Bantu Helpee?",
                                      message: "Dengan pilih Ya anda akan diarahkan ke Whatsapp Messenger.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .destructive,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .default,
                                      handler: { _ in
                                        self.assignSelf = true
                                        self.selectedJob?.status = .taken
                                        self.configureHelper()
                                        self.sendWhatsApp(template: true)
                                      }))
        present(alert, animated: true, completion: nil)
    }
    
    // Shown when user want to change their helpee once it's assigned
    func changeHelpee() {
        let alert = UIAlertController(title: "Ganti Helpee?",
                                      message: "Anda yakin ingin mengganti helpee? Aksi ini tidak dapat dibatalkan.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .destructive,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .default,
                                      handler: { _ in
                                        self.selectedJob?.status = .active
                                        self.selectedJob?.helperId = nil
                                        self.configureHelper()
                                      }))
        present(alert, animated: true, completion: nil)
    }
    
    // Shown when user (helpee) want to withdraw their application
    func cancelJob() {
        let alert = UIAlertController(title: "Hapus Bantuan?",
                                      message: "Anda yakin ingin menghapus bantuan? Aksi ini tidak dapat dibatalkan.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .destructive,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .default,
                                      handler: { _ in
                                        self.selectedJob?.status = .cancelled
                                        self.setNavigationItems()
                                      }))
        present(alert, animated: true, completion: nil)
    }
    
    // Shown when user (helpee) want to withdraw their application
    func cancelHelpee() {
        let alert = UIAlertController(title: "Batalkan Bantuan?",
                                      message: "Anda yakin ingin membatalkan bantuan? Aksi ini tidak dapat dibatalkan.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .destructive,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .default,
                                      handler: { _ in
                                        self.assignSelf = false
                                        self.selectedJob?.status = .active
                                        self.selectedJob?.helperId = nil
                                        self.configureHelper()
                                      }))
        present(alert, animated: true, completion: nil)
    }
    
    // Edit the job detail, only available when the status is active (no helpee assigned)
    func editJobDetail() {
        let alert = UIAlertController(title: "Bantu Helpee?",
                                      message: "Dengan pilih Ya anda akan diarahkan ke Whatsapp Messenger.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .destructive,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .default,
                                      handler: { _ in
                                        print("Editing Job Detail")
                                      }))
        present(alert, animated: true, completion: nil)
    }
}
