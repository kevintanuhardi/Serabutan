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
        print("Filter Button tapped")
    }
    
    @objc func backButtonAction(_ sender:UIButton!){
        print("Back Button tapped")
    }
    
    @IBAction func button_clicked(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
}


