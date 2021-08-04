//
//  DetailBantuanVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 29/07/21.
//

import UIKit

class DetailBantuanVC: UIViewController{

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
    
    @IBOutlet weak var urgencyCircleFill: UIImageView!
    
    @IBOutlet weak var jobDescTextView: UITextView!
    
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
        
    }
    
    @IBAction func helpFinishButton(_ sender: Any) {
        helpFinishButton.setTitle("Selesai", for: .normal)
        helpFinishButton.isHidden = false
        triggerHelpButton = true
        viewDidLoad()
    }
    
    @IBAction func waButton(_ sender: Any) {
    }
    
    let data: [String] = ["Urgensi tinggi", "Nurunin Kucing dari Atap", "100.000", "Yahya", "2 menit yang lalu", "600 m"]
    
    var triggerHelpButton : Bool = false
    
    private func navigateToListBantuan(){
        //let homeVC = AssistanceListVC()
        tabBarController?.tabBar.isHidden = true
        //self.navigationController?.pushViewController(AssistanceListVC, animated: true)
    }
    
    private func shareButton(){
        
    }
    
    func configureText(){
        urgencyLabel.text = data[0]
        jobTitleLabel.text = data[1]
        salaryLabel.text = data[2]
        jobGiverLabel.text = data[3]
        timePostElapsed.text = data[4]
        distanceToJob.text = data[5]
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
        setupNavigationBarItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        waButton.isHidden = true
        
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
        
        switch data[0] {
        case "Urgensi tinggi":
            setColorUrgency(circleColor: #colorLiteral(red: 0.8940042853, green: 0.0821807608, blue: 0.08227711171, alpha: 1), backgroundColorView: #colorLiteral(red: 0.9999305606, green: 0.928509295, blue: 0.9317803979, alpha: 1), cornerRadius: 10, borderWidth: 1, borderColor: #colorLiteral(red: 0.94900769, green: 0.5495878458, blue: 0.5495000482, alpha: 1))
        case "Urgensi sedang":
            setColorUrgency(circleColor: #colorLiteral(red: 0.921562016, green: 0.6400282979, blue: 0.0001737067651, alpha: 1), backgroundColorView: #colorLiteral(red: 0.9999197125, green: 0.9729309678, blue: 0.9283476472, alpha: 1), cornerRadius: 10, borderWidth: 1, borderColor: #colorLiteral(red: 0.9762185216, green: 0.862754643, blue: 0.6914620399, alpha: 1))
        case "Urgensi rendah":
            setColorUrgency(circleColor: .green, backgroundColorView: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 10, borderWidth: 1, borderColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) )
        default:
            return
        }
        
        configureText()
        
        //profile image
//        UIImage.layer.borderWidth = 1.0
//        UIImage.layer.maskstoBounds = false
//        UIImage.layer.borderColor = UIColor.white.cgColor
//        UIImage.layer.cornerRadius = image.frame.size.height/2
//        UIImage.clipsToBounds = true
        //profileImage = UIImageView(frame: CGRect(0, 0, 100, 100))
        profileImage.image = UIImage(named: "kucing1")
        
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
        
        //textview
        view.backgroundColor = .white
        jobDescTextView.isEditable = false
        jobDescTextView.isSelectable = false
        jobDescTextView.text = "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        jobDescTextView.sizeToFit()
        jobDescTextView.translatesAutoresizingMaskIntoConstraints = true
        
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
            return cell

        }else if(collectionView == jobTagsCell){
            let cell2 = jobTagsCell.dequeueReusableCell(withReuseIdentifier: TagsCVC.identifier, for: indexPath) as! TagsCVC
            return cell2
        }
        return UICollectionViewCell()
    }
}

extension DetailBantuanVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if let tappedCell = collectionView.cellForItem(at: indexPath) as? ImageCarouselCVC{
            print("Wah gambarnya ditap")
        } else if let tappedCell2 = collectionView.cellForItem(at: indexPath) as? ImageCarouselCVC{
            print("Wah tagsnya ditap")
        }
    }
}

extension DetailBantuanVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if(collectionView == jobImgCarousel){
            return CGSize(width: 130, height: 120)
        }else if(collectionView == jobTagsCell){
            return CGSize(width: 58, height: 37)
        }
        return CGSize(width: 130, height: 120)
        
    }
}
