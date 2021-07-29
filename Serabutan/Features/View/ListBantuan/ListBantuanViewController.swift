//
//  ListBantuanViewController.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 25/07/21.
//

import UIKit

class ListBantuanViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var bantuanCell: UICollectionView!
    
    var models = [BantuanModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Hasil Pencarian"
        
        
        addDummyData()
        setNavigationBarItems()
        
        bantuanCell.delegate = self
        bantuanCell.dataSource = self
        bantuanCell.register(BantuanCollectionViewCell.nib(), forCellWithReuseIdentifier: BantuanCollectionViewCell.identifier)
        
//        bantuanCell.heightAnchor = UICollectionView.AutoresizingMask
        
    }
    
    
    
    
    func addDummyData(){
//        models.append(BantuanModel(urgency: .tinggi, title: "Nurunin Kucing Dari Atap", price: 100000, tags: ["Kucing","Nyangkut"], distance: 600, status: .selesai))
//        models.append(BantuanModel(urgency: .sedang, title: "Bantu Sebar Kotak Syukuran", price: 200000, tags: ["Sebaran","Syukuran"], distance: 1000, status: .diberikan))
//        models.append(BantuanModel(urgency: .rendah, title: "Angkut Rongsokan", price: 150000, tags: ["Angkut","Rongsok"], distance: 1500, status: .diterima))
//        models.append(BantuanModel(urgency: .tinggi, title: "Bantu Cari Kucing Hilang", price: 250000, tags: ["Kucing","Hilang"], distance: 1500, status: .dibatalkan))
    }
    
    func cobaFilter(){
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bantuanCell.dequeueReusableCell(withReuseIdentifier: BantuanCollectionViewCell.identifier, for: indexPath) as! BantuanCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}





