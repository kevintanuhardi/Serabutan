//
//  AssistanceListVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import UIKit

class AssistanceListVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var assistanceTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        assistanceTable.delegate = self
        assistanceTable.dataSource = self
        assistanceTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
        

    }
    
    @objc func filterButtonAction(_ sender:UIButton!){
        let myViewController = FilterPopUpVC(nibName: "FilterPopUpVC", bundle: nil)
        self.present(myViewController, animated: true, completion: nil)
    }
    
    @objc func backButtonAction(_ sender:UIButton!){
        let myViewController = HomeVC(nibName: "HomeVC", bundle: nil)
        self.present(myViewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
}


