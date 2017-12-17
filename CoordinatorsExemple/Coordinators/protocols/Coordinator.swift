//
//  Coordinator.swift
//  Coordinators
//
//  Created by Steven WATREMEZ on 17/12/2017.
//  Copyright © 2017 Steven WATREMEZ. All rights reserved.
//

import UIKit

protocol Coordinator: class {
  var mainViewController: UIViewController { get }
  var childCoordinators: [Coordinator] { get set }
  func start()
  func push(childCoordinator: Coordinator)
  func popChildCoordinator()
}

// MARK: - Default Implementation
extension Coordinator {
  func push(childCoordinator coordinator: Coordinator) {
    self.childCoordinators.append(coordinator)
    //self.mainViewController.navigationController?.pushViewController(coordinator.mainViewController, animated: true)
  }
  
  func popChildCoordinator() {
    _ = self.childCoordinators.popLast()
    //self.mainViewController.dismiss(animated: true, completion: completion)
  }
}
