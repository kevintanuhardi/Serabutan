//
//  AssistanceListVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import UIKit

class AssistanceListVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating, UITextFieldDelegate {
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var assistanceTable: UITableView!
    
    let searchBar  = UISearchController()
    var sortBy: AssistanceSortByFilter?
    var minValue: Int?
    var maxValue: Int?
    
    var data: [BantuanModel] = [
        BantuanModel(urgency: .sedang, title: "Cuci Motor", price: 100000, tags: ["Cuci", "Motor"], distance: 600, status: .diberikan),
        BantuanModel(urgency: .rendah, title: "Angkut Rongsokan", price: 100000, tags: ["Angkut", "Rongsokan"], distance: 1000, status: .diberikan),
        BantuanModel(urgency: .rendah, title: "Bantu Sebar Kotak Syukuran", price: 100000, tags: ["Sebar", "Kotak"], distance: 0, status: .diberikan),
        BantuanModel(urgency: .tinggi, title: "Nurunin Kucing dari Atap", price: 200000, tags: ["Kucing", "Kasian", "Nyangkut"], distance: 200, status: .diberikan)
    ]
    var filteredData = [BantuanModel]()
    var sortedData = [BantuanModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assistanceTable.delegate = self
        assistanceTable.dataSource = self
        assistanceTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
        filteredData = data
        sortedData = data
        applySortData()
        assistanceTable.reloadData()
        UIApplication
            .shared
            .sendAction(#selector(UIApplication.resignFirstResponder),
                        to: nil, from: nil, for: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        assistanceTable.reloadData()
        loadAssistanceData()
        setupView()
    }
    
    private func loadAssistanceData(){
        //GET DATA FROM NETWORK
    }
    
    @objc func filterButtonAction(_ sender:UIButton!){
        let myViewController = FilterPopUpVC(nibName: "FilterPopUpVC", bundle: nil)
        self.present(myViewController, animated: true, completion: nil)
    }
    
    @objc func backButtonAction(_ sender:UIButton!){
        navigateToHome()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!
        filterForSearchText(searchText: searchText)
    }
    
    func filterForSearchText(searchText: String){
        filteredData = data.filter { assistance in
            if(searchBar.searchBar.text != ""){
                let searchTextMatch = assistance.title!.lowercased().contains(searchText.lowercased())
                return searchTextMatch
            } else {
                return true
            }
        }
        assistanceTable.reloadData()
    }
    
    func applySortData(){
        let sorting  = sortBy
        
        if sorting == .newest {
            sortedData = data.sorted() { $0.distance! < $1.distance! }
            print("SORTED BY: Newest is used")
        } else if sorting == .highestCompensation {
            sortedData = data.sorted() { $0.price! > $1.price! }
            print("SORTED BY: Highest is used")
        } else if sorting == .lowestCompensation {
            sortedData = data.sorted() { $0.price! < $1.price! }
            print("SORTED BY: Lowest is used")
        } else {
            sortedData = data.sorted() { $0.distance! < $1.distance! }
            print("SORTED BY: Nearest is used")
        }
        DispatchQueue.main.async {
            self.assistanceTable?.reloadData()
        }
        print("SORTED DATA", sortedData)
    }
}
