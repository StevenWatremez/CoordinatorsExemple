//
//  AppCoordinator.swift
//  Coordinators
//
//  Created by Steven WATREMEZ on 17/12/2017.
//  Copyright © 2017 Steven WATREMEZ. All rights reserved.
//

import UIKit

final class AppCoordinator: NavCoordinator {
  
  // MARK: - Properties
  var mainViewController: UIViewController
  internal var childCoordinators: [Coordinator] = []
  
  // MARK: - Init
  init(mainViewController: UIViewController) {
    self.mainViewController = mainViewController
    
    self.navigationController.isNavigationBarHidden = true
  }
  
  // MARK: - Public Funcs
  func start() {
    self.startSplashVC()
  }
  
  private func startSplashVC() {
    let controller = SplashViewController.instantiate()
    self.navigationController.setViewControllers([controller], animated: false)
    
    let time = DispatchTime.now() + .seconds(3)
    DispatchQueue.main.asyncAfter(deadline: time) {
      self.startAuthentication()
    }
  }
  
  // MARK: - Private Funcs
  private func startMainApp() {
    let coordinator = MainCoordinator(mainViewController: self.mainViewController, delegate: self)
    self.push(childCoordinator: coordinator)
    coordinator.start()
  }
  
  private func startAuthentication() {
    let coordinator = AuthCoordinator(mainViewController: self.mainViewController, delegate: self)
    self.push(childCoordinator: coordinator)
    coordinator.start()
  }
}

extension AppCoordinator: AuthenticationDelegate {
  func didAuthenticated() {
    self.popChildCoordinator()
    self.startMainApp()
  }
  
  func showAuthentication() {
    self.startAuthentication()
  }
}
