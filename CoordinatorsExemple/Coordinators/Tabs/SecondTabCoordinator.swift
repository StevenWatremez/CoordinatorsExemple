//
//  SecondTabCoordinator.swift
//  Coordinators
//
//  Created by Steven WATREMEZ on 17/12/2017.
//  Copyright © 2017 Steven WATREMEZ. All rights reserved.
//

import UIKit

final class SecondTabCoordinator: NavCoordinator {
  
  // MARK: - Private Properties
  var mainViewController: UIViewController
  internal var childCoordinators: [Coordinator] = []
  
  // MARK: - Init
  init(mainViewController: UIViewController) {
    self.mainViewController = mainViewController
    
    self.navigationController.tabBarItem = UITabBarItem(title: TabsName.second.rawValue, image: nil, tag: TabsTag.second.rawValue)
    self.navigationController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.green], for: .selected)
    self.start()
  }
  
  // MARK: - Public Funcs
  func start() {
    self.launchSecondVC()
  }
  
  // MARK: - Private Funcs
  private func launchSecondVC() {
    let controller = SecondTabViewController.instance(delegate: self)
    self.navigationController.setViewControllers([controller], animated: false)
  }
  
  private func launchDetailCoordinator() {
    self.popChildCoordinator()
    let coordinator = DetailCoordinator(mainViewController: self.mainViewController, delegate: self, type: .withNavigation)
    self.push(childCoordinator: coordinator)
    coordinator.start()
  }
}

extension SecondTabCoordinator: TabDetailDelegate {
  func showDetail() {
    self.launchDetailCoordinator()
  }
}

extension SecondTabCoordinator: DetailDelegate {
  func finish() {
    self.navigationController.popToRootViewController(animated: true)
  }
}
