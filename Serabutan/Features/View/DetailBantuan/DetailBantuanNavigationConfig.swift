//
//  DetailBantuanNavigationConfig.swift
//  Serabutan
//
//  Created by Gilang Adrian on 03/08/21.
//

import Foundation
import UIKit

extension DetailBantuanVC {
    
    func setNavigation() {
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .white
        
        navigationItem.largeTitleDisplayMode = .never
        self.tabBarController?.tabBar.isHidden = true
        
        //Back Button
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    func setNavigationItems() {

        let moreButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "ellipsis"), primaryAction: nil, menu: popUpMenu())
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareButtonAction))
        
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
        
        let addMenuItemsHelper = UIMenu(options: .displayInline, children: [laporkan, batalkan, hapusPermintaan, gantiHelper])
        
        return addMenuItemsHelper
        
    }

}
