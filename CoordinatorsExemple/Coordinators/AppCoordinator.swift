//
//  AppCoordinator.swift
//  Coordinators
//
//  Created by Steven WATREMEZ on 17/12/2017.
//  Copyright © 2017 Steven WATREMEZ. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
  
  // MARK: - Properties
  var mainViewController: UIViewController
  internal var childCoordinators: [Coordinator] = []
  
  // MARK: - Init
  init(mainViewController: UIViewController) {
    self.mainViewController = mainViewController
  }
  
  // MARK: - Public Funcs
  func start() {
    self.startSplashVC()
  }
  
  private func startSplashVC() {
    let controller = SplashViewController.instantiate()
    self.displayContentController(for: controller, in: self.mainViewController)
    
    let time = DispatchTime.now() + .seconds(3)
    DispatchQueue.main.asyncAfter(deadline: time) {
      self.startAuthentication()
    }
  }
  
  // MARK: - Private Funcs
  private func startMainApp() {
    self.hideContentController()
    let coordinator = MainCoordinator(mainViewController: UINavigationController(), delegate: self)
    self.push(childCoordinator: coordinator)
    coordinator.start()
    self.displayContentController(for: coordinator.mainViewController, in: self.mainViewController)
  }
  
  private func startAuthentication() {
    self.hideContentController()
    let coordinator = AuthCoordinator(mainViewController: UINavigationController(), delegate: self)
    self.push(childCoordinator: coordinator)
    coordinator.start()
    self.displayContentController(for: coordinator.mainViewController, in: self.mainViewController)
  }
  
  private func displayContentController(for content: UIViewController, in container: UIViewController) {
    container.addChildViewController(content)
    content.view.frame = container.view.frame
    container.view.addSubview(content.view)
    content.didMove(toParentViewController: container)
  }
  
  private func hideContentController() {
    self.mainViewController.childViewControllers.forEach { (viewController: UIViewController) in
      viewController.willMove(toParentViewController: nil)
      viewController.view.removeFromSuperview()
      viewController.removeFromParentViewController()
    }
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
