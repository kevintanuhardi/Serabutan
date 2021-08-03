//
//  DetailBantuanNavigationConfig.swift
//  Serabutan
//
//  Created by Gilang Adrian on 03/08/21.
//

import Foundation
import UIKit

extension DetailBantuanVC: UITextViewDelegate{
    
    func setupNavigationBarItems(){
        setupLeftNavItem()
        setupRightNavItems()
    }
    
    func setupLeftNavItem(){
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "Back")?.withRenderingMode(.alwaysOriginal), for: .normal)
        //backButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        backButton.tintColor = UIColor.black
        backButton.addTarget(self, action: #selector(backButtonAction(_:)), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    func setupRightNavItems(){
        let moreButton = UIButton(type: .system)
        moreButton.setImage(UIImage(named: "more")?.withRenderingMode(.alwaysOriginal), for: .normal)
        //moreButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        moreButton.tintColor = UIColor.black
        moreButton.addTarget(self, action: #selector(moreButtonAction(_:)), for: .touchUpInside)
        
        let shareButton = UIButton(type: .system)
        shareButton.setImage(UIImage(named: "Share")?.withRenderingMode(.alwaysOriginal), for: .normal)
        //shareButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        shareButton.tintColor = UIColor.black
        shareButton.addTarget(self, action: #selector(shareButtonAction(_:)), for: .touchUpInside)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: moreButton), UIBarButtonItem(customView: shareButton)]
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = true
    }
}
