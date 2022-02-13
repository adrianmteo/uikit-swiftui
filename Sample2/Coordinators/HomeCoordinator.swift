//
//  HomeCoordinator.swift
//  Sample2
//
//  Created by Adrian Mateoaea on 12.02.2022.
//

import Foundation
import UIKit
import SwiftUI

class HomeCoordinator: NSObject, Coordinator, UITabBarControllerDelegate {
    let rootViewController: UITabBarController
    let appCoordinator: AppCoordinator
    
    init(_ rootViewController: UITabBarController, appCoordinator: AppCoordinator) {
        self.rootViewController = rootViewController
        self.appCoordinator = appCoordinator
        super.init()
        rootViewController.delegate = self
    }
    
    var feedCoordinator: ViewCoordinator?
    
    func start() {
        let n1 = UINavigationController()
        n1.tabBarItem.title = "Feed"
        n1.tabBarItem.image = UIImage(systemName: "plus")
        let c1 = ViewCoordinator(n1, appCoordinator: self) { UIHostingController(rootView: FeedView(coordinator: $0)) }
        c1.start()
        feedCoordinator = c1
        
        let n2 = UINavigationController()
        n2.tabBarItem.title = "Search"
        n2.tabBarItem.image = UIImage(systemName: "plus")
        let c2 = ViewCoordinator(n2, appCoordinator: self) { UIHostingController(rootView: FeedView(coordinator: $0)) }
        c2.start()
        
        let n3 = UINavigationController()
        n3.tabBarItem.title = "Discover"
        n3.tabBarItem.image = UIImage(systemName: "plus")
        let c3 = ViewCoordinator(n3, appCoordinator: self) { UIHostingController(rootView: FeedView(coordinator: $0)) }
        c3.start()
        
        let n4 = UINavigationController()
        n4.tabBarItem.title = "Profile"
        n4.tabBarItem.image = UIImage(systemName: "plus")
        let c4 = ViewCoordinator(n4, appCoordinator: self) { UIHostingController(rootView: FeedView(coordinator: $0)) }
        c4.start()
        
        let cc = UIViewController()
        cc.tabBarItem.title = "Create"
        cc.tabBarItem.image = UIImage(systemName: "plus")
        
        rootViewController.setViewControllers([n1, n2, cc, n3, n4], animated: false)
    }
    
    func goToFeed() {
        rootViewController.selectedViewController = feedCoordinator?.rootViewController
        feedCoordinator?.rootViewController.popToRootViewController(animated: true)
    }
    
    func goToLogin() {
        // Logout
        appCoordinator.goToLogin()
    }
    
    func goBack() {
        rootViewController.dismiss(animated: true, completion: nil)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if tabBarController.viewControllers?.firstIndex(of: viewController) == 2 {
            let vc = UIHostingController(rootView: CameraView(coordinator: self).environment(\.colorScheme, .dark))
            vc.modalPresentationStyle = .fullScreen
            tabBarController.present(vc, animated: true, completion: nil)
            return false
        }
        return true
    }
}
