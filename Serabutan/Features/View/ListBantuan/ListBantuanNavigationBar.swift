//
//  ListBantuanNavigationBar.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 27/07/21.
//

import Foundation
import UIKit

extension ListBantuanViewController {
    
    
    func setNavigationBarItems(){
       // navigationController?.navigationBar.backgroundColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.00)
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 24)!
        ]

        UINavigationBar.appearance().titleTextAttributes = attrs
        
        
        //self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let searchTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 120, height: 25))
        searchTextField.contentMode = .scaleAspectFit
        navigationItem.titleView = searchTextField
        
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "Back")?.withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        backButton.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        let filterButton = UIButton(type: .system)
        filterButton.setImage(UIImage(named: "Filter")?.withRenderingMode(.alwaysOriginal), for: .normal)
        filterButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItem =  UIBarButtonItem(customView: filterButton)
        
        
    }
}
