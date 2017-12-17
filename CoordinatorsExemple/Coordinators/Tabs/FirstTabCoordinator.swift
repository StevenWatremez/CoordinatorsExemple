//
//  FirstTabCoordinator.swift
//  Coordinators
//
//  Created by Steven WATREMEZ on 17/12/2017.
//  Copyright © 2017 Steven WATREMEZ. All rights reserved.
//

import UIKit

final class FirstTabCoordinator: NavCoordinator {
  
  // MARK: - Properties
  var mainViewController: UIViewController
  internal var childCoordinators: [Coordinator] = []
  
  // MARK: - Private Properties
  private weak var delegate: AuthenticationDelegate?
  
  // MARK: - Init
  init(mainViewController: UIViewController, delegate: AuthenticationDelegate?) {
    self.mainViewController = mainViewController
    self.delegate = delegate
    
    self.navigationController.tabBarItem = UITabBarItem(title: TabsName.first.rawValue, image: nil, tag: TabsTag.first.rawValue)
    self.navigationController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.blue], for: .selected)
    
    self.start()
  }
  
  // MARK: - Public Funcs
  func start() {
    self.launchFirstVC()
  }
  
  // MARK: - Private Funcs
  private func launchFirstVC() {
    let controller = FirstTabViewController.instance(delegate: self, authDelegate: self.delegate)
    self.navigationController.setViewControllers([controller], animated: false)
  }
  
  private func launchDetailCoordinator() {
    let coordinator = DetailCoordinator(mainViewController: UINavigationController(), delegate: self, type: .standalone)
    self.push(childCoordinator: coordinator)
    coordinator.start()
    self.navigationController.present(coordinator.mainViewController, animated: true, completion: nil)
  }
}

extension FirstTabCoordinator: TabDetailDelegate {
  func showDetail() {
    self.launchDetailCoordinator()
  }
}

extension FirstTabCoordinator: DetailDelegate {
  func finish() {
    self.popChildCoordinator()
    self.navigationController.dismiss(animated: true, completion: nil)
  }
}

