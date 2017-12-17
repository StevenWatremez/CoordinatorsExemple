//
//  DetailCoordinator.swift
//  CoordinatorsExemple
//
//  Created by Steven WATREMEZ on 17/12/2017.
//  Copyright © 2017 Steven WATREMEZ. All rights reserved.
//

import UIKit

protocol FirstDetailDelegate: class {
  func next()
}

protocol DetailDelegate: class {
  func finish()
}

final class DetailCoordinator: NavCoordinator {
  
  // MARK: - Properties
  var mainViewController: UIViewController
  internal var childCoordinators: [Coordinator] = []
  
  private weak var delegate: DetailDelegate?
  private let type: CoordinatorType
  
  // MARK: - Init
  init(mainViewController: UIViewController, delegate: DetailDelegate?, type: CoordinatorType) {
    self.mainViewController = mainViewController
    self.delegate = delegate
    self.type = type
  }
  
  // MARK: - Public Funcs
  func start() {
    self.launchFirstDetailVC()
  }
  
  // MARK: - Private Funcs
  private func launchFirstDetailVC() {
    let controller = FirstDetailViewController.instance(delegate: self)
    switch type {
    case .standalone: self.navigationController.setViewControllers([controller], animated: false)
    case .withNavigation: self.navigationController.pushViewController(controller, animated: true)
    }
  }
  
  private func launchSecondDetailVC() {
    let controller = SecondDetailViewController.instance(delegate: self.delegate)
    self.navigationController.pushViewController(controller, animated: true)
  }
}

extension DetailCoordinator: FirstDetailDelegate {
  func next() {
    self.launchSecondDetailVC()
  }
}
