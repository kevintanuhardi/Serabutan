//
//  AssistanceListVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 29/07/21.
//

import UIKit

class AssistanceListVC: UIViewController, AssistanceListViewModelDelegate {
    
    @IBOutlet weak var assistanceTable: UITableView!
    
    var assistanceListVM = AssistanceListVM()
    // TODO: Remove this on BE integration
    var jobList = [Jobs]()
    var searchResultJob = [Jobs]()
    var sortedFilteredJob = [Jobs]()
    
    let searchBar  = UISearchController()
    var sortBy: AssistanceSortByFilter? = .nearest
    var minValue: Int?
    var maxValue: Int?
    
    var user = UserDefaults.standard.integer(forKey: "loggedUser")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTable()
        subscribeViewModel()
        assistanceListVM.fetchAssistanceList()
        searchResultJob = jobList
        sortedFilteredJob = jobList
        setSortData(sort: .nearest)
        UIApplication
            .shared
            .sendAction(#selector(UIApplication.resignFirstResponder),
                        to: nil, from: nil, for: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        assistanceTable.reloadData()
        setupView()
        
    }
    
    func subscribeViewModel(){
        assistanceListVM.bindAssistanceListViewModelToController = {
            self.bindData()
        }
    }
    
    func bindData() {
        if let parsedAssistance = assistanceListVM.assistanceList {
            jobList = parsedAssistance
            DispatchQueue.main.async {
                self.assistanceTable.reloadData()
            }
        }
    }
    
    func callFinished() {
        self.assistanceTable.reloadData()
    }
    
    @objc func filterButtonTapped(_ sender:UIButton!) {
        navigateToFilter()
    }
    
    @objc func backButtonTapped(_ sender:UIButton!) {
        navigateToHome()
    }
    
}

extension AssistanceListVC {
    
    private func registerTable() {
        assistanceTable.delegate = self
        assistanceTable.dataSource = self
        assistanceTable.register(AssistanceTableViewCell.nib(), forCellReuseIdentifier: AssistanceTableViewCell.identifier)
    }
    
    private func setSortData(sort: AssistanceSortByFilter) {
        
        if sort == .nearest {
            sortedFilteredJob = jobList.sorted { (lhs, rhs) -> Bool in
                return (lhs.distance) < (rhs.distance)
            }
        } else if sort == .newest {
            sortedFilteredJob = jobList.sorted { (lhs, rhs) -> Bool in
                return (lhs.postingDate) > (rhs.postingDate)
            }
        } else if sort == .highestCompensation {
            sortedFilteredJob =  jobList.sorted { (lhs, rhs) -> Bool in
                return (lhs.price) > (rhs.price)
            }
        } else if sort == .lowestCompensation {
            sortedFilteredJob = jobList.sorted { (lhs, rhs) -> Bool in
                return (lhs.price) < (rhs.price)
            }
        }
        
        DispatchQueue.main.async {
            self.assistanceTable?.reloadData()
        }
    }
    
    private func setPriceRange(minCompensation: Int, maxCompensation: Int) {
        sortedFilteredJob = sortedFilteredJob.filter { assistance in
            
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
        
        DispatchQueue.main.async {
            self.assistanceTable?.reloadData()
        }
    }
    
}

extension AssistanceListVC: UITextFieldDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.searchTextField.animateBorder(true, type: .border)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.searchTextField.animateBorder(false, type: .border)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text ?? ""
        
        filterForSearchText(searchText: searchText)
    }
    
    func filterForSearchText(searchText: String) {
        searchResultJob = sortedFilteredJob.filter { assistance in
            if(searchBar.searchBar.text != "") {
                let searchTextMatch = assistance.title?.lowercased().contains(searchText.lowercased())
                
                return searchTextMatch ?? false
            } else {
                return true
            }
        }
        
        assistanceTable.reloadData()
    }
    
}

extension AssistanceListVC: FilterPopUpVCDelegate {
    
    func setSortDataInvoke(assignedSortBy: AssistanceSortByFilter) {
        sortBy = assignedSortBy
        guard let sort = sortBy else { return }
        setSortData(sort: sort)
    }
    
    func setPriceRangeInvoke(minCompensation: Int, maxCompensation: Int) {
        setPriceRange(minCompensation: minCompensation, maxCompensation: maxCompensation)
    }
    
}
