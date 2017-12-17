//
//  NavCoordinator.swift
//  Coordinators
//
//  Created by Steven WATREMEZ on 17/12/2017.
//  Copyright © 2017 Steven WATREMEZ. All rights reserved.
//

import UIKit

protocol NavCoordinator: Coordinator {
  var navigationController: UINavigationController { get }
}

// MARK: - Default Implementation
extension NavCoordinator {
  var navigationController: UINavigationController {
    guard let nc = self.mainViewController as? UINavigationController else {
      fatalError("The rootViewController should be a UINavigationController")
    }
    return nc
  }
}
