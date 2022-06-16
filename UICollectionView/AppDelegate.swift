//
//  AppDelegate.swift
//  UICollectionView
//
//  Created by Виталий Таран on 16.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .white
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .white
        let viewController = ViewController()
        let fourthVC = UIViewController()
        fourthVC.view.backgroundColor = .white
        
        let navigationController = UINavigationController(rootViewController: viewController)
        let tabBarController = UITabBarController()
        
        firstVC.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "photo.on.rectangle"), tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "For You", image: UIImage(systemName: "heart.text.square.fill"), tag: 1)
        navigationController.tabBarItem = UITabBarItem(title: "Albums", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        fourthVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        tabBarController.setViewControllers([firstVC, secondVC, navigationController, fourthVC], animated: true)
        tabBarController.selectedViewController = navigationController
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}



