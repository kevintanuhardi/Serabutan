//
//  DetailBantuanVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 29/07/21.
//

import UIKit

class DetailBantuanVC: UIViewController {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var helpFinishButton: UIButton!
    
    @IBOutlet weak var urgencyView: UIView!
    
    @IBOutlet weak var urgencyLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var jobGiverLabel: UILabel!
    @IBOutlet weak var timePostElapsed: UILabel!
    @IBOutlet weak var distanceToJob: UILabel!
    
    @IBOutlet weak var urgencyCircleFill: UIImageView!
    
    @IBOutlet weak var jobDescTextView: UITextView!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    
    @IBOutlet weak var helpStatusLabel: UILabel!
    
    @IBOutlet weak var jobImgCarousel: UICollectionView!
    @IBOutlet weak var jobTagsCarousel: UICollectionView!
    
    @IBAction func backButton(_ sender: Any) {
    }
    
    @IBAction func shareButton(_ sender: Any) {
    }
    
    @IBAction func moreButton(_ sender: Any) {
    }
    
    @IBAction func helpFinishButton(_ sender: Any) {
        helpFinishButton.setTitle("Saya bersedia membantu", for: .normal)
    }
    
    let data: [String] = ["Urgensi tinggi", "Nurunin Kucing dari Atap", "100.000", "Yahya", "2 menit yang lalu", "600 m"]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        
        switch data[0] {
        case "Urgensi tinggi":
            setColorUrgency(circleColor: #colorLiteral(red: 0.8940042853, green: 0.0821807608, blue: 0.08227711171, alpha: 1), backgroundColorView: .white, cornerRadius: 5, borderWidth: 1, borderColor: #colorLiteral(red: 0.94900769, green: 0.5495878458, blue: 0.5495000482, alpha: 1))
        case "Urgensi sedang":
            setColorUrgency(circleColor: #colorLiteral(red: 0.921562016, green: 0.6400282979, blue: 0.0001737067651, alpha: 1), backgroundColorView: .white, cornerRadius: 5, borderWidth: 1, borderColor: #colorLiteral(red: 0.9762185216, green: 0.862754643, blue: 0.6914620399, alpha: 1))
        case "Urgensi rendah":
            setColorUrgency(circleColor: .green, backgroundColorView: .white, cornerRadius: 5, borderWidth: 1, borderColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) )
        default:
            return
        }
        
        configureText()
        //configurePhoto()
    
        let imageCell = UINib(nibName: ImageCarouselCVC.identifier,  bundle: nil)
        jobImgCarousel.register(imageCell, forCellWithReuseIdentifier: ImageCarouselCVC.identifier)
        jobImgCarousel.delegate = self
        jobImgCarousel.dataSource = self
        
        view.backgroundColor = .white
        jobDescTextView.text = ""
        
        profileImage.image = UIImage(named: "kucing1")

    }
}

extension DetailBantuanVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("Wah gambarnya ditap")
    }
}

extension DetailBantuanVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3 //ngetes
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCarouselCVC.identifier, for: indexPath) as! ImageCarouselCVC
        
        let imageName = "kucing" + "\(indexPath.row + 1)"
        cell.configure(with: UIImage(named: imageName)!)
        
        return cell
    }
    
}

extension DetailBantuanVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 120)
    }
    
    
}
