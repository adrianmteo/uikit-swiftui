//
//  AuthCoordinator.swift
//  Sample2
//
//  Created by Adrian Mateoaea on 12.02.2022.
//

import Foundation
import UIKit
import SwiftUI

class AuthCoordinator: Coordinator {
    let rootViewController: UINavigationController
    let appCoordinator: AppCoordinator
    
    init(_ rootViewController: UINavigationController, appCoordinator: AppCoordinator) {
        self.rootViewController = rootViewController
        self.appCoordinator = appCoordinator
    }
    
    func start() {
        let vc = UIHostingController(rootView: LoginView(coordinator: self))
        rootViewController.pushViewController(vc, animated: false)
    }
    
    func goToHome() {
        appCoordinator.goToHome()
    }
}
