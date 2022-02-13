//
//  ViewCoordinator.swift
//  Sample2
//
//  Created by Adrian Mateoaea on 12.02.2022.
//

import Foundation
import UIKit
import SwiftUI

class ViewCoordinator: Coordinator {
    let rootViewController: UINavigationController
    let initial: (ViewCoordinator) -> UIViewController
    let appCoordinator: HomeCoordinator
    var parentCoordinator: ViewCoordinator?
    
    init(_ rootViewController: UINavigationController, appCoordinator: HomeCoordinator, _ initial: @escaping (ViewCoordinator) -> UIViewController) {
        self.rootViewController = rootViewController
        self.appCoordinator = appCoordinator
        self.initial = initial
    }
    
    func start() {
        let vc = initial(self)
        rootViewController.pushViewController(vc, animated: false)
    }
    
    func goToFeed() {
        if let parentCoordinator = parentCoordinator {
            rootViewController.dismiss(animated: true) {
                parentCoordinator.goToFeed()
            }
            return
        }
        
        appCoordinator.goToFeed()
    }
    
    func goToProfile() {
        let vc = UIHostingController(rootView: ProfileView(coordinator: self))
        rootViewController.pushViewController(vc, animated: true)
    }
    
    func goToComments() {
        let nc = UINavigationController()
        
        let c = ViewCoordinator(nc, appCoordinator: appCoordinator) { UIHostingController(rootView: CommentsView(coordinator: $0)) }
        c.parentCoordinator = self
        c.start()
        
        rootViewController.present(nc, animated: true, completion: nil)
    }
    
    func goToLogin() {
        appCoordinator.goToLogin()
    }
}
