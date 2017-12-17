//
//  TabCoordinator.swift
//  Coordinators
//
//  Created by Steven WATREMEZ on 17/12/2017.
//  Copyright © 2017 Steven WATREMEZ. All rights reserved.
//

import UIKit

enum TabsName: String {
  case first
  case second
}

enum TabsTag: Int {
  case first = 1
  case second
}

final class TabsCoordinator: TabCoordinator {
  
  // MARK: - Private Properties
  var mainViewController: UIViewController
  internal var childCoordinators: [Coordinator] = []
  
  // MARK: - Private Properties
  private weak var delegate: AuthenticationDelegate?
  
  private struct TabsCoordinators {
    let first: FirstTabCoordinator
    let second: SecondTabCoordinator
    func all() -> [NavCoordinator] { return [first, second] }
  }
  
  private lazy var coordinators: TabsCoordinators = TabsCoordinators(
    first: FirstTabCoordinator(mainViewController: UINavigationController(), delegate: self.delegate),
    second: SecondTabCoordinator(mainViewController: UINavigationController())
  )
  
  // MARK: - Init
  init(mainViewController: UIViewController, delegate: AuthenticationDelegate?) {
    self.mainViewController = mainViewController
    self.delegate = delegate
  }
  
  // MARK: - Public Funcs
  func start() {
    self.tabBarController.viewControllers = coordinators.all().map({ $0.navigationController })
  }
}
