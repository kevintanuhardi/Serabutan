//
//  BantuanCollectionViewCell.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 25/07/21.
//

import UIKit

class BantuanCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
   
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tagCell: UICollectionView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var helperProfilePicture: UIImageView!
    @IBOutlet weak var helperName: UILabel!
    @IBOutlet weak var whatsappView: UIView!
    @IBOutlet weak var hubungiButton: UIButton!
    @IBOutlet weak var whatsappIcon: UIImageView!
    
    static let identifier  = "BantuanCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "BantuanCollectionViewCell", bundle: nil)
    }
    
    var models = [BantuanModel]()
    var tagData = [TagModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tagCell.register(TagCollectionViewCell.nib(), forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        tagCell.dataSource = self
        tagCell.delegate = self
        
        tagData.append(TagModel(name: "Test"))
        tagData.append(TagModel(name: "123"))
        tagData.append(TagModel(name: "ABCDEFGHIJKL"))
        tagData.append(TagModel(name: "ABC"))
        tagData.append(TagModel(name: "ABC"))
        tagData.append(TagModel(name: "ABC"))
        tagData.append(TagModel(name: "ABC"))
    }
    
    public func configure(with model: BantuanModel){
        
        //card
        self.cardView.layer.cornerRadius = 5
        self.cardView.layer.shadowColor = UIColor.black.cgColor
        self.cardView.layer.shadowOpacity = 0.075
        self.cardView.layer.shadowOffset = .zero
        self.cardView.layer.shadowRadius = 5
        self.cardView.layer.shadowPath = UIBezierPath(rect: cardView.bounds).cgPath
        self.cardView.layer.shouldRasterize = true
        self.cardView.layer.rasterizationScale = UIScreen.main.scale
        self.cardView.translatesAutoresizingMaskIntoConstraints = false
        self.cardView.heightAnchor.constraint(equalToConstant: 170).isActive = true

        //status
        self.statusView.layer.cornerRadius = 5
        self.statusView.layer.backgroundColor = model.status?.getBGColor().cgColor
        self.statusImage.tintColor = model.status?.getSymbolColor()
        
        self.statusImage.translatesAutoresizingMaskIntoConstraints = false
        self.statusImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        self.statusImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        self.statusImage.image = model.status?.getImage()
        var status: String{
            if model.status != Status.dibatalkan{
                return model.status!.rawValue
            } else {
                return ""
            }
        }
        self.statusLabel.text = status


        //Body
        self.titleLabel.text = model.title
        self.priceLabel.text = "\(model.price!)"
        var distance:  String {
            if model.distance! < 1000{
                return "\(model.distance!) m"
            } else {
                return "\(Double(model.distance!)/1000) km"
            }
        }
        self.distanceLabel.text = distance

        //bottomView
//      self.bottomView.removeFromSuperview()
        //self.bottomView.isHidden = true
        self.helperProfilePicture.image = UIImage(named: "ProfileIcon")
        self.helperName.text = "Nama Helper"
        self.whatsappView.layer.cornerRadius = 5
        self.whatsappView.layer.backgroundColor = UIColor(red: 0.09, green: 0.68, blue: 0.21, alpha: 0.10).cgColor
        self.whatsappView.layer.borderColor = UIColor(red: 0.09, green: 0.68, blue: 0.21, alpha: 1.00).cgColor
        self.whatsappView.layer.borderWidth = 1
        self.hubungiButton.setTitle("Hubungi", for: .normal)
        self.whatsappIcon.image = UIImage(named: "whatsapp")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //ini blm bener
        return tagData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tagCell.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as! TagCollectionViewCell
        cell.configure(with: tagData[indexPath.row])
        return cell
    }
}
