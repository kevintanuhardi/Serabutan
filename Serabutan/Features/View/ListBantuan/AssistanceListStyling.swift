//
//  ListBantuanNavigationBar.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 27/07/21.
//

import Foundation
import UIKit

extension AssistanceListVC{
    
    func setupView() {
        title = "Bantuan Dibutuhkan"
        setupSearchController()
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.ColorLibrary.customBlack, .font: UIFont.FontLibrary.largeTitle]
        self.view.backgroundColor = .white
        self.navigationController?.view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.isHidden = true
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItem =  UIBarButtonItem(image: UIImage(named: "filterIcon"), style: .plain, target: self, action: #selector(filterButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .ColorLibrary.accentColor
    }
    
    func setupSearchController() {
        searchBar.loadViewIfNeeded()
        searchBar.searchResultsUpdater = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.searchBar.enablesReturnKeyAutomatically = false
        searchBar.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        searchBar.searchBar.delegate = self
        assistanceTable.keyboardDismissMode = .onDrag
        
        searchBar.searchBar.placeholder = "Cari Bantuan"
        searchBar.searchBar.searchTextField.layer.borderWidth = 0.5
        searchBar.searchBar.searchTextField.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        searchBar.searchBar.searchTextField.layer.cornerRadius = 5
        searchBar.searchBar.searchTextField.layer.masksToBounds = true
        searchBar.searchBar.setSearchFieldBackgroundImage(UIImage(), for: .normal)
        searchBar.searchBar.searchTextField.backgroundColor = .ColorLibrary.white
        searchBar.searchBar.dropShadow(opacity: 0.25, offset: 0, scale: true)
    }
    
}

