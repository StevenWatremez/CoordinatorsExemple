//
//  AuthCoordinator.swift
//  Coordinators
//
//  Created by Steven WATREMEZ on 17/12/2017.
//  Copyright © 2017 Steven WATREMEZ. All rights reserved.
//

import UIKit

protocol AuthenticationDelegate: class {
  func didAuthenticated()
  func showAuthentication()
}

final class AuthCoordinator: NavCoordinator {
  
  // MARK: - Properties
  var mainViewController: UIViewController
  internal var childCoordinators: [Coordinator] = []
  
  private weak var delegate: AuthenticationDelegate?
  
  // MARK: - Init
  init(mainViewController: UIViewController, delegate: AuthenticationDelegate?) {
    self.mainViewController = mainViewController
    self.delegate = delegate
    self.navigationController.isNavigationBarHidden = true
  }
  
  // MARK: - Public Funcs
  func start() {
    self.launchAuthentVC()
  }
  
  // MARK: - Private Funcs
  private func launchAuthentVC() {
    let controller = AuthenticationViewController.instance(delegate: self.delegate)
    self.navigationController.setViewControllers([controller], animated: false)
  }
}
