//
//  AppDelegate.swift
//  IOS6-HW14-AndreiMatveev
//
//  Created by Владелец on 07.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tapBarController = UITabBarController()
        tapBarController.tabBar.backgroundColor = .systemBackground
        
        let firstViewController = UIViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.on.rectangle"), tag: 0)
        
        let secondViewController = UIViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "Для вас", image: UIImage(systemName: "heart.text.square"), tag: 1)
        
       let thirdViewController = AlbumsCollectionViewController()
        thirdViewController.tabBarItem = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        let albumNavigationController = UINavigationController(rootViewController: thirdViewController)
        
        let fourViewController = UIViewController()
        fourViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        tapBarController.setViewControllers([
            firstViewController,
            secondViewController,
            albumNavigationController,
            fourViewController
        ], animated: true)
        
        window?.rootViewController = tapBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

