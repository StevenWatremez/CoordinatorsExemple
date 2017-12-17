//
//  TabCoordinator.swift
//  Coordinators
//
//  Created by Steven WATREMEZ on 17/12/2017.
//  Copyright © 2017 Steven WATREMEZ. All rights reserved.
//

import UIKit

protocol TabCoordinator: Coordinator {
  var tabBarController: UITabBarController { get }
}

// MARK: - Default Implementation
extension TabCoordinator {
  var tabBarController: UITabBarController {
    guard let tabBarController = self.mainViewController as? UITabBarController else {
      fatalError("The rootViewController should be a UITabBarController")
    }
    return tabBarController
  }
}
