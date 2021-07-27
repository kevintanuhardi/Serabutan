//
//  DetailBantuanVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 27/07/21.
//

import UIKit

class DetailBantuanVC: UIViewController {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    
    @IBOutlet weak var urgencyLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var jobDescLabel: UILabel!
    @IBOutlet weak var helpStatusLabel: UILabel!
    
    @IBOutlet weak var jobImgCarousel: UICollectionView!
    @IBOutlet weak var jobTagsCarousel: UICollectionView!
    
    @IBAction func backButton(_ sender: Any) {
    }
    
    @IBAction func shareButton(_ sender: Any) {
    }
    
    @IBAction func moreButton(_ sender: Any) {
    }
    
    @IBAction func helpButton(_ sender: Any) {
    }
    
    //var imageCarousel: [UIImage] =  []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageCarousel.append(UIImage(named: "kucing1"))
//        imageCarousel.append(UIImage(named: "kucing2"))
//        imageCarousel.append(UIImage(named: "kucing3"))
        
        
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 350, height: 120)
//        jobImgCarousel.collectionViewLayout = layout
        
        //jobImgCarousel.register(ImageCarouselCVC.nib(), forCellWithReuseIdentifier: ImageCarouselCVC.identifier)
        let imageCell = UINib(nibName: ImageCarouselCVC.identifier,  bundle: nil)
        jobImgCarousel.register(imageCell, forCellWithReuseIdentifier: ImageCarouselCVC.identifier)
        jobImgCarousel.delegate = self
        jobImgCarousel.dataSource = self

        // Do any additional setup after loading the view.
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
        return CGSize(width: 350, height: 120)
    }
    
    
}
