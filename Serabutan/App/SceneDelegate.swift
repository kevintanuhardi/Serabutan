//
//  SceneDelegate.swift
//  serabutan
//
//  Created by Kevin Tanuhardi on 21/07/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var homeNavigationController: UINavigationController!
    var activityNavigationController: UINavigationController!
    var notificationNavigationController: UINavigationController!
    var profileNavigationController: UINavigationController!
    
    var addJobNavigationController: UINavigationController!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let tabBarController = UITabBarController()
        let homeVC = AssistanceListVC()
        let activityVC = UIViewController()
        let notificationVC = UIViewController()
        let profileVC = ProfileVC()
        let addJobVC = UIViewController()
        
        homeNavigationController = UINavigationController.init(rootViewController: homeVC)
        activityNavigationController = UINavigationController.init(rootViewController: activityVC)
        notificationNavigationController = UINavigationController.init(rootViewController: notificationVC)
        profileNavigationController = UINavigationController.init(rootViewController: profileVC)
        addJobNavigationController = UINavigationController.init(rootViewController: addJobVC)
        tabBarController.viewControllers = [homeNavigationController, activityNavigationController, addJobNavigationController, notificationNavigationController, profileNavigationController]
        
        let homeItem = UITabBarItem(title: "Beranda", image: UIImage(named: "homeIcon"), tag: 0)
        let activityItem = UITabBarItem(title: "Aktivitas", image: UIImage(named: "activityIcon"), tag: 1)
        let notificationItem = UITabBarItem(title: "Notifikasi", image: UIImage(systemName: "bell.fill"), tag: 3)
        let profileItem = UITabBarItem(title: "Profil", image: UIImage(named: "profileIcon"), tag: 4)
        
        let addIconItem = UITabBarItem(title: nil, image: UIImage(named: "AddButton"), tag: 2)
        addIconItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        homeNavigationController.tabBarItem = homeItem
        activityNavigationController.tabBarItem = activityItem
        addJobNavigationController.tabBarItem = addIconItem
        notificationNavigationController.tabBarItem = notificationItem
        profileNavigationController.tabBarItem = profileItem
        
        UITabBar.appearance().tintColor = UIColor.systemBlue
        UITabBar.appearance().unselectedItemTintColor = UIColor.init(named: "silver")
        
        let viewController = tabBarController
        let navigationBar = UINavigationController(rootViewController: viewController)
        navigationBar.isNavigationBarHidden = true
        window?.rootViewController = navigationBar
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
