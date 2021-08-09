//
//  TabBarController.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 09/08/21.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let menuButton = UIButton(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        self.delegate = self
        setupVCs()
        setupMiddleButton()
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            menuButton.frame.origin.y = self.view.bounds.height - menuButton.frame.height - self.view.safeAreaInsets.bottom
        }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: HomeVC(), title: "Home", image: UIImage(named: "homeIcon")!, tag: 0),
            createNavController(for: ActivityVC(), title: "Aktivitas", image: UIImage(named: "activityIcon")!, tag: 1),
            createNavController(for: HomeVC(), title: "", image: UIImage(), tag: 2),
            createNavController(for: UIViewController(), title: "Notifikasi", image: UIImage(systemName: "bell.fill")!, tag: 3),
            createNavController(for: ProfileVC(), title: "Profil", image: UIImage(named: "profileIcon")!, tag: 4)
        ]
    }
    
    func setupMiddleButton() {
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
        menuButton.frame = CGRect(x: 0, y: 0, width: tabBarItemSize.width, height: tabBar.frame.size.height)
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.x = self.view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        menuButton.imageView?.contentMode = .scaleAspectFill
        menuButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: -10, right: 0)
        menuButton.setImage(UIImage(named: "AddButton"), for: .normal)
        self.view.addSubview(menuButton)
        self.view.layoutIfNeeded()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage,
                                         tag: Int) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        navController.navigationBar.prefersLargeTitles = false
        rootViewController.navigationItem.title = title
        return navController
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // If 'Buat Permohonan' is pressed
        if item.tag == 2 {
            let editProfile = EditProfileVC()
            self.navigationController?.pushViewController(editProfile, animated: true)
            self.show(editProfile, sender: self)
        }
    }
}
