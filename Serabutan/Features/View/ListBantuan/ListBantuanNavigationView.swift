//
//  ListBantuanNavigationBar.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 27/07/21.
//

import Foundation
import UIKit

extension AssistanceListVC {
    
    func setupView(){
        title = "Bantuan Dibutuhkan"
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 24)!
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        tabBarController?.tabBar.isHidden = true
        
        navigationTextField()
        navigationBackButton()
        navigationFilterButton()
        setGradientBottom()
    }
    
    func navigationTextField(){
        let searchTextField = UITextField(frame: CGRect(x: 0, y: 0, width: navigationController!.navigationBar.frame.width - 80, height: 34))
        searchTextField.contentMode = .scaleAspectFit
        searchTextField.layer.masksToBounds = true
        searchTextField.layer.borderWidth = 0.5
        searchTextField.layer.borderColor = UIColor(red: 0.81, green: 0.81, blue: 0.81, alpha: 1.00).cgColor
        searchTextField.layer.cornerRadius = 17
        searchTextField.layer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: searchTextField.frame.height))
        searchTextField.leftViewMode = .always
        navigationItem.titleView = searchTextField
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
