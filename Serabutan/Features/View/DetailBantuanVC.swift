//
//  DetailBantuanVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 27/07/21.
//

import UIKit

class DetailBantuanVC: UIViewController {
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var shareImage: UIImageView!
    @IBOutlet weak var moreImage: UIImageView!
    
    @IBOutlet weak var urgencyLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var jobDescLabel: UILabel!
    @IBOutlet weak var helpStatusLabel: UILabel!
    
    @IBOutlet weak var jobImgCarousel: UICollectionView!
    @IBOutlet weak var jobTagsCarousel: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
