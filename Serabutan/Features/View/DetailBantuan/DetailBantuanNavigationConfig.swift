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
    
    // MARK: - Navigation Bar Menu (Share & More)
    
    @objc func shareButtonAction(_ sender:UIButton!){
        let items: [Any] = [selectedJob.title!, URL(string: "https://www.bantuinapp.com/qwerty") as Any]
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        activityController.completionWithItemsHandler = { (nil, completed, _, error) in
            if completed{
                print("Page is being shared.")
            } else {
                print("There was an error, ", error as Any)
            }
        }
        present(activityController, animated: true){
        }
    }
    
    func popUpMenu() -> UIMenu{
        var menu = UIMenu()
        let loggedUser = UserDefaults.standard.integer(forKey: "loggedUser")
        let currentUser = DummyData.shared.getUserProfile()[loggedUser].id
        let jobPoster = selectedJob.jobPosterId.id        
        
        let editPermintaan = UIAction(title: "Edit Bantuan", image: UIImage(), attributes: .destructive, handler: { _ in
            print("Laporkan")
        })
        let gantiHelper = UIAction(title: "Ganti Helper", image: UIImage(), attributes: .destructive, handler: { _ in
            self.changeHelpee()
        })
        let hapusPermintaan = UIAction(title: "Hapus Bantuan", image: UIImage(), attributes: .destructive, handler: { _ in
            print("Hapus Bantuan")
        })
        let batalkan = UIAction(title: "Batalkan Lamaran", image: UIImage(), attributes: .destructive, handler: { _ in
            self.cancelHelpee()
        })
        let laporkan = UIAction(title: "Laporkan", image: UIImage(), attributes: .destructive, handler: { _ in
            print("Laporkan")
        })
        
        switch selectedJob.status {
        case .taken :
            if jobPoster == currentUser {
                menu = UIMenu(options: .displayInline, children: [gantiHelper, hapusPermintaan])
            } else {
                menu = UIMenu(options: .displayInline, children: [batalkan, laporkan])
            }
        case .active :
            if jobPoster == currentUser {
                menu = UIMenu(options: .displayInline, children: [editPermintaan, hapusPermintaan])
            } else {
                menu = UIMenu(options: .displayInline, children: [laporkan])
            }
        case .cancelled :
            break
        case .done :
            break
        }
        return menu
    }
}
