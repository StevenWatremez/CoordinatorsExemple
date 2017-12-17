//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by Steven WATREMEZ on 17/12/2017.
//  Copyright © 2017 Steven WATREMEZ. All rights reserved.
//

import UIKit

final class MainCoordinator: NavCoordinator {
  
  // MARK: - Properties
  var mainViewController: UIViewController
  internal var childCoordinators: [Coordinator] = []
  
  // MARK: - Private Properties
  private weak var delegate: AuthenticationDelegate?
  
  // MARK: - Init
  init(mainViewController: UIViewController, delegate: AuthenticationDelegate?) {
    self.mainViewController = mainViewController
    self.delegate = delegate
  }
  
  // MARK: - Public Funcs
  func start() {
    self.setupTabBar()
  }
  
  // MARK: Private Funcs
  private func setupTabBar() {
    let coordinator = TabsCoordinator(mainViewController: UITabBarController(), delegate: self.delegate)
    self.push(childCoordinator: coordinator)
    coordinator.start()
    self.navigationController.setViewControllers([coordinator.mainViewController], animated: false)
  }
}
