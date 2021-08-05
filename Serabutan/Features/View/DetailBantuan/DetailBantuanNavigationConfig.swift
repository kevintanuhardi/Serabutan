//
//  DetailBantuanNavigationConfig.swift
//  Serabutan
//
//  Created by Gilang Adrian on 03/08/21.
//

import Foundation
import UIKit

extension DetailBantuanVC {
    
    func setupUI(){
        setNavigation()
        setNavigationItems()
        setFont()
        setColor()
        configureText()
    }
    
    func setNavigation() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setNavigationItems() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backButtonAction))
        let moreButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "ellipsis"), primaryAction: nil, menu: popUpMenu())
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareButtonAction))
        
        navigationItem.rightBarButtonItems = [moreButton, shareButton]
        navigationItem.leftBarButtonItem = backButton
    }
    
    func popUpMenu() -> UIMenu{
        
        let laporkan = UIAction(title: "Laporkan", image: UIImage(), attributes: .destructive, handler: { _ in
            print("Laporkan")
        })
        
        let batalkan = UIAction(title: "Batalkan", image: UIImage(), attributes: .destructive, handler: { _ in
            print("Batalkan")
        })
        
        let hapusPermintaan = UIAction(title: "Hapus Permintaan Bantuan", image: UIImage(), attributes: .destructive, handler: { _ in
            print("Hapus Permintaan Bantuan")
        })
        
        let gantiHelper = UIAction(title: "Ganti Helper", image: UIImage(), attributes: .destructive, handler: { _ in
            print("Ganti Helper")
        })
        
        let addMenuItemsHelper = UIMenu(options: .displayInline, children: [laporkan, batalkan, hapusPermintaan, gantiHelper])
        
        return addMenuItemsHelper
        
    }
}
