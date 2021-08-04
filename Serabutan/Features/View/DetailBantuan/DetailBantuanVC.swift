//
//  DetailBantuanVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 29/07/21.
//

import UIKit

class DetailBantuanVC: UIViewController, UITextViewDelegate {
    
    final private let stringWithLink = "https://www.instagram.com/yahyayyashaa/"
    var imageShare: [UIImage] = []
    
//    var selectedJob: Jobs?
    var selectedJob = DummyData.shared.getJobsList()[0]
    
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
    @IBOutlet weak var jobTagsCell: UICollectionView!
    
    @objc func backButtonAction(_ sender:UIButton!){
        navigateToListBantuan()
    }
    
    @objc func moreButtonAction(_ sender:UIButton!){
        
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
    
    var triggerHelpButton : Bool = false
    
    private func navigateToListBantuan(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func posterAtauPekerja(){
        
    }
    
    func configureText(){
        urgencyLabel.text = selectedJob.urgency.rawValue
        jobTitleLabel.text = selectedJob.title
        salaryLabel.text = selectedJob.price.formattedWithSeparator
        jobGiverLabel.text = selectedJob.jobPosterId.name
        profileImage.image = selectedJob.jobPosterId.avatar
        timePostElapsed.text = "test"
        distanceToJob.text = selectedJob.distance.formattedWithSeparator
    }
    
    func setColorUrgency(circleColor: UIColor, backgroundColorView: UIColor, cornerRadius: CGFloat, borderWidth:CGFloat , borderColor: CGColor){
        urgencyCircleFill.tintColor = circleColor
        urgencyView.backgroundColor = backgroundColorView
        urgencyView.layer.cornerRadius = cornerRadius
        urgencyView.layer.borderWidth = borderWidth
        urgencyView.layer.borderColor = borderColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        helpFinishButton.frame.size = CGSize(width: 350, height: 50)
        helpFinishButton.frame = CGRect(x: 16, y: 760, width: 350, height: 50)
        let x_position:CGFloat = 108
        let y_position:CGFloat = 760
        if triggerHelpButton == true{
            waButton.isHidden = false
            helpFinishButton.frame.size = CGSize(width: 266, height: 50)
            helpFinishButton.frame = CGRect(x: x_position, y: y_position, width: helpFinishButton.frame.width, height: helpFinishButton.frame.height)
            let margin = waButton.layoutMarginsGuide
            helpFinishButton.trailingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 50).isActive = true
        }
        
        self.tabBarController?.tabBar.isHidden = true
        
        configureText()
        
        //collection view pertama
        let imageCell = UINib(nibName: ImageCarouselCVC.identifier,  bundle: nil)
        jobImgCarousel.register(imageCell, forCellWithReuseIdentifier: ImageCarouselCVC.identifier)
        jobImgCarousel.delegate = self
        jobImgCarousel.dataSource = self
        
        //collection view kedua
        let tagCell = UINib(nibName: TagsCVC.identifier, bundle: nil)
        jobTagsCell.register(tagCell, forCellWithReuseIdentifier: TagsCVC.identifier)
        jobTagsCell.delegate = self
        jobTagsCell.dataSource = self

        //button finish
        helpFinishButton.layer.cornerRadius = 10
        helpFinishButton.setTitle("Saya bersedia membantu", for: .normal)
    }
}

extension DetailBantuanVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == jobImgCarousel){
            return 3 //blabla.count
        } else if (collectionView == jobTagsCell){
            return 4
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == jobImgCarousel){
            let cell = jobImgCarousel.dequeueReusableCell(withReuseIdentifier: ImageCarouselCVC.identifier, for: indexPath) as! ImageCarouselCVC
            let imageName = "kucing" + "\(indexPath.row + 1)"
            cell.configure(with: UIImage(named: imageName)!)
            imageShare.append(UIImage(named: imageName) ?? UIImage())
            return cell
            
        }else if(collectionView == jobTagsCell){
            let cell2 = jobTagsCell.dequeueReusableCell(withReuseIdentifier: TagsCVC.identifier, for: indexPath) as! TagsCVC
            return cell2
        }
        return UICollectionViewCell()
    }
}

extension DetailBantuanVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension DetailBantuanVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if(collectionView == jobImgCarousel){
            return CGSize(width: 120, height: 120)
        }else if(collectionView == jobTagsCell){
            return CGSize(width: 58, height: 37)
        }
        return CGSize(width: 120, height: 120)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
