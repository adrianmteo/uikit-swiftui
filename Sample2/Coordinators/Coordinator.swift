//
//  Coordinator.swift
//  Sample2
//
//  Created by Adrian Mateoaea on 12.02.2022.
//

import Foundation

protocol Coordinator {
    associatedtype ViewController
    var rootViewController: ViewController { get }
    func start()
}
