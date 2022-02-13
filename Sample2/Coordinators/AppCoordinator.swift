//
//  AppCoordinator.swift
//  Sample2
//
//  Created by Adrian Mateoaea on 12.02.2022.
//

import Foundation
import UIKit

// User
// UserAwareHostingController

class AppCoordinator: Coordinator {
    let rootViewController: UIWindow
    
    init(_ rootViewController: UIWindow) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        // Check if token is set
        if true {
            goToHome()
        } else {
            goToLogin()
        }
    }
    
    func goToLogin() {
        let nc = UINavigationController()
        let c = AuthCoordinator(nc, appCoordinator: self)
        c.start()
        rootViewController.rootViewController = nc
        rootViewController.makeKeyAndVisible()
    }
    
    func goToHome() {
        // Set the token?
        let nc = UITabBarController()
        let c = HomeCoordinator(nc, appCoordinator: self)
        c.start()
        rootViewController.rootViewController = nc
        rootViewController.makeKeyAndVisible()
    }
}
