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
    
    // TODO: Remove this on BE integration
    var jobList = DummyData.shared.getJobsList(.active)
    var filteredJob = [Jobs]()
    var sortedJob = [Jobs]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assistanceTable.delegate = self
        assistanceTable.dataSource = self
        assistanceTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
        
        filteredJob = jobList
        sortedJob = jobList
        
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
        filteredJob = jobList.filter { assistance in
            if(searchBar.searchBar.text != ""){
                let searchTextMatch = assistance.title?.lowercased().contains(searchText.lowercased())
                return searchTextMatch!
            } else {
                return true
            }
        }
        assistanceTable.reloadData()
    }
    
    func applySortData(){
        let sorting  = sortBy
        
        if sorting == .newest {
            sortedJob = jobList.sorted() { $0.distance < $1.distance }
            print("SORTED BY: Newest is used")
        } else if sorting == .highestCompensation {
            sortedJob = jobList.sorted() { $0.price > $1.price }
            print("SORTED BY: Highest is used")
        } else if sorting == .lowestCompensation {
            sortedJob = jobList.sorted() { $0.price < $1.price }
            print("SORTED BY: Lowest is used")
        } else {
            sortedJob = jobList.sorted() { $0.distance < $1.distance }
            print("SORTED BY: Nearest is used")
        }
        DispatchQueue.main.async {
            self.assistanceTable?.reloadData()
        }
        print("SORTED DATA", sortedJob)
    }
}
