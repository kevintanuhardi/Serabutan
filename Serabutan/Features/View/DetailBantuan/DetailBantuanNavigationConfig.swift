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
        
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setupLeftNavItem(){
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backButtonAction(_:)))
        backButton.tintColor = UIColor.black
        
        navigationItem.leftBarButtonItem = backButton
        
    }
    
    func setupRightNavItems(){
     
        let moreButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "ellipsis"), primaryAction: nil, menu: popUpMenu())
        moreButton.tintColor = UIColor.black

        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareButtonAction))
        shareButton.tintColor = UIColor.black
        
        navigationItem.rightBarButtonItems = [moreButton, shareButton]
        
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
        
        let addMenuItemsHelper = UIMenu(options: .displayInline, children: [laporkan])
        let addMenuItemsHelper2 = UIMenu(options: .displayInline, children: [batalkan])
        
        let addMenuItemsPoster = UIMenu(options: .displayInline, children: [hapusPermintaan])
        let addMenuItemsPoster2 = UIMenu(options: .displayInline, children: [hapusPermintaan, gantiHelper])
        
        return addMenuItemsHelper
        
    }
    
    func popUpMenuOptions(){
        
    }
}
