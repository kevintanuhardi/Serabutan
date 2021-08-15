//
//  TabBarController.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 09/08/21.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .ColorLibrary.accentColor
        tabBar.unselectedItemTintColor = .ColorLibrary.mediumGrey
        self.delegate = self
        setupVCs()
        setupMiddleButton()
    }
    
    private func setupVCs() {
        
        var loggedUser = UserDefaults.standard.integer(forKey: "loggedUser")
        let profileVC = ProfileVC()
        
        (loggedUser >= DummyData.shared.getUserProfile().count) ? (loggedUser -= 1) : (loggedUser += 0)
        UserDefaults.standard.set(loggedUser, forKey: "loggedUser")
        profileVC.user = DummyData.shared.getUserProfile()[loggedUser]
        
        viewControllers = [
            createNavController(for: HomeVC(), title: "Home", image: UIImage(systemName: "house")!, tag: 0),
            createNavController(for: ActivityVC(), title: "Aktivitas", image: UIImage(systemName: "text.book.closed")!, tag: 1),
            createNavController(for: HomeVC(), title: "", image: UIImage(), tag: 2),
            createNavController(for: UIViewController(), title: "Notifikasi", image: UIImage(systemName: "bell")!, tag: 3),
            createNavController(for: profileVC, title: "Profil", image: UIImage(systemName: "person")!, tag: 4)
        ]
    }
    
    private func setupMiddleButton() {
        let button = UIButton()
        button.setImage(UIImage(named: "AddButton"), for: .normal)
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buatPermohonan), for: .touchUpInside)

        tabBar.addSubview(button)
        tabBar.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        tabBar.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor).isActive = true
    }
    
    @objc private func buatPermohonan() {
        let buatPermohonan = NewAssistanceVC()
		buatPermohonan.delegate = self
        let buatPermohonanController = UINavigationController.init(rootViewController: buatPermohonan)
        self.show(buatPermohonanController, sender: self)
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage,
                                         tag: Int) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        navController.navigationBar.prefersLargeTitles = false
        return navController
    }
}

extension TabBarController: NewAssitanceDelegate {
	func navigateToDetailProduct(job: Jobs) {
		self.selectedIndex = 1

		let detailVC = DetailBantuanVC()
		detailVC.selectedJob = job
        (self.selectedViewController as? UINavigationController)?.pushViewController(detailVC, animated: true)
	}
}
