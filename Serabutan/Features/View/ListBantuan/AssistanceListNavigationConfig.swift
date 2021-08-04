//
//  ListBantuanNavigationBar.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 27/07/21.
//

import Foundation
import UIKit

extension AssistanceListVC{
    
    func setupView(){
        title = "Bantuan Dibutuhkan"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.ColorLibrary.customBlack, .font: UIFont.FontLibrary.largeTitle]
        view.backgroundColor = .ColorLibrary.lightGrey
        
        initSearchController()
        navigationBackButton()
        navigationFilterButton()
        setGradientBottom()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func initSearchController(){
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
    }
    
    func navigationBackButton(){
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "Back")?.withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        backButton.tintColor = UIColor.black
        backButton.addTarget(self, action: #selector(backButtonAction(_:)), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    func navigationFilterButton(){
        let filterButton = UIButton(type: .system)
        filterButton.setImage(UIImage(named: "Filter")?.withRenderingMode(.alwaysOriginal), for: .normal)
        filterButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        filterButton.addTarget(self, action: #selector(filterButtonAction(_:)), for: .touchUpInside)
        navigationItem.rightBarButtonItem =  UIBarButtonItem(customView: filterButton)
    }
    
    func setGradientBottom(){
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        gradient.colors = [UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.00).cgColor, UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientView.layer.addSublayer(gradient)
    }
    
}

