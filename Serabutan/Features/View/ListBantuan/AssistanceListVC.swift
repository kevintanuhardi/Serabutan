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
    var sortBy: AssistanceSortByFilter? = .nearest
    var minValue: Int?
    var maxValue: Int?
    
    // TODO: Remove this on BE integration
    var jobList = DummyData.shared.getJobsList(.active)
    var filteredJob = [Jobs]()
    var sortedJob = [Jobs]()
    
    var user = UserDefaults.standard.integer(forKey: "loggedUser")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTable()
        filteredJob = jobList
        sortedJob = jobList
        
        UIApplication
            .shared
            .sendAction(#selector(UIApplication.resignFirstResponder),
                        to: nil, from: nil, for: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        assistanceTable.reloadData()
        setupView()
        setSortData()
    }
    
    @objc func filterButtonAction(_ sender:UIButton!){
        let destination = FilterPopUpVC(nibName: "FilterPopUpVC", bundle: nil)
        print("Destination Sort BY: ", destination.sortBy as Any)
        self.present(destination, animated: true, completion: nil)
    }
    
    @objc func backButtonAction(_ sender:UIButton!){
        navigateToHome()
    }
    
}

extension AssistanceListVC {
    
    func registerTable() {
        assistanceTable.delegate = self
        assistanceTable.dataSource = self
        assistanceTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Search Function
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.searchTextField.animateBorder(true, type: .border)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.searchTextField.animateBorder(false, type: .border)
    }
    
    func navigateToHome() {
        let homeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!
        filterForSearchText(searchText: searchText)
    }
    
    func filterForSearchText(searchText: String){
        filteredJob = sortedJob.filter { assistance in
            if(searchBar.searchBar.text != ""){
                let searchTextMatch = assistance.title?.lowercased().contains(searchText.lowercased())
                return searchTextMatch!
            } else {
                return true
            }
        }
        assistanceTable.reloadData()
    }
    
    //MARK: - Sorting and Filtering from Pop UP
    func setSortData(){
        guard let sort = sortBy else { return }
        print("SORT will be applied: ", sort)
        
        if sort == .nearest {
            sortedJob = jobList.sorted { (lhs, rhs) -> Bool in
                return (lhs.distance) < (rhs.distance)
            }
        } else if sort == .newest {
            sortedJob = jobList.sorted { (lhs, rhs) -> Bool in
                return (lhs.postingDate) < (rhs.postingDate)
            }
        } else if sort == .highestCompensation {
            sortedJob = jobList.sorted { (lhs, rhs) -> Bool in
                return (lhs.price) > (rhs.price)
            }
        } else if sort == .lowestCompensation {
            sortedJob = jobList.sorted { (lhs, rhs) -> Bool in
                return (lhs.distance) < (rhs.distance)
            }
        }
        print("Before Applied: ", jobList)
        print("SORT Applied: ", sortedJob)
        
        DispatchQueue.main.async {
            self.assistanceTable?.reloadData()
        }
    }
    
    func setPriceRange(minCompensation: Int, maxCompensation: Int){
        sortedJob = sortedJob.filter { assistance in
            if(minCompensation == .zero) {
                let result = assistance.price >= minCompensation
                return result
            } else if(maxCompensation == .zero) {
                let result = assistance.price <= maxCompensation
                return result
            } else if(minCompensation != .zero && maxCompensation != .zero) {
                let result = assistance.price >= minCompensation && assistance.price <= maxCompensation
                return result
            } else {
                return true
            }
        }
        print("PRICE RANGE: ", sortedJob)
        
        DispatchQueue.main.async {
            self.assistanceTable?.reloadData()
        }
    }
}
