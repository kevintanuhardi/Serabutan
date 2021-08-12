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
        initSearchController()
        
        //Setup Navigation Appearance
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.ColorLibrary.customBlack, .font: UIFont.FontLibrary.largeTitle]
        self.view.backgroundColor = .white
        self.navigationController?.view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.isHidden = true
        
        //Back Button
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        //Setup Right Navigation
        navigationItem.rightBarButtonItem =  UIBarButtonItem(image: UIImage(named: "filterIcon"), style: .plain, target: self, action: #selector(filterButtonAction))
        navigationItem.rightBarButtonItem?.tintColor = .ColorLibrary.accentColor
    }
    
    func initSearchController(){
        //Setup Search Bar
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
        searchBar.searchBar.searchTextField.layer.cornerRadius = 18
        searchBar.searchBar.searchTextField.layer.masksToBounds = true
        searchBar.searchBar.setSearchFieldBackgroundImage(UIImage(), for: .normal)
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

