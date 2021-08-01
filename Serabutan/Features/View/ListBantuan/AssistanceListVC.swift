//
//  AssistanceListVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import UIKit

class AssistanceListVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var assistanceTable: UITableView!
    lazy var searchBar: UISearchBar = UISearchBar()
    var sortBy: Any? = "Paling Dekat"
    var minValue: Int?
    var maxValue: Int?
    
    var data: [BantuanModel] = [
        BantuanModel(urgency: .rendah, title: "Bantu Sebar Kotak Syukuran", price: 100000, tags: ["Sebar", "Kotak"], distance: 0, status: .diberikan),
        BantuanModel(urgency: .tinggi, title: "Nurunin Kucing dari Atap", price: 200000, tags: ["Kucing", "Kasian", "Nyangkut"], distance: 200, status: .diberikan),
        BantuanModel(urgency: .sedang, title: "Cuci Motor", price: 100000, tags: ["Cuci", "Motor"], distance: 600, status: .diberikan),
        BantuanModel(urgency: .rendah, title: "Angkut Rongsokan", price: 100000, tags: ["Angkut", "Rongsokan"], distance: 1000, status: .diberikan)
    ]
    var filteredData: [BantuanModel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assistanceTable.delegate = self
        assistanceTable.dataSource = self
        assistanceTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
        searchBar.delegate = self
        filteredData = data
        
        UIApplication
            .shared
            .sendAction(#selector(UIApplication.resignFirstResponder),
                        to: nil, from: nil, for: nil)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadAssistanceData()
        setupView()
    }
    
    private func loadAssistanceData(){
        //GET DATA FROM NETWORK
    }
    
    private func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func filterButtonAction(_ sender:UIButton!){
        let myViewController = FilterPopUpVC(nibName: "FilterPopUpVC", bundle: nil)
        self.present(myViewController, animated: true, completion: nil)
    }
    
    @objc func backButtonAction(_ sender:UIButton!){
        navigateToHome()
    }
    
    private func navigateToHome() {
        let homeVC = HomeVC()
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []

        if searchText == "" {
            filteredData = data
        } else {
            for job in data {
                if job.title!.lowercased().contains(searchText.lowercased()){
                    filteredData.append(job)
                }
            }
        }
        self.assistanceTable.reloadData()
    }
}
